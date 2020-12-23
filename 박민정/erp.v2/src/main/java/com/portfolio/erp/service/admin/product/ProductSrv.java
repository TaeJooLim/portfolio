package com.portfolio.erp.service.admin.product;

import java.util.List;

import com.portfolio.erp.model.product.ProductVO;

public interface ProductSrv {
	public void setProductOne(ProductVO pvo);
	public List<ProductVO> getProductList(String searchOpt, String words);
	public int getProductCnt(String searchOpt, String words);
	public void deleteProductOne(int pId);
	public ProductVO getProductOne(int pId);
}
