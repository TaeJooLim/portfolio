package com.portfolio.erp.repository.common;

import java.util.HashMap;
import java.util.List;

import com.portfolio.erp.model.message.MessageVO;

public interface MessageDao {

	public void setMessage(HashMap<String, Object> map);
	public void changeMsgConfirm(int msgId);
	public MessageVO getSendMessageOne(int msgId);
	public MessageVO getFromMessageOne(int msgId);
	public int getSendMessageCnt(int empId, String searchOpt, String words);
	public int getFromMessageCnt(int empId, String searchOpt, String words);
	public List<MessageVO> getSendMessageList(int empId, String searchOpt, String words);
	public List<MessageVO> getFromMessageList(int empId, String searchOpt, String words);
	public void changeMsgSendDel(int msgId);
	public void changeMsgFromDel(int msgId);
	
	public int getFromUnreadCnt(int empId, String searchOpt, String words);
	public List<MessageVO> getFromUnreadList(int empId, String searchOpt, String words);

}
