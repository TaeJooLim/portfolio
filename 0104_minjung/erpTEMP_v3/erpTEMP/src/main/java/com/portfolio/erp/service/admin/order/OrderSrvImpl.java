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
	public List<OrderVO> getOrderSubjectList(String searchOpt) {
		return orderDao.getOrderSubjectList(searchOpt);
	}

}