package com.portfolio.erp.repository.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;

@Repository
public class CommonDaoImpl implements CommonDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public EmployeeVO getHeadInfo(String empDepartment) {
		return sqlSession.selectOne("common.getHeadInfo", empDepartment);
	}

	@Override
	public List<EmployeeVO> getDepartmentList() {
		return sqlSession.selectList("common.getDepartmentList");
	}

	@Override
	public List<EmployeeVO> getPositionList() {
		return sqlSession.selectList("common.getPositionList");
	}

}
