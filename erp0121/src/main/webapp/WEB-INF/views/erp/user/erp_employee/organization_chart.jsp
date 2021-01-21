<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_origanization_chart.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
 

<div class="page_wrap bg_white noto font_14">
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">인사/급여관리<i class="fas fa-chevron-right p_lr10"></i>2. 사내조직도</h2>
                </div>
                <div class="main_right_info flex">
                    <div class="info_left p_20 ">
                        <div class="board_left">
                            <ul>
	                            <c:forEach items="${dList}" var="dlist" >
	                                <li><a href="${pageContext.request.contextPath}/user/organization_chart?empDepartment=${dlist.empDepartment}"><i class="fas fa-address-book"></i> ${dlist.empDepartmentName} 조직도</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="info_right p_20">
                    	<div class="table_wrap_box">
                    	<form id="" name="" action="" method="post">
                            <div class="search_grp flex">
                                <select class="search_sel_box" id="" name="searchOpt">
                                    <option value="emp_name" <c:if test="${searchOpt eq 'emp_name'}">selected</c:if> >사원명</option>
                                    <option value="emp_num" <c:if test="${searchOpt eq 'emp_num'}">selected</c:if>>사원번호</option>
                                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
                                </select>
                                <input type="text" class="m_lr5 p_l5" id="" name="words" value="${words}" />
                                <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
                                </div>
                            </form>
                        <div class="org_info m_tb10 flex space_between">
                            <div class="org_info_left flex">
                            	<a href="${pageContext.request.contextPath}/user/organization_chart?empDepartment=${empDepartment}">
                                    <button class="total_list_btn m_r5" style="line-height: 30px;"> 전체목록 </button>
                                </a>
                                <div class="flex m_r5">
                                    <button class="left_radius_btn white">근무부서</button>
                                    <button class="right_radius_btn" style="line-height: 30px;">${departName}</button>
                                </div>
                                <div class="flex">
                                    <button class="left_radius_btn white">검색된 사원 수</button>
                                    <button class="right_radius_btn" style="line-height: 30px;">${listCnt}명</button>
                                </div>
                            </div>
                        </div>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="user_table_list m_b30">
                                <thead>
                                    <tr>
                                        <th class="td_3" rowspan="2">
                                            번호
                                        </th>
                                        <th rowspan="2">사진</th>
                                        <th>소속</th>
                                        <th>직급</th>
                                        <th>사원번호</th>
                                        <th>생년월일</th>
                                        <th class="td_5">부서장여부</th>
                                        <th>휴대폰</th>
                                        <th>입사년월일</th>
                                    </tr>
                                    <tr>
                                        <th>근무부서</th>
                                        <th>직책명</th>
                                        <th>사원명</th>
                                        <th>성별</th>
                                        <th>내선전화</th>
                                        <th>이메일</th>
                                        <th>가입년월일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${empty list}">
                                		 <td colspan="9">등록된 사원 정보가 없습니다.</td>
                                	</c:if>
                                	<c:forEach items="${list}" var="list" varStatus="status">
                                    <tr>
                                        <td rowspan="2">
                                            ${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}
                                        </td>
                                        <td rowspan="2" class="user_img td_5">
                                            <c:choose>
                                            	<c:when test="${list.empPhoto eq null}">
                                           		   	<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg">
                                            	</c:when>
                                            	<c:otherwise>
                                            		<img src="${pageContext.request.contextPath}/imgUpload/${list.empPhoto}">
                                            	</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${list.empCompany}</td>
                                        <td>${list.empPositionName}</td>
                                        <td>${list.empNum}</td>
                                        <td>${list.empBirth}</td>
                                        <td>
                                        	<c:if test="${list.empHeadcheck eq 'Y' }">부서장</c:if>
                                        	<c:if test="${list.empHeadcheck eq 'N' }">-</c:if>
                                        </td>
                                        <td>${list.empCP}</td>
                                        <td>${list.empEnter}</td>

                                    </tr>
                                    <tr>
                                        <td>${list.empDepartmentName} ${list.empTeam}</td>
                                        <td>${list.empLeader}</td>
                                        <td class="weight_700">${list.empName}</td>
                                        <td>${list.empGender}</td>
                                        <td>${list.empExtension}</td>
                                        <td>${list.empEmail}</td>
                                        <td><fmt:formatDate value="${list.empRegdate}" type="date" pattern="yyyy-MM-dd" /></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
						<%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>
<script>
	var curHref = "/erp/user/organization_chart";
	function fn_paging(curPage) {
		var searchTXT = "?empDepartment=${empDepartment}&searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>