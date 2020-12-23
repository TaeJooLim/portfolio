<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">거래처 목록</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="search_wrap">
              <div class="total_cnt_btn_grp flex">
                 <a href="${pageContext.request.contextPath}/admin/client_list">
                 	<div class="total_list_btn m_r5">전체목록</div>
                 </a>
                  <div class="search_cnt_btn_grp flex">
                      <div class="left_radius_btn white">검색된 거래처 수</div>
                     <div class="right_radius_btn">${count}개</div>
                  </div>
               </div>
               <form id="" name="" action="">
                  <div class="search_grp flex m_t10">
                     <select class="search_sel_box" id="" name="searchOpt">
                         <option value="client_company">거래처명</option>
                         <option value="client_ceo_name">대표자명</option>
                         <option value="client_company_phone">전화번호</option>
                         <option value="all">전체검색</option>
                     </select>
                     <input type="text" class="m_lr5 p_l5" id="" name="words" value="" />
                     <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
                  </div>
               </form>
            </div>
            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="">
                    <div class="w_100 white_s_no overflow_x_auto">
                        <table class="list m_t20">
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
                                    <th>관리</th>
                                </tr>
                           	</thead>
                           	<c:if test="${count == 0}">
                           		<tr>
                           			<td class="weight_700" colspan="10">등록된 거래처가 없습니다.</td>
                           		<tr>
                           	</c:if>
                           	<c:forEach items="${list}" var="list" varStatus="status">
                           		<input type="hidden" name="clientId" value="${list.clientId}"/>
                                <tbody>
                                    <tr>
	                                    <td>${list.clientId}</td>
	                                    <td>${list.clientLicenseNum}</td>
	                                    <td>${list.clientCompany}</td>
	                                    <td>${list.clientCeoName}</td>
	                                    <td>${list.clientCompanyPhone}</td>
	                                    <td>${list.clientCompanyFax}</td>
	                                    <td>${list.clientBusinessCondition}</td>
	                                    <td>${list.clientBusinessType}</td>
	                                    <td>${list.clientNote}</td>
	                                    <td>
		                                    <button type="button" onClick="location.href='${pageContext.request.contextPath}/admin/client_mod?clientId=${list.clientId}'" class="s_btn_blue">수정</button>
	                                        <button type="button" onClick="deleteClient('${list.clientId}')" class="s_btn_red">삭제</button>
                                        </td>
                                    </tr>
                                </tbody> 
                           	</c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <div class="page_grp center m_t10">
	            <a href="">
	                <span class="page"><i class="fas fa-angle-double-left"></i></span>
	            </a>
	            <a href="">
	                <span class="page"><i class="fas fa-angle-left"></i></span>
	            </a>
	            <a href="">
	                <span class="page">1</span>
	            </a>
	            <a href="">
	                <span class="page">2</span>
	            </a>
	            <a href="">
	                <span class="page">3</span>
	            </a>
	            <a href="">
	                <span class="page">4</span>
	            </a>
	            <a href="">
	                <span class="page">5</span>
	            </a>
	            <a href="">
	                <span class="page"><i class="fas fa-angle-right"></i></span>
	            </a>
	            <a href="">
	                <span class="page"><i class="fas fa-angle-double-right"></i></span>
	            </a>
	        </div>
        </div>
    </div>
</body>
<script>
	
	function deleteClient(cid){
		var msg = "선택하신 거래처의 정보를 삭제하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/deleteClient",
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
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>