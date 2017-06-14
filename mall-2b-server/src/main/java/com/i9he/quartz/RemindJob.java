package com.i9he.quartz;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.i9he.common.exception.I9heException;
import com.i9he.common.util.FreeMarkerUtils;
import com.i9he.common.util.JavaMailUtils;
import com.i9he.m2b.mapper.ConcernMapper;
import com.i9he.m2b.mapper.MessageMapper;
import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.RemindInfo;
import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
/**
 * 降价提醒
 * @author Administrator
 *
 */
public class RemindJob {

	
	@Autowired
	private ConcernMapper concernMapper;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private ConfigUtil configUtil;
	@Autowired
	private MessageMapper  messageMapper;
	
	@Scheduled(cron="30 * * * * ?")
	public void RemindServer() throws I9heException{
		List<RemindInfo> list =  concernMapper.getRemindList();
		for(RemindInfo r : list){
			User u = privilegeBaseApiService.getUserById(r.getUserId());
			
			Map<String, Object> models = new HashMap<String, Object>();
			models.put("username", u.getUsername());
			models.put("goodsName", r.getGoodsName());
			models.put("basepath", configUtil.getBasepath()+"/i9he/fuwuqi.do?goodsId="+r.getGoodsId());

			String content = FreeMarkerUtils.render(configUtil.getForgetPasswordTemplateRoot(), "reduceRemid.ftl", models);
			JavaMailUtils.sendMail(u.getEmail(), "降价提醒", content);
			
			MessageContentUtil util = new MessageContentUtil();
			String url = "../i9he/fuwuqi.do?goodsId="+r.getGoodsId();
			
			Message message = new Message();
			message.setCreateTime(new Date());
			message.setContent(util.getRemind(r.getGoodsName(),r.getPrice()+""));
			message.setTitle(MessageContentUtil.TITLE_2);
			message.setUserId(r.getUserId());
			message.setUrl(url);
			messageMapper.insertSelective(message);
			
			Concern cn = new Concern();
			cn.setId(r.getConcernId());
			cn.setRemindStatus((byte)0);
			concernMapper.updateByPrimaryKeySelective(cn);
		}
	}
}

