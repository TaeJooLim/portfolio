package com.portfolio.erp.service.admin.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.repository.admin.product.ProductDao;

@Service
public class ProductSrvImpl implements ProductSrv {

	@Autowired
	ProductDao productDao;
	
	@Override
	public void setProductOne(ProductVO pvo) {
		productDao.setProductOne(pvo);
	}

	@Override
	public List<ProductVO> getProductList(String searchOpt, String words, int startIndex, int pageSize) {
		return productDao.getProductList(searchOpt, words, startIndex, pageSize);
	}

	@Override
	public void deleteProductOne(int pId) {
		productDao.deleteProductOne(pId);
	}

	@Override
	public int getProductCnt(String searchOpt, String words) {
		return productDao.getProductCnt(searchOpt, words);
	}

	@Override
	public ProductVO getProductOne(int pId) {
		return productDao.getProductOne(pId);
	}

	@Override
	public void updateProductOne(ProductVO pvo) {
		productDao.updateProductOne(pvo);
	}

	@Override
	public List<ProductVO> getTypeProductList(String searchOpt, String words, String pType, int startIndex, int pageSize) {
		return productDao.getTypeProductList(searchOpt, words, pType, startIndex, pageSize);
	}

	@Override
	public void setBOMInsert(ProductVO pvo) {
		productDao.setBOMInsert(pvo);
	}

	@Override
	public List<ProductVO> getBODList(int pIdFk) {
		return productDao.getBODList(pIdFk);
	}

	@Override
	public void delBOMOne(int pIdFk, int pmIdFk) {
		productDao.delBOMOne(pIdFk, pmIdFk);
	}

	@Override
	public void setProcessOne(HashMap<String, Object> map) {
		productDao.setProcessOne(map);
	}

	@Override
	public List<ProductVO> getProcessList(int pIdFk) {
		return productDao.getProcessList(pIdFk);
	}

	@Override
	public void delProcessOne(int procId) {
		productDao.delProcessOne(procId);
	}

}
