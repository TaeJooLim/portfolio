package com.portfolio.erp.service.admin.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.admin.client.ClientVO;
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
	public List<ClientVO> getClients() {
		List<ClientVO> list = clientDao.getClients();
		return list;
	}
}
