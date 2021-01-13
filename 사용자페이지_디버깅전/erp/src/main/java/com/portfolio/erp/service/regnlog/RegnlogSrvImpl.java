package com.portfolio.erp.service.regnlog;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.repository.regnlog.RegnlogDao;

@Service
public class RegnlogSrvImpl implements RegnlogSrv{
   
   @Autowired
   RegnlogDao regnlogDao;
   
   @Override
   public void setEmpOne(EmployeeVO evo) {
      regnlogDao.setEmpOne(evo);
   }

	@Override
	public int loginChk(EmployeeVO evo, HttpSession session) {
		EmployeeVO empvo = regnlogDao.loginChk(evo, session);
		int resultChk = 0;
		
		if(empvo == null) {
			// 2이면, 아이디, 비밀번호 불일치
			resultChk = 2;
		}
		else {
			if (empvo.getEmpConfirm().equals("Y")) {
				
				// 0이면, 로그인성공
				resultChk = 0;
				
				// 세션생성
				session.setAttribute("empId", empvo.getEmpId());
				session.setAttribute("empNum", empvo.getEmpNum());
				session.setAttribute("empName", empvo.getEmpName());
				session.setAttribute("empDepartment", empvo.getEmpDepartment());
				session.setAttribute("empDepartmentName", empvo.getEmpDepartmentName());
				session.setAttribute("empPosition", empvo.getEmpPosition());
				session.setAttribute("empPositionName", empvo.getEmpPositionName());
				session.setAttribute("empTeam", empvo.getEmpTeam());
				session.setAttribute("empHeadcheck", empvo.getEmpHeadcheck());
				session.setAttribute("empAuth", empvo.getEmpAuth());
			}
			else {
				// 1이면, 가입승인 대기중
				resultChk = 1;
			}
		}
		
		return resultChk;
	}

	@Override
	public void logoutSession(HttpSession session) {
		session.invalidate();
	}

	@Override
	public EmployeeVO empNumChk(String emp_name, String emp_birth) {
		return regnlogDao.empNumChk(emp_name, emp_birth);
	}

	@Override
	public String empPasswordChk(String emp_num, String emp_birth) {
		return regnlogDao.empPasswordChk(emp_num, emp_birth);
	}

}