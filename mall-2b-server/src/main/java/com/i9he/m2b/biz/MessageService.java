package com.i9he.m2b.biz;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.search.MessageSearchModel;

public interface MessageService {
	
	public List<Message> getUserMessage(MessageSearchModel mm,RowBounds rowBounds);
	
	public int getUserTotal(MessageSearchModel mm);
	
	public int delUserMessage(Integer userId,Byte receive);
	
	public int updateIsRead(Integer messageId);
	
	public boolean isHave(String url);
	
	public int updateIsRead();
	
	public int addMessage(String url,String title,String content);
	
	public int delete(Integer id);
	
	public int addMessage(Message message);
	
	public int updateBalances(Integer userId,Integer number);
	
	public int addLog(Integer userId,Integer number,String content);
	
	public int messageCount(MessageSearchModel mm);

}
