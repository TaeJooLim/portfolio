<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">

<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empAuth ne 10 && ( sessionScope.empDepartment ne '400' && sessionScope.empDepartment ne '100' || sessionScope.empHeadcheck ne 'Y')}">
	<script>
		alert("인사과, 총무과 부서장 전용입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
	<div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">전자결재관리<i class="fas fa-chevron-right p_lr10"></i>2. 완결함</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="search_wrap">
	            	<div class="total_cnt_btn_grp flex">
	            		<c:choose>
	            			<c:when test="${appType eq 'V'}">
			            		<a href="${pageContext.request.contextPath}/user/appComplete?empId=${sessionScope.empId}">
		                            <button type="button" class="rad_btn_blue m_r5">휴가신청서</button>
		                        </a>
	            			</c:when>
	            			<c:otherwise>
	            				<a href="${pageContext.request.contextPath}/user/appComplete?empId=${sessionScope.empId}&appType=O">
	                        		<button type="button" class="rad_btn_blue m_r5">구매요청서</button>
                        		</a>
	            			</c:otherwise>
	            		</c:choose>
	                	<div class="search_cnt_btn_grp flex">
	                    	<button type="button" class="left_radius_btn white">검색 결과</button>
	                		<button class="right_radius_btn">${listCnt}개</button>
	                	</div>
	                </div>
	                <form id="" name="" method="post" action="${pageContext.request.contextPath}/user/appComplete?appType=${appType}&empId=${sessionScope.empId}">
		                <div class="search_grp flex m_t10">
		                	<select class="search_sel_box" id="searchOpt" onChange="changeInput(this.value);" name="searchOpt">
		                    	<option value="emp_name" <c:if test="${searchOpt eq 'emp_name' }">selected</c:if> >사원명</option>
		                	</select>
		                	<input type="text" class="m_lr5 p_l5" id="words" name="words" value="" />
		                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
		                </div>
	                </form>
                </div>
            <div class="m_t10 m_b30">
                <table class="user_table_list">
                    <thead>
                        <tr>
                            <th class="td_3">번호</th>
                            <th class="td_10">문서번호</th>
                            <th class="td_10">분류</th>
                            <th class="td_10">기안자</th>
                            <th>제목</th>
                            <th class="td_12">기안일</th>
                            <th class="td_10">결재일</th>
                            <th class="td_10">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${List}" var="list" varStatus="status">
	                        <tr>
	                            <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageCnt)}</td>
	                            <td>${list.orderDocNum}</td>
	                            <td>${approvalType}</td>
	                            <td>${list.empDepartmentName} ${list.orderEmpName} ${list.empPositionName}</td>
	                            <td><b>
	                            	<c:choose>
	                            		<c:when test="${appType eq 'V'}">${approvalType}</c:when>
	                            	</c:choose>
	                            ${list.orderSubject}
	                            </b></td>
	                            <td>${list.orderDate}</td>
	                            <td>${list.orderConfirmDate}</td>
	                            <td>
	                           		<c:choose>
	                           			<c:when test="${appType eq 'V'}">
		                           			<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/user/vacationForm?offDocNum=${list.orderDocNum}')">출력</button>
		                           			<button type="button" class="s_btn_blue" onClick="window.open('${pageContext.request.contextPath}/user/vacationForm?offDocNum=${list.orderDocNum}')">보기</button>
	                           			</c:when>
	                           			<c:otherwise>
	                       					<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/user/orderForm?orderDocNum=${list.orderDocNum}')">출력</button>
	                       					<button type="button" class="s_btn_blue" onClick="window.open('${pageContext.request.contextPath}/user/orderForm?orderDocNum=${list.orderDocNum}')">보기</button>
	                           			</c:otherwise>
	                           		</c:choose>
	                           	</td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                    <c:if test="${empty List}">
	                    <tfoot>
	                        <tr>
	                            <td class="weight_700" colspan="8" style="height: 100px">결재대기중인 문서가 없습니다.</td>
	                        </tr>
	                    </tfoot>
                    </c:if>
                </table>
            </div>
	        <%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
        </div>
    </div>
    <div>
    	<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>
    </div>
<script>
	var curHref = "/erp/user/appComplete?empId=${sessionScope.empId}";
		function fn_paging(curPage) {
		var searchTXT = "&searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>
