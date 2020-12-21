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
}