<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
</head>
<style> 
    /* 검색박스 */
    .search_box {
        position: relative;
    }
    .search_box input{
        background-color: #eff3f9;
    }
    .search_box i{
        cursor: pointer;
        position: absolute;
        top: 50%;
        right: 7px;
        transform: translateY(-50%);
        color: #959595;
    }
</style>

    <div class="page_wrap bg_white noto font_14">
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
			<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">구매관리<i class="fas fa-chevron-right p_lr10"></i>1. 구매요청서 보기</h2>
                </div>
                <div class="main_right_info p_20">
					<form method="POST" action="" name="setOrderFrm" id="setOrderFrm">
                    	<div class="form_about m_tb10">
	                        <table class="input_list">
	                            <tr>
	                                <td class="bg_gray td_8">제목</td>
	                                <td class="p_lr3">
	                                    <input id="" name="orderSubject" type="text" class="input_100" value="${oInfo.orderSubject} 구매요청서" readonly />
	                                </td>
	                                <td class="bg_gray td_9">결재여부</td>
	                                <td class="p_lr3 td_5">
	                                    <select name="order_confirm" id="" class="sel_100" disabled>
	                                        <option value="N">미결</option>
	                                        <option value="Y"<c:if test="${oInfo.orderConfirm eq 'Y'}">selected</c:if>>완결</option>
	                                    </select>
	                                </td>
	                            </tr>
	                        </table>
                    	</div>
                    	<div class="reg_tbl_wrap ">
                            <table class="input_list">
                                <tr>
                                    <td class="td_8 bg_gray">문서번호</td>
                                    <td class="">
                                        <div class="auto_num flex space_between">
                                            <input type="text" id="orderDocNum" name="orderDocNum" class="input_100 m_lr3" readonly value="${orderDocNum}" required />
                                        </div>
                                    </td>
                                    <td class="td_8 bg_gray">작성부서</td>
                                    <td class="p_lr3">
                                        <input type="text" class="input_100" value="${oInfo.empDepartmentName}" readonly />
                                    </td>
                                    <td class="td_8 bg_gray">작성자</td>
                                    <td class="p_lr3">
                                        <input type="text" id="orderEmpName" name="orderEmpName" class="input_100" value="${oInfo.orderEmpName}" readonly/>
                                    </td>
                                    <td class="td_8 bg_gray">작성일자</td>
                                    <td class="p_lr3">
                                        <input type="text" id="orderDate" name="orderDate" class="input_100" value="${oInfo.orderDate}" readonly/>
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" id="orderSender" name="orderSender" value="${sessionScope.empId}" />
                            <input type="hidden" id="orderReceiver" name="orderReceiver" value="${headInfo.empId}" />
                    </div>
                    </form>
                    <div class="list m_tb20">
                    <div class="flex space_between">
		                    <div class="flex space_between m_b5">
			                    <form method="POST" id="orderDepartFrm" name="" action="${pageContext.request.contextPath}/admin/order_insert" >
			                    	<c:if test="${sessionScope.empDepartment eq '400' && sessionScope.empHeadcheck eq 'Y' }">
			                    		<div class="" >
					                    	<select class="input_box" id="empDepartment" name="empDepartment" style="width:150px;" >
					                            <c:forEach items="${dList}" var="dlist">
					                                <option value="${dlist.empDepartment}" <c:if test="${dlist.empDepartment eq empDepartment}">selected</c:if> >${dlist.empDepartmentName}</option>
					                            </c:forEach>
					                        </select>
					                        <button type="submit" class="btn_ivory" >조회</button>
					                    </div>
			                    	</c:if>
			                    </form>
		                    </div>
		                </div>
                        <table class="list">
                            <thead>
                            <tr>
                                <th class="td_3">번호</th>
                                <th class="td_20">품명</th>
                                <th class="td_5">수량</th>
                                <th class="td_5">단위</th>
                                <th class="td_15">단가</th>
                                <th class="td_15">금액</th>
                                <th>용도</th>
                                <th class="td_5">작성자</th>
                                <th class="td_10">작성날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty orderList}">
                                    <tr>
                                        <td colspan="10">등록된 구매요청 정보가 없습니다.</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${orderList}" var="list">
                                
                                <tr>
                                    <td>${list.orderId}</td>
                                    <td>${list.orderPName}</td>
                                    <td>${list.orderPAmount}</td>
                                    <td>${list.orderPUnit}</td>
                                    <td>
                                    	<fmt:formatNumber value="${list.orderPBuy}" pattern="#,###,###"/>
                                    </td>
                                    <td>
                                    	<fmt:formatNumber value="${list.orderTotalPrice}" pattern="#,###,###"/>
                                    </td>
                                    <td>${list.orderPurpose}</td>
                                    <td>${list.orderEmpName}</td>
                                    <td>${list.orderDate}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>

                </div>
            </div>
        </div>
    </div>

<script src = " ${pageContext.request.contextPath}/js/order.js"></script> 
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>