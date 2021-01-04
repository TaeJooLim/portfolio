package com.portfolio.erp.repository.admin.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.product.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setProductOne(ProductVO pvo) {
		sqlSession.insert("product.setProductOne", pvo);
	}

	@Override
	public List<ProductVO> getProductList(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sqlSession.selectList("product.getProductList", map);
	}

	@Override
	public void deleteProductOne(int pId) {
		sqlSession.delete("product.deleteProductOne", pId);
	}

	@Override
	public int getProductCnt(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sqlSession.selectOne("product.getProductCnt", map);
	}

	@Override
	public ProductVO getProductOne(int pId) {
		return sqlSession.selectOne("product.getProductOne", pId);
	}

	@Override
	public void updateProductOne(ProductVO pvo) {
		sqlSession.update("product.updateProductOne", pvo);
	}

	@Override
	public List<ProductVO> getTypeProductList(String searchOpt, String words, String pType) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("pType", pType);
		
		return sqlSession.selectList("product.getTypeProductList", map);
	}

	@Override
	public void setBOMInsert(ProductVO pvo) {
		sqlSession.insert("product.setBOMInsert", pvo);
	}

	@Override
	public List<ProductVO> getBODList(int pIdFk) {
		return sqlSession.selectList("product.getBOMList", pIdFk);
	}

	@Override
	public void delBOMOne(int pIdFk, int pmIdFk) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("pIdFk", pIdFk);
		map.put("pmIdFk", pmIdFk);
		
		sqlSession.delete("product.delBOMOne", map);
	}

}