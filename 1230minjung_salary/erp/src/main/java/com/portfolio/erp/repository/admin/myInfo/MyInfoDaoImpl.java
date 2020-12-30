package com.portfolio.erp.repository.admin.myInfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;

@Repository
public class MyInfoDaoImpl implements MyInfoDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public EmployeeVO getMyInfo(EmployeeVO evo) {
		int empId = evo.getEmpId();
		return sqlSession.selectOne("employee.getEmployeeOne", empId);
	}

	@Override
	public void setMyInfo(EmployeeVO evo) {
		int chkFk;
		chkFk = sqlSession.selectOne("employee.chkFk", evo.getEmpId());
		// System.out.println(chkFk);
		if(chkFk == 0) {
			sqlSession.insert("employee.setMyDetail", evo);
			sqlSession.update("employee.updateMyInfo", evo);
		}else {
			sqlSession.update("employee.updateMyInfo", evo);
			sqlSession.update("employee.updateMyDetail", evo);
		}
	}

	@Override
	public EmployeeVO getMyDepart(EmployeeVO evo) {
		return sqlSession.selectOne("employee.getMyDepart", evo);
	}
	
}
