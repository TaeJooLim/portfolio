package com.portfolio.erp.service.admin.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.repository.admin.client.ClientDao;

@Service
public class ClientSrvImpl implements ClientSrv{

	@Autowired
	ClientDao clientDao;

	@Override
	public void setClientOne(ClientVO cvo) {
		clientDao.setClientOne(cvo);
	}

	@Override
	public List<ClientVO> getClients(String searchOpt, String words, int startIndex, int pageSize) {
		return clientDao.getClients(searchOpt, words, startIndex, pageSize);
	}

	@Override
	public int getClientCount(String searchOpt, String words) {
		return clientDao.getClientCount(searchOpt, words);
	}

	@Override
	public void deleteClient(int cid) {
		clientDao.deleteClient(cid);
	}

	@Override
	public ClientVO getClientOne(ClientVO cvo) {
		return clientDao.getClientOne(cvo);
	}

	@Override
	public void updateClient(ClientVO cvo) {
		clientDao.updateClient(cvo);
		
	}

	@Override
	public List<ClientVO> getClientsAll() {
		return clientDao.getClientsAll();
	}
	

}