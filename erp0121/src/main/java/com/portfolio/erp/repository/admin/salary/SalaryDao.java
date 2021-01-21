package com.portfolio.erp.repository.admin.salary;

import java.util.List;

import com.portfolio.erp.model.salary.SalaryVO;

public interface SalaryDao {
	
	public List<SalaryVO> getSalarayTaxList(int startIndex, int pageSize);
	public void setSalaryTaxList(SalaryVO svo);
	public int getSalarayTaxCnt();
	public void deleteSalaryTaxList(SalaryVO svo);
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words, int startIndex, int pageSize);
	public int getMonthSalaryCnt(String searchOpt, String searchDate, String words);
	public int setSalaryAll(String toDate);
	public SalaryVO getMonthSalaryOne(int sformId);
}
