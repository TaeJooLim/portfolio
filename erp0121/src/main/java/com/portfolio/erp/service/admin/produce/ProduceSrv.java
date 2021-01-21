package com.portfolio.erp.service.admin.produce;

import java.util.List;

import com.portfolio.erp.model.produce.ProduceVO;

public interface ProduceSrv {
	public void setProduceOne(String contDocNum);
	public List<ProduceVO> getProduceOne(String contDocNum);
	public void updateQcOne(String prod_process, String prodValue, int prodId);
	public List<ProduceVO> getReleaseList(String searchOpt, String words, int startIndex, int pageSize);
	public int getReleaseListCnt(String searchOpt, String words);
}
