package com.portfolio.erp.repository.regnlog;

import java.util.HashMap;
import java.util.List;

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
   public List<EmployeeVO> getDepartmentList() {
      List<EmployeeVO> list = sqlSession.selectList("regnlog.getDepartmentList");
      return list;
   }

   @Override
   public List<EmployeeVO> getPositionList() {
      List<EmployeeVO> list = sqlSession.selectList("regnlog.getPositionList");
      return list;
   }

	@Override
	public int loginChk(EmployeeVO evo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNum", evo.getEmpNum());
		map.put("empPassword", evo.getEmpPassword());
		
		EmployeeVO empvo = sqlSession.selectOne("regnlog.getLoginChkCnt", map);
		if(empvo == null) {
			// 2이면, 아이디, 비밀번호 불일치
			return 2;
		}
		else {
			map.put("empId", empvo.getEmpId());	
			int resultChk = sqlSession.selectOne("regnlog.getLoginConfirm", map);
			
			session.setAttribute("empNum", empvo.getEmpNum());
			session.setAttribute("empId", empvo.getEmpId());
			
			// 0이면, 로그인성공
			// 1이면, 가입승인 대기중
			return resultChk;
		}
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