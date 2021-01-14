<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

    <div class="page_wrap bg_white noto font_14">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">연차사용이력조회</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
                <div class="search_wrap">
	            	<div class="total_cnt_btn_grp flex">
	            		<a href="${pageContext.request.contextPath}/admin/vacation_list">
		                	<div class="total_list_btn m_r5">전체목록</div>
	            		</a>
	                	<div class="search_cnt_btn_grp flex">
	                    	<div class="left_radius_btn white">검색 결과</div>
	                		<div class="right_radius_btn">${vCnt}개</div>
	                	</div>
	                </div>
	                <form id="" name="" method="post" action="${pageContext.request.contextPath}/admin/vacation_list">
		                <div class="search_grp flex m_t10">
		                	<select class="search_sel_box" id="searchOpt" onChange="changeInput(this.value);" name="searchOpt">
		                    	<option value="emp_name" <c:if test="${searchOpt eq 'emp_name' }">selected</c:if> >사원명</option>
		                    	<option value="emp_num" <c:if test="${searchOpt eq 'emp_num' }">selected</c:if> >사원번호</option>
		                    	<option value="off_date" <c:if test="${searchOpt eq 'off_date' }">selected</c:if> >사용일자</option>
		                    	<option value="off_type" <c:if test="${searchOpt eq 'off_type' }">selected</c:if> >휴가분류</option>
		                    	<option value="off_confirm" <c:if test="${searchOpt eq 'off_confirm' }">selected</c:if> >결재여부</option>
		                    	<option value="all" <c:if test="${searchOpt eq 'all' }">selected</c:if> >전체검색</option>
		                	</select>
		                	<input type="text" class="m_lr5 p_l5" id="words" name="words" value="" />
		                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
		                </div>
	                </form>
                </div>

            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="w_100 white_s_no overflow_x_auto">
                    <div class="list_title">
                        <h2 class="font_18 m_tb10">연차사용이력조회</h2>
                    </div>
                    <div class="m_b5">
                        <div class="tbl_wrap">
                            <table class="list clearfix">
                                <thead>
                                	<tr>
                                		<th class="td_5">번호</th>
	                                    <th>문서번호</th>
	                                    <th>사용일자</th>
	                                    <th>휴가분류</th>
	                                    <th>사원번호</th>
	                                    <th>사원명</th>
	                                    <th>소속</th>
	                                    <th>직위</th>
	                                    <th>사용일수</th>
	                                    <th>잔여일수</th>
	                                    <th>신청일자</th>
	                                    <th class="td_7">결재여부</th>
	                                    <th>관리</th>
	                                    <th>결재일자</th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<c:if test="${empty vList}">
                                		<tr>
                                    		<td colspan="14">휴가 신청 내역이 없습니다.</td>
                               			</tr>
                                	</c:if>
                                	<c:forEach items="${vList}" var="list">
		                                <tr>
		                                	<td> </td>
		                                    <td>${list.offDocNum}</td>
		                                    <td>${list.offStartDate} ~ ${list.offEndDate}</td>
		                                    <td>
		                                    	<c:if test="${list.offType eq 'A'}">연차</c:if>
                                        		<c:if test="${list.offType eq 'B'}">반차</c:if>
                                        		<c:if test="${list.offType eq 'C'}">반반차</c:if>
                                        		<c:if test="${list.offType eq 'D'}">휴직</c:if>
		                                    </td>
		                                    <td>${list.empNum}</td>
		                                    <td>${list.empName}</td>
		                                    <td>${list.empDepartmentName}</td>
		                                    <td>${list.empPositionName}</td>
		                                    <td>${list.offDateCnt}</td>
		                                    <td>${list.empOffRemain}</td>
		                                    <td>${list.offRegdate}</td>
		                                    <td>
		                                    	<c:choose>
		                                    		<c:when test="${list.offConfirm eq 'Y'}">
		                                    			<button type="button" class="s_btn_blue"  style="cursor:default;">완결</button>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			<button type="button" class="s_btn_red" style="cursor:default;">미결</button>
		                                    		</c:otherwise>
	                                    		</c:choose>
		                                    </td>
		                                    <td>
		                                    	<c:choose>
		                                    		<c:when test="${list.offConfirm eq 'Y'}">
		                                    			<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/admin/vacationForm?offDocNum=${list.offDocNum}')">출력</button>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			<button type="button" class="s_btn_red"  onClick="updateConfirm('${list.offConfirm}', '${list.offDocNum}');" >결재</button>
		                                    		</c:otherwise>
		                                    	</c:choose>
	                                    		<button type="button" class="s_btn_blue" onClick="window.open('${pageContext.request.contextPath}/admin/vacationForm?offDocNum=${list.offDocNum}')">보기</button>
		                                    </td>
		                                    <td>
		                                    	<c:choose>
		                                    		<c:when test="${list.offConfirm eq 'Y'}">
		                                    			${list.offConfirmDate}
		                                    		</c:when>
		                                    		<c:otherwise>-
		                                    		</c:otherwise>
	                                    		</c:choose>
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
    </div>

<script src = "${pageContext.request.contextPath}/js/vacation_list.js"></script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>