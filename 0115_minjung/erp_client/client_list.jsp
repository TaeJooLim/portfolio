<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100%;">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">영업관리<i class="fas fa-chevron-right p_lr10"></i>3. 거래처목록</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="search_wrap m_b10">
            	<div class="total_cnt_btn_grp flex">
            		<button type="button" class="total_list_btn m_r5" onclick="${pageContext.request.contextPath}/user/client_list">전체목록</button>
	               	<div class="search_cnt_btn_grp flex">
                     	<button class="left_radius_btn white">검색된 거래처 수</button>
	                    <button class="right_radius_btn">${count}개</button>
	                </div>
                </div>
                <form id="" name="" action="">
                  <div class="search_grp flex m_t10">
                     <select class="search_sel_box" id="" name="searchOpt">
                         <option value="client_company" <c:if test="${searchOpt eq 'client_company'}"> selected </c:if>>거래처명</option>
                         <option value="client_ceo_name" <c:if test="${searchOpt eq 'client_ceo_name'}"> selected </c:if>>대표자명</option>
                         <option value="client_company_phone" <c:if test="${searchOpt eq 'client_company_phone'}"> selected </c:if>>전화번호</option>
                         <option value="all" <c:if test="${searchOpt eq 'all'}"> selected </c:if>>전체검색</option>
                     </select>
                     <input type="text" class="m_lr5 p_l5" id="" name="words" value="${words}" />
                     <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
                  </div>
                </form>
            </div>
            <div class="w_100 white_s_no overflow_x_auto m_b30">
            	<table class="list">
            		<thead>
            			<tr>
            				<th>번호</th>
                            <th>사업자등록번호</th>
                            <th>거래처명</th>
                            <th>대표자명</th>
                            <th>전화번호</th>
                            <th>팩스번호</th>
                            <th>업태</th>
                            <th>종목</th>
                            <th>비고</th>
                            <c:if test="${sessionScope.empDepartment == 200}">
								<th>관리</th>
							</c:if>
							<c:if test="${sessionScope.empDepartment != 200}">
							</c:if>
					</tr>
                   	</thead>
                   	<c:forEach items="${list}" var="list" varStatus="status">
                   		<input type="hidden" name="clientId" value="${list.clientId}"/>
                        <tbody>
                            <tr>
                            	<td>${(count - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
	                            <td>${list.clientLicenseNum}</td>
	                            <td>${list.clientCompany}</td>
	                            <td>${list.clientCeoName}</td>
	                            <td>${list.clientCompanyPhone}</td>
	                            <td>${list.clientCompanyFax}</td>
	                            <td>${list.clientBusinessCondition}</td>
	                            <td>${list.clientBusinessType}</td>
	                            <td>${list.clientNote}</td>
	                            <c:if test="${sessionScope.empDepartment == 200}">
	                            <td>
	                            	<button type="button" onClick="location.href='${pageContext.request.contextPath}/user/client_mod?clientId=${list.clientId}'" class="s_btn_blue" style="background-color: #0099a4;">수정</button>
	                                <button type="button" onClick="deleteClient('${list.clientId}')" class="s_btn_red" style="background-color: #00136f;">삭제</button>
	                            </td>
	                            </c:if>
								<c:if test="${sessionScope.empDepartment != 200}"></c:if>
                            </tr>
                        </tbody> 
                   	</c:forEach>
                   	<c:if test="${empty list}">
                       	<tfoot>
			               <tr>
			                   <td class="weight_700" colspan="10" style="height: 100px">등록된 거래처가 없습니다.</td>
			               </tr>
		            	</tfoot>
               		</c:if>
                </table>
            </div>
            <%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
        </div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
</body>
<script>
	var curHref = "/erp/user/client_list";
	function fn_paging(curPage) {
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};

	function deleteClient(cid){
		var msg = "선택하신 거래처의 정보를 삭제하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/user/deleteClient",
				type	: "POST",
				data	: {
					cid	: cid
				},
				success	: function(resData){
					alert("삭제성공");
					window.location.reload();
				},
				error	: function(){
					alert("삭제 에러발생");
				},
				complete: function(){}
			});
		}
	}
</script>
