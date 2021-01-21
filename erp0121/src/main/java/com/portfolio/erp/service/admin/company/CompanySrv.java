package com.portfolio.erp.service.admin.company;

import com.portfolio.erp.model.company.CompanyVO;

public interface CompanySrv {
	
	public void setCompanyInfo(CompanyVO cvo);
	
	public CompanyVO getCompanyInfo();
	
	public CompanyVO getMenu();

}
