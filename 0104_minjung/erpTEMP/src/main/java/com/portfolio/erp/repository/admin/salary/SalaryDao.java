package com.portfolio.erp.repository.admin.salary;

import java.util.List;

import com.portfolio.erp.model.salary.SalaryVO;

public interface SalaryDao {
	
	public List<SalaryVO> getSalarayTaxList();
	public void setSalaryTaxList(SalaryVO svo);
	public void deleteSalaryTaxList(SalaryVO svo);
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words);
	public int setSalaryAll(String toDate);
}
