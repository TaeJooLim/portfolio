package com.portfolio.erp.repository.admin.myInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectOne("employee.getMyInfo", evo);
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
	public List<EmployeeVO> getCoworker(EmployeeVO evo) {
		return sqlSession.selectList("employee.getCoworker", evo);
	}

	@Override
	public void updatePwd(String pwd, String empNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pwd", pwd);
		map.put("empNum", empNum);
		sqlSession.update("employee.updatePwd", map);
	}

}
