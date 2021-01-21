package com.portfolio.erp.repository.regnlog;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;

@Repository
public class RegnlogDaoImpl implements RegnlogDao{

   @Autowired
   SqlSession sqlSession;
   
   @Override
   public void setEmpOne(EmployeeVO evo) {
      sqlSession.insert("regnlog.setEmpOne", evo);
   }

	@Override
	public EmployeeVO loginChk(EmployeeVO evo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNum", evo.getEmpNum());
		map.put("empPassword", evo.getEmpPassword());
		
		EmployeeVO empvo = sqlSession.selectOne("regnlog.getLoginInfo", map);
		return empvo;
	}

	@Override
	public EmployeeVO empNumChk(String emp_name, String emp_birth) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emp_name", emp_name);
		map.put("emp_birth", emp_birth);
		
		return sqlSession.selectOne("regnlog.empNumChk", map);
	}

	@Override
	public String empPasswordChk(String emp_num, String emp_birth) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emp_num", emp_num);
		map.put("emp_birth", emp_birth);
		
		int chkcnt = sqlSession.selectOne("regnlog.empPasswordChkCnt", map);
		if (chkcnt == 0) return "fail";
		else {
			String emp_password = emp_birth.substring(0, 4) + emp_birth.substring(5, 7) + emp_birth.substring(8, 10);
			
			map.put("emp_password", emp_password);
			sqlSession.update("regnlog.empPasswordChk", map);
			return "success";
		}
	}
}