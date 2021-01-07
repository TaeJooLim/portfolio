package com.portfolio.erp.service.admin.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.company.CompanyVO;
import com.portfolio.erp.repository.admin.company.CompanyDao;

@Service
public class CompanySrvImpl implements CompanySrv {
	
	@Autowired
	CompanyDao cDao;

	@Override
	public void setCompanyInfo(CompanyVO cvo) {
		cDao.setCompanyInfo(cvo);
	}

	@Override
	public CompanyVO getCompanyInfo() {
		return cDao.getCompanyInfo();
	}

	@Override
	public CompanyVO getMenu() {
		return cDao.getMenu();
	}

}
