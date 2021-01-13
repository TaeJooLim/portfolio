package com.portfolio.erp.service.admin.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.contract.ContractVO;
import com.portfolio.erp.repository.admin.contract.ContractDao;

@Service
public class ContractSrvImpl implements ContractSrv{
	@Autowired
	 ContractDao cdao;
	
	@Override
	public void setContract(ContractVO cvo) {
		cdao.setContract(cvo);
		
	}
	
	@Override
	public void setContDocNum(String contDocNum, int contID) {
		cdao.setContDocNum(contDocNum, contID);
		
	}

	@Override
	public int getContID() {
		return cdao.getContID();
	}

	@Override
	public String getCode(String clientLicenseNumFk, int contID) {
		return cdao.getCode(clientLicenseNumFk, contID);
	}

	@Override
	public List<ContractVO> getcontlist(String words,String searchOpt, int startIndex, int pageSize) {
		return cdao.getcontlist(words,searchOpt,startIndex,pageSize);
	}

	@Override
	public void setContDel(int contID) {
		cdao.setContDel(contID);
	}

	@Override
	public String getcontDocNum(int contID) {
		return cdao.getcontDocNum(contID);
	}

	@Override
	public ContractVO getproduct(String contDpName) {
		return cdao.getproduct(contDpName);
	}

	@Override
	public void setContD(ContractVO cvo) {
		cdao.setContD(cvo);
		
	}

	@Override
	public List<ContractVO> getContDList(String contDocNum) {
		return cdao.getContDList(contDocNum);
	}

	@Override
	public void setContDDel(int contDID) {
		cdao.setContDDel(contDID);
		
	}

	@Override
	public ContractVO getcontDMOne(String contDocNum) {
		return cdao.getcontDMOne(contDocNum);
	}

	@Override
	public void setContDModUp(ContractVO cvo) {
		cdao.setContDModUp(cvo);
	}

	@Override
	public int countCD(String contDocNum) {
		return cdao.countCD(contDocNum);
	}

	@Override
	public int countC(String words,String searchOpt) {
		return cdao.countC(words,searchOpt);
	}

	@Override
	public List<ClientVO> getClient() {
		return cdao.getClient();
	}
}
