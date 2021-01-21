<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
<body>
    <div class="page_wrap bg_white noto font_14">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">영업관리<i class="fas fa-chevron-right p_lr10"></i>1. 계약서목록</h2>
            </div>
        </div>
        <div class="main_right_info p_20 p_tb30">
            <div class="table_wrap_box">
                <div class="search_wrap m_b10">
	            	<div class="total_cnt_btn_grp flex">
	            		<a href="${pageContext.request.contextPath}/user/contract_list">
		                	<div class="total_list_btn m_r5" style="line-height: 30px;">전체목록</div>
	            		</a>
	                	<div class="search_cnt_btn_grp flex">
	                    	<div class="left_radius_btn white" style="line-height: 30px;">검색된 계약수</div>
	                		<div class="right_radius_btn" style="line-height: 30px;">${listCnt}개</div>
	                	</div>
	                </div>
	                <form method="post" action="${pageContext.request.contextPath}/user/contract_list">
		                <div class="search_grp flex m_t10">
		                	<select class="search_sel_box" name="searchOpt">
			              		<option value="cont_doc_num" <c:if test="${searchOpt eq 'cont_doc_num'}"></c:if>>문서번호</option>
			                	<option value="cont_emp_name" <c:if test="${searchOpt eq 'cont_emp_name'}"></c:if>>담당자</option>
			                 	<option value="cont_client_company" <c:if test="${searchOpt eq 'cont_client_company'}"></c:if>>거래처</option>      
			           		</select>
		                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="${words}" required />
		                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
		                </div>
	                </form>
                </div>
                <div class="font_14 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                    <strong>생산등록</strong>을 누르면 해당 계약서의 생산계획 페이지로 이동합니다.<br/>
                    <strong>품질관리</strong>을 누르면 해당 계약서의 품질관리 현황을 볼 수 있는 페이지로 이동합니다.
                    <strong></strong>
                </div>
                <div class="w_100 white_s_no overflow_x_auto">
                    <table class="user_table_list m_b30">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>문서번호</th>
                                <th>담당자</th>
                                <th>거래처</th>
                                <th>거래처 담당자</th>
                                <th>발주일</th>
                                <th>납기일</th>
                                <th>생산관리</th>
                                <th>문서관리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${empty list}">
                           		<tr>
                           			<td class="weight_700" colspan="9">등록된 계약서 없습니다.</td>
                           		<tr>
                           	</c:if>
                        	<c:forEach var="cont" items="${list}" varStatus="status">
                            <tr>
                                <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
                                <td>${cont.contDocNum}</td>
                                <td>${cont.contDepartName} ${cont.contEmpName} ${cont.contPositionName}</td>
                                <td>${cont.contClientCompany}</td>
                                <td>${cont.contClientResponsibility}</td>
                                <td>${cont.contOrderDate}</td>
                                <td>${cont.contDueDate}</td>
                                <td>
                                    <button type="button" class="s_btn_blue" onClick="chkProduce('${cont.contDocNum}')">생산현황</button>
                                    <c:if test="${sessionScope.empAuth eq 10 || sessionScope.empDepartment eq '700' || sessionScope.empDepartment eq '900'}">
                                    	<button type="button" class="s_btn_gray" onClick="chkQc('${cont.contDocNum}')">품질검사</button>
                                	</c:if>
                                </td>
                                <td>
                                    <button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/user/estimate?contDocNum=${cont.contDocNum}')">출력</button>
                                    <c:if test="${sessionScope.empAuth eq 10 || sessionScope.empDepartment eq '700' || sessionScope.empDepartment eq '900'}">
	                                    <button type="button" class="s_btn_blue" onClick="chkRelease('${cont.contDocNum}')">수정</button>
	                                    <button type="button" class="s_btn_red" onClick="contDel(${cont.contID})">삭제</button>
                                	</c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
					<%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
                </div>
            </div>
        </div>
    </div>
    <div>
    	<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/user_contract_list.js"></script>
<script>
	var curHref = "/erp/user/contract_list";
	function fn_paging(curPage) {
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>