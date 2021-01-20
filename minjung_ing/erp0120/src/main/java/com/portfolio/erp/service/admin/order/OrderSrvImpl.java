package com.portfolio.erp.service.admin.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.repository.admin.order.OrderDao;

@Service
public class OrderSrvImpl implements OrderSrv {

	@Autowired
	OrderDao orderDao;
	
	@Override
	public void setOrderList(OrderVO ovo) {
		orderDao.setOrderList(ovo);
	}

	@Override
	public List<OrderVO> getOrderList(String orderDocNum) {
		
		return orderDao.getOrderList(orderDocNum);
	}

	@Override
	public String getProdUnit(String orderPName) {
		return orderDao.getProdUnit(orderPName);
	}

	@Override
	public int getProdBuy(String orderPName) {
		return orderDao.getProdBuy(orderPName);
	}

	@Override
	public void deleteOne(int orderId) {
		orderDao.deleteOne(orderId);
	}

	@Override
	public List<OrderVO> getOrderFormInfo(String orderDocNum) {
		return orderDao.getOrderFormInfo(orderDocNum);
	}

	@Override
	public void orderSignConfirm(String orderDocNum) {
		orderDao.orderSignConfirm(orderDocNum);
	}

	@Override
	public List<OrderVO> getOrderSubjectList(String searchOpt, String words, int startIndex, int pageSize) {
		return orderDao.getOrderSubjectList(searchOpt, words, startIndex, pageSize);
	}

	@Override
	public int getCntOrderList(String searchOpt, String words) {
		return orderDao.getCntOrderList(searchOpt, words);
	}

	@Override
	public List<OrderVO> getAppOrderList(	String searchOpt, String words, 
											int startIndex, int pageSize,
											String confirmChk) {
		return orderDao.getAppOrderList(searchOpt, words, startIndex, pageSize, confirmChk);
	}

	@Override
	public int getAppOrderListCnt(String searchOpt, String words, String confirmChk) {
		return orderDao.getAppOrderListCnt(searchOpt, words, confirmChk);
	}

	@Override
	public int getAppOrderSendListCnt(String searchOpt, String words, int empId) {
		return orderDao.getAppOrderSendListCnt(searchOpt, words, empId);
	}

	@Override
	public List<OrderVO> getAppOrderSendList(String searchOpt, String words, int startIndex, int pageSize, int empId) {
		return orderDao.getAppOrderSendList(searchOpt, words, startIndex, pageSize, empId);
	}
}
