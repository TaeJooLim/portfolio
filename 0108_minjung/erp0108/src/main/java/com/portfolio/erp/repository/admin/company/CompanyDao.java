package com.portfolio.erp.repository.admin.company;

import com.portfolio.erp.model.company.CompanyVO;

public interface CompanyDao {
	
	public void setCompanyInfo(CompanyVO cvo);
	
	public CompanyVO getCompanyInfo();
	
	public CompanyVO getMenu();

}
