package com.portfolio.erp.service.regnlog;

import java.util.List;

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
   public List<EmployeeVO> getDepartmentList() {
      List<EmployeeVO> list = regnlogDao.getDepartmentList();
      return list;
   }

   @Override
   public List<EmployeeVO> getPositionList() {
      List<EmployeeVO> list = regnlogDao.getPositionList();
      return list;
   }

	@Override
	public int loginChk(EmployeeVO evo, HttpSession session) {
		return regnlogDao.loginChk(evo, session);
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