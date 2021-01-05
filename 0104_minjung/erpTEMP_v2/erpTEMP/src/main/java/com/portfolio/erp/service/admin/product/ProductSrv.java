package com.portfolio.erp.service.admin.product;

import java.util.List;

import com.portfolio.erp.model.product.ProductVO;

public interface ProductSrv {
	public void setProductOne(ProductVO pvo);
	public List<ProductVO> getProductList(String searchOpt, String words);
	public int getProductCnt(String searchOpt, String words);
	public void deleteProductOne(int pId);
	public ProductVO getProductOne(int pId);
	public void updateProductOne(ProductVO pvo);
	public List<ProductVO> getTypeProductList(String searchOpt, String words, String pType);
	public void setBOMInsert(ProductVO pvo);
	public List<ProductVO> getBODList(int pIdFk);
	public void delBOMOne(int pIdFk, int pmIdFk);
}
