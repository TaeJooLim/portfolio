package com.portfolio.erp.service.admin.client;

import java.util.List;

import com.portfolio.erp.model.admin.client.ClientVO;

public interface ClientSrv {
	
	public void setClientOne(ClientVO cvo);
	
	public List<ClientVO> getClients(String searchOpt, String words);
	
	public int getClientCount(String searchOpt, String words);
	
	public void deleteClient(int cid);
	
	public ClientVO getClientOne(ClientVO cvo);
	
	public void updateClient(ClientVO cvo);
}
