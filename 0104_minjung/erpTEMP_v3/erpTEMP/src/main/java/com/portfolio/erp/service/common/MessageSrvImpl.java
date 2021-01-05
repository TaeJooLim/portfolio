package com.portfolio.erp.service.common;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.message.MessageVO;
import com.portfolio.erp.repository.common.MessageDao;

@Service
public class MessageSrvImpl implements MessageSrv {

	@Autowired
	MessageDao messageDao;
	
	@Override
	public void setMessage(HashMap<String, Object> map) {
		messageDao.setMessage(map);
	}

	@Override
	public List<MessageVO> getSendMessageList(int empId, String searchOpt, String words) {
		return messageDao.getSendMessageList(empId, searchOpt, words);
	}

	@Override
	public List<MessageVO> getFromMessageList(int empId, String searchOpt, String words) {
		return messageDao.getFromMessageList(empId, searchOpt, words);
	}

	@Override
	public MessageVO getSendMessageOne(int msgId) {
		return messageDao.getSendMessageOne(msgId);
	}

	@Override
	public MessageVO getFromMessageOne(int msgId) {
		return messageDao.getFromMessageOne(msgId);
	}

	@Override
	public void changeMsgConfirm(int msgId) {
		messageDao.changeMsgConfirm(msgId);
	}

	@Override
	public int getSendMessageCnt(int empId, String searchOpt, String words) {
		return messageDao.getSendMessageCnt(empId, searchOpt, words);
	}

	@Override
	public int getFromMessageCnt(int empId, String searchOpt, String words) {
		return messageDao.getFromMessageCnt(empId, searchOpt, words);
	}

	@Override
	public void changeMsgSendDel(int msgId) {
		messageDao.changeMsgSendDel(msgId);
	}

	@Override
	public void changeMsgFromDel(int msgId) {
		messageDao.changeMsgFromDel(msgId);
	}
}