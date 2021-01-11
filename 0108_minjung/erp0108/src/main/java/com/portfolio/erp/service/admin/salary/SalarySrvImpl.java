package com.portfolio.erp.service.admin.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.salary.SalaryVO;
import com.portfolio.erp.repository.admin.salary.SalaryDao;

@Service
public class SalarySrvImpl implements SalarySrv{

	@Autowired
	SalaryDao salaryDao;
	
	@Override
	public List<SalaryVO> getSalarayTaxList() {
		return salaryDao.getSalarayTaxList();
	}

	@Override
	public void setSalaryTaxList(SalaryVO svo) {
		salaryDao.setSalaryTaxList(svo);
	}

	@Override
	public void deleteSalaryTaxList(SalaryVO svo) {
		salaryDao.deleteSalaryTaxList(svo);
	}

	@Override
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words) {
		return salaryDao.getMonthSalaryList(searchOpt, searchDate, words);
	}

	@Override
	public int setSalaryAll(String toDate) {
		return salaryDao.setSalaryAll(toDate);
	}

	@Override
	public SalaryVO getMonthSalaryOne(int sformId) {
		return salaryDao.getMonthSalaryOne(sformId);
	}

}
