package com.portfolio.erp.model.order;

public class OrderVO {
	
	// 1. field
	private int orderId;				// PK
	private String orderEmpTeam;		// 작성자 부서코드
	private String empDepartmentName;	// 작성자 부서이름
	private String empPositionName;		// 작성자 직급
	private String orderEmpName;		// 구매요청서 작성자
	private String orderDate;			// 구매요청서 작성일
	private String orderPName;			// 구매요청 품목
	private int orderPAmount;			// 구매요청 품목 수량
	private String orderPUnit;			// 구매요청 품목 단위
	private int orderPBuy;				// 구매요청 품목 단가
	private int orderTotalPrice;		// 구매요청 품목 단가*수량
	private String orderPurpose;		// 구매요청 품목 용도
	private String orderDocNum;			// 문서번호 (정렬 및 조건탐색)
	private String orderConfirm;		// 결재여부
	private String orderConfirmDate;	// 결재일
	private int orderSender;			// 작성자 PK
	private int orderReceiver;			// 수신자 PK (총무과 부서장)
	private String orderSubject;		// 제목
	
	private String approvalType;		// 결재시 문서분류(구매요청서 / 휴가신청서)
	
	// 2. setter, getter
	public int getOrderId() {
		return orderId;
	}
	public String getApprovalType() {
		return approvalType;
	}
	public void setApprovalType(String approvalType) {
		this.approvalType = approvalType;
	}
	public String getEmpDepartmentName() {
		return empDepartmentName;
	}
	public void setEmpDepartmentName(String empDepartmentName) {
		this.empDepartmentName = empDepartmentName;
	}
	public String getEmpPositionName() {
		return empPositionName;
	}
	public void setEmpPositionName(String empPositionName) {
		this.empPositionName = empPositionName;
	}
	public String getOrderConfirmDate() {
		return orderConfirmDate;
	}
	public void setOrderConfirmDate(String orderConfirmDate) {
		this.orderConfirmDate = orderConfirmDate;
	}
	public String getOrderSubject() {
		return orderSubject;
	}
	public void setOrderSubject(String orderSubject) {
		this.orderSubject = orderSubject;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderEmpTeam() {
		return orderEmpTeam;
	}
	public void setOrderEmpTeam(String orderEmpTeam) {
		this.orderEmpTeam = orderEmpTeam;
	}
	public String getOrderEmpName() {
		return orderEmpName;
	}
	public void setOrderEmpName(String orderEmpName) {
		this.orderEmpName = orderEmpName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderPName() {
		return orderPName;
	}
	public void setOrderPName(String orderPName) {
		this.orderPName = orderPName;
	}
	public int getOrderPAmount() {
		return orderPAmount;
	}
	public void setOrderPAmount(int orderPAmount) {
		this.orderPAmount = orderPAmount;
	}
	public String getOrderPUnit() {
		return orderPUnit;
	}
	public void setOrderPUnit(String orderPUnit) {
		this.orderPUnit = orderPUnit;
	}
	public int getOrderPBuy() {
		return orderPBuy;
	}
	public void setOrderPBuy(int orderPBuy) {
		this.orderPBuy = orderPBuy;
	}
	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
	public String getOrderPurpose() {
		return orderPurpose;
	}
	public void setOrderPurpose(String orderPurpose) {
		this.orderPurpose = orderPurpose;
	}
	public String getOrderDocNum() {
		return orderDocNum;
	}
	public String setOrderDocNum(String orderDocNum) {
		return this.orderDocNum = orderDocNum;
	}
	public String getOrderConfirm() {
		return orderConfirm;
	}
	public void setOrderConfirm(String orderConfirm) {
		this.orderConfirm = orderConfirm;
	}
	public int getOrderSender() {
		return orderSender;
	}
	public void setOrderSender(int orderSender) {
		this.orderSender = orderSender;
	}
	public int getOrderReceiver() {
		return orderReceiver;
	}
	public void setOrderReceiver(int orderReceiver) {
		this.orderReceiver = orderReceiver;
	}
}