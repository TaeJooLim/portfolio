<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>

 <div class="page_wrap bg_white noto font_14">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>1. 출고상품목록</h2>
                </div>
             	<div class=""  style="padding: 30px 20px;">
                <div class="table_wrap_box main_right_info">
                    <div class="search_wrap">
		            	<div class="total_cnt_btn_grp flex">
		            		<a href="${pageContext.request.contextPath}/user/release_list">
			                	<button type="button" class="total_list_btn m_r5">전체목록</button>
		            		</a>
		                	<div class="search_cnt_btn_grp flex">
		                    	<button class="left_radius_btn white">검색된 상품수</button>
		                		<button class="right_radius_btn">${listCnt}개</button>
		                	</div>
		                </div>
		                <form id="" name="" action="">
			                <div class="search_grp flex m_t10">
			                	<select class="search_sel_box" id="" name="searchOpt">
			                    	<option value="prod_p_name">품명</option>
			                    	<option value="prod_doc_num_fk">문서번호</option>
			                    	<option value="cont_client_company">거래처명</option>
			                	</select>
			                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="" />
			                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
		                </form>
	                </div>
                    <div class="product_reg_table m_t20">
                        <div class="list_comment font_14 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            출고완료된 상품 목록입니다.
                        </div>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="user_table_list m_b30">
                                <thead>
                                    <tr>
                                        <th class="td_3">번호</th>
                                        <th class="td_10">문서번호</th>
                                        <th class="td_10">거래처명</th>
                                        <th class="td_10">거래처담당자</th>
                                        <th class="td_10">거래처담당자 연락처</th>
                                        <th class="td_10">품명</th>
                                        <th class="td_3">단위</th>
                                        <th class="td_3">수량</th>
                                        <th class="td_5">담당자명</th>
                                        <th class="td_10">발주일</th>
                                        <th class="td_10">납기일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
                                    		<c:when test="${empty pList}">
                                    			<tr><td colspan="11">입력하신 정보와 일치하는 출고완료상품이 없습니다.</td></tr>
                                    		</c:when>
                                    		<c:otherwise>
	                                    		<c:forEach items="${pList}" var="plist" varStatus="status">
		                                            <tr>
		                                                <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
		                                                <td>${plist.prodDocNumFk}</td>
		                                                <td>${plist.prodClientCompany}</td>
		                                                <td>${plist.prodClientResponsibility}</td>
		                                                <td>${plist.prodClientResCP}</td>
		                                                <td>${plist.prodPName}</td>
		                                                <td>${plist.prodPUnit}</td>
		                                                <td>${plist.prodPAmount}</td>
		                                                <td>${plist.prodDepartmentName} ${plist.prodEmpName} ${plist.prodPositionName}</td>
		                                                <td>${plist.prodOrderDate}</td>
		                                                <td>${plist.prodDueDate}</td>
		                                            </tr>
		                                    	</c:forEach>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </tbody> 
                            </table>
                        </div>
                    </div>
		    	<%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
                </div>
            </div>
        </div> 
    </div>
</div>
	<script>
		$(function() {
			var curHref = "/erp/user/release_list";

			function fn_paging(curPage) {
				var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
				window.location.href = curHref + searchTXT + curPage;
			};
		});
	</script>
<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>