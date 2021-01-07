package com.portfolio.erp.repository.admin.workcenter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.workcenter.WorkcenterVO;

@Repository
public class WorkcenterDaoImpl implements WorkcenterDao{
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void setworkcenter(WorkcenterVO wvo) {
		sqlsession.insert("workcenter.setworkcenter",wvo);
		
	}

	@Override
	public List<WorkcenterVO> getworkcenterList() {
		return sqlsession.selectList("workcenter.getworkcenterList");
	}
	@Override
	public int count() {
		return sqlsession.selectOne("workcenter.count");
	}

	@Override
	public void setworkcenterDel(int wcId) {
		sqlsession.delete("workcenter.setworkcenterDel",wcId);
		
	}

}
