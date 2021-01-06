package com.portfolio.erp.repository.admin.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.order.OrderVO;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setOrderList(OrderVO ovo) {
		ovo.setOrderTotalPrice(ovo.getOrderPAmount() * ovo.getOrderPBuy());
		sqlSession.insert("order.setOrderList", ovo);
		
	}

	@Override
	public List<OrderVO> getOrderList(String orderDocNum) {
		return sqlSession.selectList("order.getOrderList", orderDocNum);
	}

	@Override
	public String getProdUnit(String orderPName) {
		
		return sqlSession.selectOne("order.getProdUnit", orderPName);
	}

	@Override
	public int getProdBuy(String orderPName) {
		return sqlSession.selectOne("order.getProdBuy", orderPName);
	}

	@Override
	public void deleteOne(int orderId) {
		sqlSession.delete("order.deleteOne", orderId);
		
	}

	@Override
	public List<OrderVO> getOrderFormInfo(String orderDocNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderDocNum", orderDocNum);
		
		return sqlSession.selectList("order.getOrderFormInfo", map);
	}

	@Override
	public void orderSignConfirm(String orderDocNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String orderConfirmDate = sdf.format(dt);
		map.put("orderDocNum", orderDocNum);
		map.put("orderConfirmDate", orderConfirmDate);
		
		sqlSession.update("order.orderSignConfirm", map);
	}

	@Override
	public List<OrderVO> getOrderSubjectList(String searchOpt) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		
		return sqlSession.selectList("order.getOrderSubjectList", map);
	}
}