package com.portfolio.erp.service.admin.contract;

import java.util.List;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.contract.ContractVO;

public interface ContractSrv {
	
	public List<ClientVO> getClient();

	public void setContract(ContractVO cvo);
	
	public int getContID();
	
	public void setContDocNum(String contDocNum, int contID);
	
	public String getCode(String clientLicenseNumFk, int contID);
	
	public List<ContractVO> getcontlist(String words,String searchOpt);
	
	public void setContDel(int contID);
	
	public String getcontDocNum(int contID);
	
	public ContractVO getproduct(String contDpName);
	
	public void setContD(ContractVO cvo);
	
	public List<ContractVO> getContDList(String contDocNum);
	
	public void setContDDel(int contDID);
	
	public ContractVO getcontDMOne(String contDocNum);
	
	public void setContDModUp(ContractVO cvo);
	
	public int countCD(String contDocNum);
	
	public int countC();
}
