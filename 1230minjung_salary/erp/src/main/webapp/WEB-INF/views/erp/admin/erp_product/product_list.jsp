<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
</head>

<div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">상품목록</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="product_list">
	            <div class="search_wrap">
	            	<div class="total_cnt_btn_grp flex">
	            		<a href="${pageContext.request.contextPath}/admin/product_list">
		                	<div class="total_list_btn m_r5">전체목록</div>
	            		</a>
	                	<div class="search_cnt_btn_grp flex">
	                    	<div class="left_radius_btn white">검색된 상품수</div>
	                		<div class="right_radius_btn">${pCnt}개</div>
	                	</div>
	                </div>
	                <form id="" name="" action="">
		                <div class="search_grp flex m_t10">
		                	<select class="search_sel_box" id="" name="searchOpt">
		                    	<option value="p_name">품명</option>
		                    	<option value="p_code">상품코드</option>
		                    	<option value="p_brand">제조사</option>
		                    	<option value="all">전체검색</option>
		                	</select>
		                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="" />
		                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
		                </div>
	                </form>
                </div>
            </div>
            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="list_tbl_wrap m_t20">
                    <table class="list">
                        <thead>
							<tr>
								<th class="td_3">번호</th>
								<th class="td_15">품명</th>
								<th>상품코드</th>
								<th>제조사</th>
								<th>거래처명</th>
								<th>모델번호</th>
								<th>대분류</th>
								<th>소분류</th>
								<th>기준단위</th>
								<th>규격</th>
								<th class="td_10">구매단가</th>
								<th class="td_10">판매단가</th>
								<th class="td_15">비고</th>
								<th>관리</th>
							</tr>
                        </thead>
                        <tbody>
                        	<c:if test="${ pCnt == 0 }">
                        		<tr>
                        			<td class="weight_700" colspan="14">등록된 상품이 없습니다.</td>
                        		<tr>
                        	</c:if>
                        	<c:forEach items="${pList}" var="plist">
								<tr>
									<td>${plist.pId}</td>
									<td>${plist.pName}</td>
									<td>${plist.pCode}</td>
									<td>${plist.pBrand}</td>
									<td>${plist.clientCompany}</td>
									<td>${plist.pModelnum}</td>
									<td>
										<c:choose>
											<c:when test="${plist.pType eq 'A'}">제품</c:when>
											<c:when test="${plist.pType eq 'B'}">원자재</c:when>
											<c:when test="${plist.pType eq 'C'}">상품</c:when>
											<c:when test="${plist.pType eq 'D'}">비품</c:when>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${plist.pGroup eq '01'}">컴퓨터</c:when>
											<c:when test="${plist.pGroup eq '02'}">전자기기</c:when>
											<c:when test="${plist.pGroup eq '03'}">스마트폰</c:when>
											<c:when test="${plist.pGroup eq '04'}">사무용품</c:when>
											<c:when test="${plist.pGroup eq '05'}">비품</c:when>
										</c:choose>
									</td>
									<td>${plist.pUnit}</td>
									<td>${plist.pSize}</td>
									<td>${plist.pBuy}</td>
									<td>${plist.pSell}</td>
									<td>${plist.pNote}</td>
									<td>
										<button type="button" class="s_btn_blue" onClick="window.location.href='${pageContext.request.contextPath}/admin/product_modify?pId=${plist.pId}'">수정</button>
										<button type="button" class="s_btn_red" onClick="deleteProductOne(${plist.pId});">삭제</button>
									</td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/js/product.js"></script>
<script>
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>