package com.portfolio.erp.repository.admin.product;

import java.util.HashMap;
import java.util.List;

import com.portfolio.erp.model.product.ProductVO;

public interface ProductDao {
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
	public void setProcessOne(HashMap<String, Object> map);
	public List<ProductVO> getProcessList(int pIdFk);
	public void delProcessOne(int procId);
}
