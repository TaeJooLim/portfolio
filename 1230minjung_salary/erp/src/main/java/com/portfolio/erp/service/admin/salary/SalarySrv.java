package com.portfolio.erp.service.admin.salary;

import java.util.List;

import com.portfolio.erp.model.salary.SalaryVO;

public interface SalarySrv {
	
	public List<SalaryVO> getSalarayTaxList();
	
	public void setSalaryTaxList(SalaryVO svo);
	
	public void deleteSalaryTaxList(SalaryVO svo);

}
