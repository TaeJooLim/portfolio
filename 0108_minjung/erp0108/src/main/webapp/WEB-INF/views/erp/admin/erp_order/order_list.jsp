<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<!-- 여기안에 내용을 복사하시면 됩니다! -->
    <div class="page_wrap bg_white noto font_14">
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
			<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">구매관리<i class="fas fa-chevron-right p_lr10"></i>2. 구매요청서목록</h2>
                </div>
                <div class="main_right_info p_20">
                    <div class="list m_tb20">
                    	<div class="flex space_between">
		                    <div class="flex space_between m_b5">
			                    <form method="POST" id="orderDepartFrm" name="" action="${pageContext.request.contextPath}/admin/orderList" >
			                    	<div class="" >
					                   	<select class="input_box" id="empDepartment" name="searchOpt" style="width:150px;" >
					                   		<option value="all">전체</option>
					                        <c:forEach items="${dList}" var="dlist">
					                        	<option value="${dlist.empDepartment}" <c:if test="${dlist.empDepartment eq empDepartment}">selected</c:if> >${dlist.empDepartmentName}</option>
					                    	</c:forEach>
					                    </select>
					                	<button type="submit" class="btn_ivory" style="line-height:10px;">조회</button>
					                </div>
			                    </form>
		                    </div>
		                </div>
                        <table class="list">
                            <thead>
                            <tr>
                                <th class="">번호</th>
                                <th class="">문서번호</th>
                                <th class="">제목</th>
                                <th class="">작성자</th>
                                <th class="">결재여부</th>
                                <th class="">결재일자</th>
                                <th class="">작성일자</th>
                                <th class="">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty subjectList}">
                                    <tr>
                                        <td colspan="10">등록된 구매요청 정보가 없습니다.</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${subjectList}" var="slist">
	                                <tr>
	                                    <td>번호</td>
	                                    <td>${slist.orderDocNum}</td>
	                                    <td><a class="under weight_700" href="${pageContext.request.contextPath}/admin/orderInfo?orderDocNum=${slist.orderDocNum}">${slist.orderSubject}</a></td>
	                                    <td>${slist.empDepartmentName} ${slist.orderEmpName} ${slist.empPositionName}</td>
	                                    <td>
	                                    	<c:choose>
	                                    		<c:when test="${slist.orderConfirm eq 'Y'}">
	                                    			<button type="button" class="s_btn_blue">완결</button>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<button type="button" class="s_btn_red">미결</button>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </td>
	                                    <td>${slist.orderConfirmDate}</td>
	                                    <td>${slist.orderDate}</td>
	                                    <td>
	                                    	<c:choose>
	                                    		<c:when test="${slist.orderConfirm eq 'Y'}">
	                                    			<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/admin/orderForm?orderDocNum=${slist.orderDocNum}')">출력</button>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<button type="button" class="s_btn_red" onClick="window.open('${pageContext.request.contextPath}/admin/orderForm?orderDocNum=${slist.orderDocNum}')">결재</button>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    	<button type="button" class="s_btn_blue" onClick="window.open('${pageContext.request.contextPath}/admin/orderForm?orderDocNum=${slist.orderDocNum}')">보기</button>
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
<script src = " ${pageContext.request.contextPath}/js/order.js"></script> 
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>