<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empAuth ne 10 && ( sessionScope.empDepartment ne '400' || sessionScope.empHeadcheck ne 'Y')}">
	<script>
		alert("총무과 부서장 전용입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
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
			                    <form method="POST" id="orderDepartFrm" name="" action="${pageContext.request.contextPath}/user/orderList" >
			                    	<div class="" >
					                   	<select class="input_box" id="empDepartment" name="searchOpt" style="width:150px;" >
					                   		<option value="all">전체</option>					                        
					                   		<option value="000"  <c:if test="${searchOpt eq '000'}">selected</c:if>>중앙부서</option>					                        
					                   		<option value="100"  <c:if test="${searchOpt eq '100'}">selected</c:if>>인사과</option>					                        
					                   		<option value="200"  <c:if test="${searchOpt eq '200'}">selected</c:if>>경영과</option>					                        
					                   		<option value="300"  <c:if test="${searchOpt eq '300'}">selected</c:if>>기획과</option>					                        
					                   		<option value="400"  <c:if test="${searchOpt eq '400'}">selected</c:if>>총무과</option>					                        
					                   		<option value="500"  <c:if test="${searchOpt eq '500'}">selected</c:if>>전산과</option>					                        
					                   		<option value="600"  <c:if test="${searchOpt eq '600'}">selected</c:if>>지원과</option>					                        
					                   		<option value="700"  <c:if test="${searchOpt eq '700'}">selected</c:if>>영업과</option>					                        
					                   		<option value="800"  <c:if test="${searchOpt eq '800'}">selected</c:if>>마케팅과</option>					                        
					                   		<option value="900"  <c:if test="${searchOpt eq '900'}">selected</c:if>>생산과</option>					                        
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
                                <c:forEach items="${subjectList}" var="slist" varStatus = "status">
	                                <tr>
	                                    <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
	                                    <td>${slist.orderDocNum}</td>
	                                    <td><a class="under weight_700" href="${pageContext.request.contextPath}/user/order_insert?empDepartment=${slist.orderEmpTeam}">${slist.orderSubject}</a></td>
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
	                                    			<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/user/orderForm?orderDocNum=${slist.orderDocNum}')">출력</button>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<button type="button" class="s_btn_red" onClick="signConfirm('${slist.orderDocNum}');">결재</button>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    	<button type="button" class="s_btn_blue" onClick="window.open('${pageContext.request.contextPath}/user/orderForm?orderDocNum=${slist.orderDocNum}')">보기</button>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
        <%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
<script src="${pageContext.request.contextPath}/js/order_buy.js"></script> 
<script>
	var curHref = "/erp/user/orderList";
	function fn_paging(curPage) {
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>
