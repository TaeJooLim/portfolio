package com.portfolio.erp.repository.user.attend;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.attend.AttendVO;

@Repository
public class AttendDaoImpl implements AttendDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setStarttime(AttendVO avo) {
		sqlSession.insert("attend.setStarttime", avo);
	}

	@Override
	public int isStarted(AttendVO avo) {
		return sqlSession.selectOne("attend.isStarted", avo);
	}

	@Override
	public void setEndtime(AttendVO avo) {
		sqlSession.update("attend.setEndtime", avo);
	}

	@Override
	public int isEnded(AttendVO avo) {
		return sqlSession.selectOne("attend.isEnded", avo);
	}

	@Override
	public AttendVO getTimes(AttendVO avo) {
		return sqlSession.selectOne("attend.getTimes", avo);
	}
}
