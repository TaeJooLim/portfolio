<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<body>
    <div class="page_wrap bg_white noto font_14">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">영업관리<i class="fas fa-chevron-right p_lr10"></i>1. 계약서목록</h2>
            </div>
        </div>
        <div class="main_right_info">
            <div class="p_20">
                <div class="search_wrap m_b10">
	            	<div class="total_cnt_btn_grp flex">
	            		<a href="${pageContext.request.contextPath}/admin/contract_list">
		                	<div class="total_list_btn m_r5">전체목록</div>
	            		</a>
	                	<div class="search_cnt_btn_grp flex">
	                    	<div class="left_radius_btn white">검색된 계약수</div>
	                		<div class="right_radius_btn">${listCnt}개</div>
	                	</div>
	                </div>
	                <form method="post" action="${pageContext.request.contextPath}/admin/contract_list">
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
                    <table class="list m_b10">
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
                                    <button type="button" class="s_btn_blue" onClick="chkProduce('${cont.contDocNum}')">생산등록</button>
                                    <button type="button" class="s_btn_gray" onClick="chkQc('${cont.contDocNum}')">품질검사</button>
                                </td>
                                <td>
                                    <button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/admin/estimate?contDocNum=${cont.contDocNum}')">출력</button>
                                    <button type="button" class="s_btn_blue" onClick="chkRelease('${cont.contDocNum}')">수정</button>
                                    <button type="button" class="s_btn_red" onClick="contDel(${cont.contID})">삭제</button>
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
</body>
<script src="${pageContext.request.contextPath}/js/contract_list.js"></script>
            <script>
				var curHref = "/erp/admin/contract_list";
				function fn_paging(curPage) {
					var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
					window.location.href = curHref + searchTXT + curPage;
				};
            </script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>