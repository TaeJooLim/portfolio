package com.portfolio.erp.repository.admin.product;

import java.util.List;

import com.portfolio.erp.model.product.ProductVO;

public interface ProductDao {
	public void setProductOne(ProductVO pvo);
	public List<ProductVO> getProductList(String searchOpt, String words);
	public int getProductCnt(String searchOpt, String words);
	public void deleteProductOne(int pId);
}
