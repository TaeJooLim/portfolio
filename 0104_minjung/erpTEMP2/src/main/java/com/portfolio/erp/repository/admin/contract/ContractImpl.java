package com.portfolio.erp.repository.admin.contract;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.contract.ContractVO;

@Repository
public class ContractImpl implements ContractDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setContract(ContractVO cvo) {
		sqlSession.insert("contract.setContract",cvo);
		
	}

	@Override
	public void setContDocNum(String contDocNum, int contID) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("contDocNum", contDocNum);
		map.put("contID", contID);
		sqlSession.update("contract.setContDocNum",map);
		
	}

	@Override
	public int getID(String clientLicenseNumFk) {
		return sqlSession.selectOne("contract.getID",clientLicenseNumFk);
	}

	@Override
	public String getCode(String clientLicenseNumFk, int contID) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("clientLicenseNumFk", clientLicenseNumFk);
		map.put("contID", contID);
		return sqlSession.selectOne("contract.getCode",map);
	}

	@Override
	public List<ContractVO> getcontlist(String words,String searchOpt) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectList("contract.getcontlist",map);
	}

	@Override
	public void setContDel(int contID) {
		sqlSession.delete("contract.setContDel",contID);
		
	}

	@Override
	public String getcontDocNum(int contID) {
		return sqlSession.selectOne("contract.getcontDocNum",contID);
	}

	@Override
	public ContractVO getproduct(String contDpName) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("contDpName", contDpName);
		
		return sqlSession.selectOne("contract.getproduct", map);
	}

	@Override
	public void setContD(ContractVO cvo) {
		sqlSession.insert("contract.setContD",cvo);
		
	}

	@Override
	public List<ContractVO> getContDList(String contDocNum) {
		return sqlSession.selectList("contract.getContDList",contDocNum);
	}

	@Override
	public void setContDDel(int contDID) {
		sqlSession.delete("contract.setContDDel",contDID);
		
	}

	@Override
	public ContractVO getcontDMOne(String contDocNum) {
		return sqlSession.selectOne("contract.getcontDMOne",contDocNum);
	}

	@Override
	public void setContDModUp(ContractVO cvo) {
		sqlSession.update("contract.setContDModUp",cvo);
		
	}

	@Override
	public int countCD(String contDocNum) {
		return sqlSession.selectOne("contract.countCD",contDocNum);
	}

	@Override
	public int countC() {
		return sqlSession.selectOne("contract.countC");
	}

	@Override
	public List<ClientVO> getClient() {
		return sqlSession.selectList("contract.getClient");
	}
}
