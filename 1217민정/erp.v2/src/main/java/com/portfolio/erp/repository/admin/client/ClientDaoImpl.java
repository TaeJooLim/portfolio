package com.portfolio.erp.repository.admin.client;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.admin.client.ClientVO;

@Repository
public class ClientDaoImpl implements ClientDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setClientOne(ClientVO cvo) {
		sqlSession.insert("client.setClientOne", cvo);
	}

	@Override
	public List<ClientVO> getClients(String searchOpt, String words) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		List<ClientVO> list = sqlSession.selectList("client.getClients",map);
		return list;
	}
}
