<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
<!-- 여기안에 내용을 복사하시면 됩니다! -->
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
        <div class="page_main flex space_between">
			<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">구매관리<i class="fas fa-chevron-right p_lr10"></i>1. 구매요청서작성</h2>
                </div>
                <div class="main_right_info p_20">
                	<div class="table_wrap_box">
					<form method="POST" action="" name="setOrderFrm" id="setOrderFrm">
                    	<div class="form_about m_b10">
	                        <table class="input_list">
	                            <tr>
	                                <td class="bg_gray td_8">제목</td>
	                                <td class="p_lr3">
	                                    <input id="" name="orderSubject" type="text" class="input_100" value="${firstOrderList.orderSubject}" readonly />
	                                </td>
	                                <td class="bg_gray td_9">결재여부</td>
	                                <td class="p_lr3 td_5">
	                                    <select name="order_confirm" id="" class="sel_100" disabled>
	                                        <option value="N">미결</option>
	                                        <option value="Y"<c:if test="${orderConfirm eq 'Y'}">selected</c:if>>완결</option>
	                                    </select>
	                                </td>
	                            </tr>
	                        </table>
                    	</div>
                    	<div class="reg_tbl_wrap">
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
                                        <input type="text" class="input_100" value="${empDepartmentName}" readonly />
                                        <input type="hidden" id="orderEmpTeam" name="orderEmpTeam" value="${sessionScope.empDepartment}" />
                                    </td> 	
                                    <td class="td_8 bg_gray">최근작성자</td>
                                    <td class="p_lr3">
                                        <input type="text" id="" name="" class="input_100" value="${firstOrderList.orderEmpName} " readonly/>
                                        <input type="hidden" id="orderEmpName" name="orderEmpName" value="${sessionScope.empName}" /> 
                                    </td>
                                    <td class="td_8 bg_gray">최근작성일</td>
                                    <td class="p_lr3">
                                    	<input type="hidden" id="orderDate" name="orderDate" class="input_100" value="${year}-${month}-${day}" readonly/>
                                        <input type="text" id="" name="" class="input_100" value="${firstOrderList.orderDate}" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray">품명검색</td>
                                    <td class="p_lr3">
                                    	<div class="flex space_between">
                                        <select class="input_box" id="orderPName" name="orderPName" style="width:calc(100% - 78px);" >
                                             <c:forEach items="${prodList}" var="pList">
                                                  <option value="${pList.pName}" >${pList.pName}</option>
                                             </c:forEach>
                                        </select>
                                        <button type="button" class="btn_ivory" onClick="pUnit();pBuy();" >선택</button>
                                        </div>
                                    </td>
                                    <td class="bg_gray">수량</td>
                                    <td class="p_lr3">
                                        <input type="text" id="orderPAmount" name="orderPAmount" class="input_100" placeholder="수량을 입력해주세요" />
                                    </td>
                                    <td class="bg_gray">단위</td>
                                    <td class="p_lr3">
                                        <input type="text" id="orderPUnit" readonly name="orderPUnit" class="input_100" value=""/>
                                    </td>
                                    <td class="bg_gray">단가</td>
                                    <td class="p_lr3">
                                        <input type="text" id="orderPBuy" name="orderPBuy" readonly class="input_100" value="" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray">용도</td>
                                    <td class="p_lr3" colspan="7">
                                        <input type="text" id="orderPurpose" name="orderPurpose" class="input_100" />
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" id="orderSender" name="orderSender" value="${sessionScope.empId}" />
                            <input type="hidden" id="orderReceiver" name="orderReceiver" value="${headInfo.empId}" />
                            
                            <c:choose>
                            	<c:when test="${sessionScope.empDepartment eq '400' && sessionScope.empHeadcheck eq 'Y' || orderConfirm eq 'Y'}">
	                        	</c:when>
	                        	<c:otherwise>
	                        		<div class="btn_grp center m_t20">
	                                	<button type="button" class="btn_blue" onClick="setOrderList();">구매요청</button>
	                                	<button type="reset" class="btn_red">새로고침</button>
	                            	</div>
	                        	</c:otherwise>	                        	
                            </c:choose>
                    </div>
                    </form>
                    <div class="list m_tb20">
                    	<div class="flex space_between">
		                    <div class="flex space_between">
			                    <form method="POST" id="orderDepartFrm" name="" action="${pageContext.request.contextPath}/user/order_insert" >
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
                        <table class="user_table_list" >
                            <thead>
                            <tr>
                                <th class="td_3" style="color:#000; font-weight: 700">번호</th>
                                <th class="td_20" style="color:#000; font-weight: 700">품명</th>
                                <th class="td_5" style="color:#000; font-weight: 700">수량</th>
                                <th class="td_5" style="color:#000; font-weight: 700">단위</th>
                                <th class="td_15" style="color:#000; font-weight: 700">단가</th>
                                <th class="td_15" style="color:#000; font-weight: 700">금액</th>
                                <th style="color:#000; font-weight: 700">용도</th>
                                <th class="td_5" style="color:#000; font-weight: 700">작성자</th>
                                <th class="td_10" style="color:#000; font-weight: 700">작성날짜</th>
                                <th class="td_10" style="color:#000; font-weight: 700">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty orderList}">
                                    <tr>
                                        <td colspan="10">등록된 구매요청 정보가 없습니다.</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${orderList}" var="list" varStatus="status">
                                
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${list.orderPName}</td>
                                    <td>${list.orderPAmount}</td>
                                    <td>${list.orderPUnit}</td>
                                    <td>
                                    	<fmt:formatNumber value="${list.orderPBuy}" pattern="#,###"/>
                                    </td>
                                    <td>
                                    	<fmt:formatNumber value="${list.orderTotalPrice}" pattern="#,###"/>
                                    </td>
                                    <td>${list.orderPurpose}</td>
                                    <td>${list.orderEmpName}</td>
                                    <td>${list.orderDate}</td>
                                    <td>
                                    	<c:choose>
        	                            	<c:when test="${orderConfirm eq 'Y'}">
    	                                		<button class="s_btn_red">수정불가</button>
	                                    	</c:when>
	                                    	<c:otherwise>
    	                                		<button class="s_btn_red" onClick="deleteOne(${list.orderId});">삭제</button>
	                                    	</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
	<script src = " ${pageContext.request.contextPath}/js/order_buy.js"></script> 