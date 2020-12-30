package com.portfolio.erp.repository.admin.salary;

import java.util.List;

import com.portfolio.erp.model.salary.SalaryVO;

public interface SalaryDao {
	
	public List<SalaryVO> getSalarayTaxList();
	
	public void setSalaryTaxList(SalaryVO svo);
	
	public void deleteSalaryTaxList(SalaryVO svo);
}
