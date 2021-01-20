package com.portfolio.erp.repository.admin.order;

import java.util.List;

import com.portfolio.erp.model.order.OrderVO;

public interface OrderDao {
	
	public void setOrderList(OrderVO ovo);
	public List<OrderVO> getOrderList(String orderDocNum);
	public String getProdUnit(String orderPName);
	public int getProdBuy(String orderPName);
	public void deleteOne(int orderId);
	public List<OrderVO> getOrderFormInfo(String orderDocNum);
	public void orderSignConfirm(String orderDocNum);
	public List<OrderVO> getOrderSubjectList(String searchOpt, String words, int startIndex, int pageSize);
	public int getCntOrderList(String searchOpt, String words);
	
	public int getAppOrderListCnt(String searchOpt, String words, String confirmChk);
	public List<OrderVO> getAppOrderList(String searchOpt, String words, int startIndex, int pageSize, String confirmChk);

	public int getAppOrderSendListCnt(String searchOpt, String words, int empId);
	public List<OrderVO> getAppOrderSendList(String searchOpt, String words, int startIndex, int pageSize, int empId);
}
