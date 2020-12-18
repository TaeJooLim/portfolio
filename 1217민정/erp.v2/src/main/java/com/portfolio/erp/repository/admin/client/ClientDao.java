package com.portfolio.erp.repository.admin.client;

import java.util.List;

import com.portfolio.erp.model.admin.client.ClientVO;

public interface ClientDao {
	
	public void setClientOne(ClientVO cvo);
	
	public List<ClientVO> getClients(String searchOpt, String words);
}
