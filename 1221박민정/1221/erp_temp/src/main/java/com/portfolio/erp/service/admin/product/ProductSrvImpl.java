package com.portfolio.erp.service.admin.product;

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
	public List<ProductVO> getProductList(String searchOpt, String words) {
		return productDao.getProductList(searchOpt, words);
	}

	@Override
	public void deleteProductOne(int pId) {
		productDao.deleteProductOne(pId);
	}

	@Override
	public int getProductCnt(String searchOpt, String words) {
		return productDao.getProductCnt(searchOpt, words);
	}

}
