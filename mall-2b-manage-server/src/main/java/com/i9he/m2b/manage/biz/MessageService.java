package com.i9he.m2b.manage.biz;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.MessageType;
import com.i9he.m2b.model.search.MessageSearchModel;

public interface MessageService {
	/**
	 * 消息列表
	 * @param messageSearchModel
	 * @param rb
	 * @return
	 */
	public List<Message> getMessage(MessageSearchModel messageSearchModel,RowBounds rb);
	/**
	 * 获取消息类型列表
	 * @return
	 */
	public List<MessageType> getMessageType(String typeName,RowBounds rb);
	/**
	 * 消息类型总数
	 * @param typeName
	 * @return
	 */
	public int getTotal(String typeName);
	/**
	 * 删除消息
	 * @param messageId
	 * @return
	 */
	public int deleteMessage(String messageId);
	/**
	 * 删除消息类型
	 * @param messageTypeId
	 * @return
	 */
	public int deleteMessageType(String messageTypeId);
	
	public int addMessage(String url,String title,String content);
	
	public int addMessage(Message message);
	
    public int updateBalances(Integer userId,Integer number);
	
	public int addLog(Integer userId,Integer number,String content);
	

}
