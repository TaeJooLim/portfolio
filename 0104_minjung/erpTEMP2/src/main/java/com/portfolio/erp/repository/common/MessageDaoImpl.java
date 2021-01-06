package com.portfolio.erp.repository.common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.message.MessageVO;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setMessage(HashMap<String, Object> map) {
		sqlSession.insert("message.setMessage", map);
	}

	@Override
	public List<MessageVO> getSendMessageList(int empId, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empId", empId);
		return sqlSession.selectList("message.getSendMessageList", map);
	}

	@Override
	public List<MessageVO> getFromMessageList(int empId, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empId", empId);
		return sqlSession.selectList("message.getFromMessageList", map);
	}

	@Override
	public MessageVO getSendMessageOne(int msgId) {
		return sqlSession.selectOne("message.getSendMessageOne", msgId);
	}

	@Override
	public MessageVO getFromMessageOne(int msgId) {
		return sqlSession.selectOne("message.getFromMessageOne", msgId);
	}

	@Override
	public void changeMsgConfirm(int msgId) {
		sqlSession.update("message.changeMsgConfirm", msgId);
	}

	@Override
	public int getSendMessageCnt(int empId, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empId", empId);
		
		return sqlSession.selectOne("message.getSendMessageCnt", map);
	}

	@Override
	public int getFromMessageCnt(int empId, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empId", empId);
		
		return sqlSession.selectOne("message.getFromMessageCnt", map);
	}

	@Override
	public void changeMsgSendDel(int msgId) {
		sqlSession.update("message.changeMsgSendDel", msgId);
	}

	@Override
	public void changeMsgFromDel(int msgId) {
		sqlSession.update("message.changeMsgFromDel", msgId);
	}

}