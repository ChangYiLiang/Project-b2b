package com.i9he.m2b.manage.biz.impl;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.manage.zqutil.EncryptData;
import com.i9he.m2b.manage.zqutil.HttpRequest;
import com.i9he.m2b.manage.zqutil.ZqConfigUtil;
import com.i9he.m2b.manage.zqutil.ZqSubmit;
import com.i9he.m2b.mapper.ContractMapper;
import com.i9he.m2b.model.Contract;
@Service("zqSignService")
public class ZqSignService {

	@Autowired
	private ZqConfigUtil zqConfigUtil;
	@Autowired
	private ContractMapper contractMapper;
	//单用户自动签署
	public String signAutomatic(String contractNum) throws IOException{
			//创建合同模板成功    创建单用户合同
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer", zqConfigUtil.getUser_code());
			//合同编号
			map.put("contract_num", contractNum); 
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
			JSONObject dataMap = data.getJSONObject("map");
			String state = dataMap.getString("result_code");
			System.out.println("自动签署返回信息["+data.toString()+"]");
			if("0".equals(state)){
				//签署成功  保存合同
				Contract contract= new Contract();
				//合同编号
				contract.setContractNum(dataMap.getString("contract_num"));
				contract.setB2bState(1);
				contract.setB2bTime(new Date());
				contract.setContractStatus(Integer.parseInt(dataMap.getString("contract_status")));
				contractMapper.updateByPrimaryKeySelective(contract);
			}
			return state;
		
	}
	//合同查看
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
	//合同下载
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
	//手写签名
	public String signByWriting(String contractNum) throws Exception{
		
			Integer userId = SessionUtil.getSessionUser().getId();
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer", zqConfigUtil.getUser_code());
			map.put("contract_num", contractNum); 
			map.put("sign_type", "3"); 
			map.put("return_url", zqConfigUtil.getReturn_url());
			map.put("notify_url", zqConfigUtil.getReturn_url());
	
			EncryptData ed = new EncryptData();
			String ws_sign_val = ed.encrptData(map,zqConfigUtil.getPrivate_key());
			map.put("ws_sign_val", ws_sign_val); 
		    return  ZqSubmit.buildRequest(map,zqConfigUtil.getRequest_url()+"/signByWritingPanel");
		
	}
	//短信签
	public String signByValidationCode(String contractNum) throws Exception {
			Map<String, String> map = new HashMap<String, String>();
			map.put("zqid", zqConfigUtil.getZqid());
			map.put("signer",zqConfigUtil.getUser_code() );
			map.put("contract_num", contractNum);
			map.put("sign_type", "1");
			map.put("return_url", zqConfigUtil.getMessage_return_url());
			map.put("notify_url", zqConfigUtil.getMessage_return_url());
			EncryptData ed = new EncryptData();
			String ws_sign_val = ed.encrptData(map, zqConfigUtil.getPrivate_key());
			map.put("ws_sign_val", ws_sign_val);
			return ZqSubmit.buildRequest(map, zqConfigUtil.getRequest_url() + "/signByValidationCode");
	}

}
