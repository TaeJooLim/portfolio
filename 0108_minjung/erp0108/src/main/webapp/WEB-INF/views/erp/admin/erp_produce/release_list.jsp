<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>

 <div class="page_wrap bg_white noto font_14">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>3. 출고상품목록</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="search_wrap">
		            	<div class="total_cnt_btn_grp flex">
		            		<a href="${pageContext.request.contextPath}/admin/release_list">
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
			                    	<option value="prod_p_name">품명</option>
			                    	<option value="prod_doc_num_fk">문서번호</option>
			                    	<option value="cont_client_company">거래처명</option>
			                	</select>
			                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="" />
			                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
		                </form>
	                </div>
                    <div class="product_reg_table m_t20" style="border-top: 1px solid #000;">
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            출고완료된 상품 목록입니다.
                        </div>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list">
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
                                    	<c:forEach items="${pList}" var="plist">
                                            <tr>
                                                <td>1</td>
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
                                    </tbody> 
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>