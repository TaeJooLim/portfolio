package com.portfolio.erp.repository.admin.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;

@Repository
public class EmpDaoImpl implements EmpDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setEmpDetail(EmployeeVO evo) {
		int chkFk;
		chkFk = sqlSession.selectOne("employee.chkFk", evo.getEmpId());
		System.out.println(chkFk);
		if(chkFk == 0) {
			sqlSession.insert("employee.setEmpDetail", evo);
			sqlSession.update("employee.updateEmployee", evo);
		}else {
			sqlSession.update("employee.updateEmployee", evo);
			sqlSession.update("employee.updateEmployeeDetail", evo);
		}
	}

	@Override
	public int getEmpCount(String searchOpt, String words) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		return sqlSession.selectOne("employee.getEmpCount", map);
	}

	@Override
	public List<EmployeeVO> getEmployeeList(String searchOpt, String words, int startIndex, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		
		return sqlSession.selectList("employee.getEmployeeList", map);
	}

	@Override
	public void headChange(Map<String,String> map) {
		sqlSession.update("employee.headChange", map);
	}

	@Override
	public void confirmChange(Map<String, String> map) {
		sqlSession.update("employee.confirmChange", map);
	}

	@Override
	public EmployeeVO getEmployeeOne(int empId) {
		EmployeeVO empvo;
		empvo = sqlSession.selectOne("employee.getEmployeeOne", empId);
		return empvo;
	}

	@Override
	public void setEmployeeDelete(int empId) {
		sqlSession.delete("employee.setEmployeeDelete", empId);
		sqlSession.delete("employee.setEmployeeDetailDelete",empId);
		
	}

	@Override
	public void authChange(Map<Object, Object> map) {
		sqlSession.update("employee.authChange",map);
	}

}