package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.m2b.manage.biz.MessageService;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.MessageMapper;
import com.i9he.m2b.mapper.MessageTypeMapper;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.MessageType;
import com.i9he.m2b.model.search.MessageSearchModel;
@Service("messageSerive")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private FestLogMapper festlogMapper;
	
	@Autowired
	private Balances2bMapper balancesMapper;
	
	@Autowired
	private MessageMapper messageMapper;
	@Autowired
	private MessageTypeMapper messageTypeMapper;

	@Override
	public List<Message> getMessage(MessageSearchModel messageSearchModel,
			RowBounds rb) {
		List<Message> list = messageMapper.getMessage(messageSearchModel, rb);
		int total = messageMapper.getUserTotal(messageSearchModel);
		messageSearchModel.setTotal(total);
		return list;
	}

	@Override
	public List<MessageType> getMessageType(String typeName, RowBounds rb) {
		List<MessageType> list = messageTypeMapper.getMessageType(typeName, rb);
		return list;
	}

	@Override
	public int deleteMessage(String messageId) {
		// TODO Auto-generated method stub
		return messageMapper.deleteMessage(Integer.parseInt(messageId));
	}

	@Override
	public int deleteMessageType(String messageTypeId) {
		// TODO Auto-generated method stub
		return messageTypeMapper.deleteMessageType(Integer.parseInt(messageTypeId));
	}

	@Override
	public int getTotal(String typeName) {
		// TODO Auto-generated method stub
		return messageTypeMapper.getTotal(typeName);
	}
	
	@Override
	public int addMessage(String url, String title, String content) {
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setContent(content);
		message.setTitle(title);
		message.setUserId(SessionUtil.getSessionUser().getId());
//		message.setUserId(5183);
		message.setUrl(url);
		return messageMapper.insertSelective(message);
	}

	@Override
	public int addMessage(Message message) {
		return messageMapper.insertSelective(message);
	}
	
	@Override
	public int updateBalances(Integer userId, Integer number) {
		Balances ba = balancesMapper.selectByPrimaryKey(userId);
		int end = ba.getFestBalance()+number;
		Balances balances = new Balances();
		balances.setUserId(userId);
		balances.setFestBalance(end);
		return balancesMapper.updateByPrimaryKeySelective(balances);
	}

	@Override
	public int addLog(Integer userId, Integer number, String content) {
		FestLog festlog = new FestLog();
		festlog.setUserId(userId);
		festlog.setLogNum(number);
		festlog.setLogTime(new Date());
		festlog.setLogDesc(content);
		festlog.setLogFlag(0);
		return festlogMapper.insertSelective(festlog);
	}
	


}
