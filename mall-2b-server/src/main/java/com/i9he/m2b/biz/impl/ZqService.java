package com.i9he.m2b.biz.impl;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IZqUserService;
import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.ZqUser;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.zq.util.EncryptData;
import com.i9he.zq.util.HttpRequest;
import com.i9he.zq.util.ZqConfigUtil;
import com.i9he.zq.util.ZqSubmit;

@Service("zqService")
public class ZqService {

	@Autowired
	private ZqConfigUtil zqConfigUtil;
	@Autowired
	private IZqUserService zqUserService;
	//给众签推送用户
	public String createUser(ZqUser zqUser) throws IOException {

		// 测试用户
		int user = (int) (Math.random() * (9999 - 1000 + 1)) + 1000;

		Map<String, String> map = new HashMap<String, String>();
		map.put("zqid", zqConfigUtil.getZqid());
		map.put("user_name", zqUser.getUserName());
		map.put("user_type", zqUser.getUserType());
		// TODO 测试
//		map.put("user_code", user + "");
		
		map.put("user_code", zqUser.getUserCode());
		map.put("telephone_num", zqUser.getTelephoneNum());
		map.put("province", zqUser.getProvince());
		map.put("city", zqUser.getCity());
		map.put("address", zqUser.getAddress());
		
		if(zqUser.getUserType().equals("1")){
			map.put("scan_file", "");
			map.put("principal", "1");
			map.put("certificate", "");
			map.put("id_card", zqUser.getIdCard());
			map.put("id_card_scan_file1", zqUser.getId_card_scan_file1());
			map.put("id_card_scan_file2", zqUser.getId_card_scan_file2());
		}else{
			map.put("scan_file", zqUser.getScan_file());
			map.put("principal", zqUser.getPrincipal());
			map.put("certificate", zqUser.getCertificate());
			map.put("id_card", "");
			map.put("id_card_scan_file1", "");
			map.put("id_card_scan_file2", "");
		}
		map.put("return_url", "");
		map.put("notify_url", zqConfigUtil.getRegister_notify_url());

		EncryptData ed = new EncryptData();
		
		String signVal = ed.encrptData(map, zqConfigUtil.getPrivate_key());
		map.put("ws_sign_val", signVal);
		
		zqUser.setCreateTime(new Date());
		HttpRequest hr = new HttpRequest();
		String response_str = hr.sendPost(zqConfigUtil.getRequest_url() + "userReg", map);
		JSONObject json =  JSONObject.fromObject(response_str);
		System.out.println(json.toString());
		String resultCode =json.getJSONObject("map").getString("result_code");
		if(resultCode.equals("0")){
			//用户推送成功  添加用户
			zqUserService.insert(zqUser);
		}
		return resultCode;
	
	}
	//生成合同模板
	public JSONObject createForTemplate() throws IOException{
		//合同编号
		String contract_num = "9he"+System.currentTimeMillis();
		//填充合同数据   TODO 我也不知道是什么
		String json_val = "{\"jsonVal\":[{\"didian\":\"本合同为测试内容\",\"beginTime\":\"2016年12月2日\",\"chengren\":\""+2+"\",\"ertong\":\"3\"}]}";
		
		//合同签署人
		Integer userId = SessionUtil.getSessionUser().getId();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("zqid", zqConfigUtil.getZqid());
		
		//TODO 模板编号 这里要改一下
		map.put("template_id",zqConfigUtil.getTemplate_id());
		map.put("contract_num", contract_num);
		map.put("contract_name", zqConfigUtil.getContract_name());
		map.put("sign_num", "2");
		map.put("json_val", json_val);
		//回调通知
		map.put("notify_url", zqConfigUtil.getRegister_notify_url());
		map.put("return_url", "");
		//电商平台ID + 签署人ID
		map.put("signer_list", zqConfigUtil.getUser_code()+","+userId);
		
		EncryptData ed = new EncryptData();
		String signVal = ed.encrptData(map,zqConfigUtil.getPrivate_key());
		map.put("ws_sign_val", signVal);  
		HttpRequest hr = new HttpRequest();
		
		String response_str = hr.sendPost(zqConfigUtil.getRequest_url()+"createForTemplate", map);
		return JSONObject.fromObject(response_str);
	}
	
	
	//单用户自动签署
	public String signAutomatic() throws IOException{
		
		Integer userId = SessionUtil.getSessionUser().getId();
		//创建合同模板
		JSONObject jsonObject =  this.createForTemplate();
		JSONObject jsonMap = jsonObject.getJSONObject("map");
		String createTpl = jsonMap.getString("result_code");
		System.out.println("生成模板返回信息["+jsonObject.toString()+"]");
		if("0".equals(createTpl)){
			//创建合同模板成功    创建单用户合同
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer", userId+"");
			//合同编号
			map.put("contract_num", jsonMap.getString("contract_num")); 
			map.put("return_url", "");
			map.put("notify_url", zqConfigUtil.getRegister_notify_url());
			EncryptData ed = new EncryptData();
			String ws_sign_val = ed.encrptData(map,zqConfigUtil.getPrivate_key());
			map.put("ws_sign_val", ws_sign_val); 
			HttpRequest hr = new HttpRequest();
			//请求参数
			String visitUrl = zqConfigUtil.getRequest_url()+"/signAutomatic";
			//发送post请求
			String response_str = hr.sendPost(visitUrl, map);
			JSONObject data =  JSONObject.fromObject(response_str);
			JSONObject dataMap = jsonObject.getJSONObject("map");
			String state = dataMap.getString("result_code");
			System.out.println("自动签署返回信息["+data.toString()+"]");
			if("0".equals(state)){
				//签署成功  保存合同
				Contract contract= new Contract();
				//合同编号
				contract.setContractNum(dataMap.getString("contract_num"));
				contract.setUserState(1);
				contract.setUserTime(new Date());
				contract.setUserId(userId);
				contract.setContractStatus(0);
				contract.setContractType(0);
				zqUserService.insertContract(contract);
			}
			return state;
		}else{
			return null;
		}
	}
	
	public String showView(String contractNum) throws IOException{
		
		Map<String, String> map = new HashMap<String, String>();  
		map.put("zqid", zqConfigUtil.getZqid());
		map.put("contract_num", contractNum);
		
		//计算签名值
		EncryptData ed = new EncryptData();
		String ws_sign_val = ed.encrptData(map,zqConfigUtil.getPrivate_key());
		map.put("ws_sign_val", ws_sign_val);
		
		//发送post请求
		HttpRequest hr = new HttpRequest();
		String response_str = hr.sendPost(zqConfigUtil.getRequest_url()+"viewContractImg", map);
		return response_str;
	}
	
	public String down(String contractNum) throws Exception{
		String zqid  = zqConfigUtil.getZqid();//接口平台用户唯一标示
		
		String private_key=zqConfigUtil.getPrivate_key();//私钥签名
		
		Map<String, String> map = new HashMap<String, String>();  //将参数装进集合中进行签名发送post请求
		
		map.put("zqid", zqid); 
		map.put("contract_num", contractNum); 
		
		//计算签名值
		EncryptData ed = new EncryptData();
		String ws_sign_val = ed.encrptData(map,private_key);
		map.put("ws_sign_val", ws_sign_val);
		
		//发送构造表单让此页面自动提交
		return ZqSubmit.buildRequest(map, zqConfigUtil.getRequest_url()+"/download");
	} 
	
	public String signByWriting() throws Exception{
		
		JSONObject jsonObject =  this.createForTemplate();
		JSONObject jsonMap = jsonObject.getJSONObject("map");
		String createTpl = jsonMap.getString("result_code");
		System.out.println("生成模板返回信息["+jsonObject.toString()+"]");
		if("0".equals(createTpl)){
		
			Integer userId = SessionUtil.getSessionUser().getId();
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer", userId+"");
			map.put("contract_num", jsonMap.getString("contract_num")); //合同编号
			map.put("sign_type", "3"); 
			map.put("return_url", zqConfigUtil.getReturn_url());//回调函地 址
			map.put("notify_url", zqConfigUtil.getReturn_url());//回调函地址
	
			EncryptData ed = new EncryptData();
			String ws_sign_val = ed.encrptData(map,zqConfigUtil.getPrivate_key());
			map.put("ws_sign_val", ws_sign_val); 
		    return  ZqSubmit.buildRequest(map,zqConfigUtil.getRequest_url()+"/signByWritingPanel");
		}else{
			return null;	
		}
	}
	
	public String signByValidationCode() throws Exception {

		Integer userId = SessionUtil.getSessionUser().getId();
		JSONObject jsonObject = this.createForTemplate();
		JSONObject jsonMap = jsonObject.getJSONObject("map");
		String createTpl = jsonMap.getString("result_code");
		System.out.println("生成模板返回信息[" + jsonObject.toString() + "]");
		if ("0".equals(createTpl)) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer", userId + "");
			map.put("contract_num", jsonMap.getString("contract_num"));
			map.put("sign_type", "1");
			map.put("return_url", zqConfigUtil.getMessage_return_url());
			map.put("notify_url", zqConfigUtil.getMessage_return_url());
			EncryptData ed = new EncryptData();
			String ws_sign_val = ed.encrptData(map, zqConfigUtil.getPrivate_key());
			map.put("ws_sign_val", ws_sign_val);
			return ZqSubmit.buildRequest(map, zqConfigUtil.getRequest_url() + "/signByValidationCode");

		} else {
			return null;
		}
	}

}
