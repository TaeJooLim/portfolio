package com.portfolio.erp.service.admin.produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.produce.ProduceVO;
import com.portfolio.erp.repository.admin.produce.ProduceDao;

@Service
public class ProduceSrvImpl implements ProduceSrv {

	@Autowired
	ProduceDao produceDao;
	
	@Override
	public void setProduceOne(String contDocNum) {
		produceDao.setProduceOne(contDocNum);
	}

	@Override
	public List<ProduceVO> getProduceOne(String contDocNum) {
		return produceDao.getProduceOne(contDocNum);
	}

	@Override
	public void updateQcOne(String prod_process, String prodValue, int prodId) {
		produceDao.updateQcOne(prod_process, prodValue, prodId);
	}

	@Override
	public List<ProduceVO> getReleaseList(String searchOpt, String words) {
		return produceDao.getReleaseList(searchOpt, words);
	}
}