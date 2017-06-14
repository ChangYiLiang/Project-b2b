package com.i9he.m2b.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.MessageMapper;
import com.i9he.m2b.mapper.SetMessageMapper;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.SetMessage;
import com.i9he.m2b.model.search.MessageSearchModel;
import com.i9he.m2b.util.MessageUtil;
import com.i9he.m2b.util.SessionUtil;
@Service("messageService")
public class MessageServiceImpl  implements MessageService{
	@Autowired
	private MessageMapper messageMapper;
	@Autowired
	private SetMessageMapper  setMessageMapper;
	
	@Autowired
	private FestLogMapper festlogMapper;
	
	@Autowired
	private Balances2bMapper balancesMapper;
	
	@Override
	public List<Message> getUserMessage(MessageSearchModel mm,RowBounds rowBounds) {
		return messageMapper.getUserMessage(mm,rowBounds);
	}

	@Override
	public int getUserTotal(MessageSearchModel mm) {
		return messageMapper.getUserTotal(mm);
	}
	
	@Override
	public int delUserMessage(Integer userId, Byte receive) {
		Message m = new Message();
		m.setUserId(userId);
		m.setIsReceive(receive);
		return messageMapper.updateIsReceiveByUserId(m);
	}

	@Override
	public int updateIsRead(Integer messageId) {
		Message m = new Message();
		m.setId(messageId);
		m.setIsRead((byte)1);
		return messageMapper.updateByPrimaryKeySelective(m);
	}

	@Override
	public boolean isHave(String url) {
		Message message = messageMapper.getMessageByUrl(url);
		if(message==null){
			return false;
		}
		return true;
	}

	@Override
	public int updateIsRead() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return messageMapper.updateIsReadByUser(userId);
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
	public int delete(Integer id) {
		return messageMapper.deleteMeg(id);
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

	@Override
	public int messageCount(MessageSearchModel mm) {
		return messageMapper.messageCount(mm);
	}
	
	

	

}
