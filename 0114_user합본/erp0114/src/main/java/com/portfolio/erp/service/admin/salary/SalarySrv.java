package com.portfolio.erp.service.admin.salary;

import java.util.List;

import com.portfolio.erp.model.salary.SalaryVO;

public interface SalarySrv {
	
	public List<SalaryVO> getSalarayTaxList(int startIndex, int pageSize);
	public int getSalarayTaxCnt();
	public void setSalaryTaxList(SalaryVO svo);
	public void deleteSalaryTaxList(SalaryVO svo);
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words, int startIndex, int pageSize);
	public int getMonthSalaryCnt();
	public int setSalaryAll(String toDate);
	public SalaryVO getMonthSalaryOne(int sformId);
}
