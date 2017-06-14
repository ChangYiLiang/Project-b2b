package com.i9he.m2b.manage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.IZqService;
import com.i9he.m2b.manage.biz.impl.ZqSignService;
import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.ZqUser;
import com.i9he.m2b.model.search.ZqSearchModel;
import com.i9he.m2b.model.search.ZqUserSearchModel;
@Controller
@RequestMapping("/controller/zq")
public class ZqController extends AbstractController {
	@Autowired
	private IZqService zqService;
	@Autowired
	private ZqSignService zqSignService;
		
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	@ResponseBody
	@RequestMapping(value="contractList",method=RequestMethod.POST, produces = MIME_JSON)
	public String contractList(ZqSearchModel zsm){
		List<Contract> list = zqService.getAll(zsm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, zsm), DATE_FORMAT);
	}
	@ResponseBody
	@RequestMapping(value="userList",method=RequestMethod.POST, produces = MIME_JSON)
	public String userList(ZqUserSearchModel zus){
		List<ZqUser> list = zqService.getAllUser(zus);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, zus), DATE_FORMAT); 
	}
	@RequestMapping("/contractList")
	public String contractList(){
		return "zq/contractList.ftl";
	}
	@RequestMapping("/userList")
	public String userList(){
		return "zq/userList.ftl";
	}
	@RequestMapping("/signContract")
	public String signContract(String contractType,String contractNum,ModelMap map) throws Exception{
		if("0".equals(contractType)){
			//自签署
			zqSignService.signAutomatic(contractNum);
			return "zq/contractList.ftl";
		}else if("1".equals(contractType)){
			map.put("form", zqSignService.signByWriting(contractNum));
			return "zq/form.ftl";
		}else if("2".equals(contractType)){
			map.put("form", zqSignService.signByValidationCode(contractNum));
			return "zq/form.ftl";
		}
		return null;
	}
	@RequestMapping("/download")
	public String download(String contractNum,ModelMap map) throws Exception{
		map.put("form", zqSignService.down(contractNum));
		return "zq/form.ftl";
	}

	@RequestMapping("/search")
	public String search(String contractNum, ModelMap map) throws IOException {
		// 解析json变成map集合
		HashMap<String, String> userParams = (HashMap<String, String>) JSONObject.toBean(JSONObject.fromObject(zqSignService.showView(contractNum)), HashMap.class);
		// 从map中得到响应参数
		String imgStr = userParams.get("result_message");
		// 如果result_code=0 则说出查询合同图片成功 否则代表失败
		if (userParams.get("result_code").equals("0")) {
			String[] imgArray = imgStr.split(",");
			ArrayList<String> list = new ArrayList<String>();
			for (int i = 0; i < imgArray.length; i++) {
				list.add(imgArray[i]);
			}
			map.put("list", list);
		}

		return "zq/showView.ftl";
	}
	
	@RequestMapping("/returnMessageData")
	public String   returnMessageData(HttpServletRequest request){
		String contract_num = request.getParameter("contract_num");
		String signer = request.getParameter("signer");
		String result_code = request.getParameter("result_code");
		String result_message = request.getParameter("result_message");
		String contract_status = request.getParameter("contract_status");
		if("0".equals(result_code)){
			Contract contract = new Contract();
			contract.setContractNum(contract_num);
			contract.setB2bState(1);
			contract.setB2bTime(new Date());
			contract.setContractStatus(Integer.parseInt(contract_status));
			zqService.update(contract);			
		}
		return "zq/contractList.ftl";
	}
	/**
	 * 手写
	 * @param request
	 * @return
	 */
	@RequestMapping("/returnData")
	public String   returnData(HttpServletRequest request){
		String contract_num = request.getParameter("contract_num");
		String signer = request.getParameter("signer");
		String result_code = request.getParameter("result_code");
		String result_message = request.getParameter("result_message");
		String contract_status = request.getParameter("contract_status");
		String sign_type = request.getParameter("sign_type");
		if("0".equals(result_code)){
			Contract contract = new Contract();
			contract.setContractNum(contract_num);
			contract.setB2bState(1);
			contract.setB2bTime(new Date());
			contract.setContractStatus(Integer.parseInt(contract_status));
			zqService.update(contract);			
		}
		return "zq/contractList.ftl";
	}
}
