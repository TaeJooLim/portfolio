<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/employee_list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empAuth < 10 && sessionScope.empDepartment ne '100'}">
	<script>
		alert("인사과 전용입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
<body>
    <div class="page_wrap bg_white noto font_14" >
        <div class="page_main flex space_between">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">인사/급여관리<i class="fas fa-chevron-right p_lr10"></i>3. 사원목록보기</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="right_top">
                        <div class="search_wrap">
                            <div class="total_cnt_btn_grp flex">
                                <a href="${pageContext.request.contextPath}/user/employee_list">
                                    <div class="total_list_btn m_r5"> 전체목록 </div>
                                </a>
                                <div class="search_cnt_btn_grp flex">
                                    <div class="left_radius_btn white">검색된 사원 수</div>
                                    <div class="right_radius_btn">${listCnt}명</div>
                                </div>
                            </div>
                            <form id="" name="" action="">
                                <div class="search_grp flex m_t10">
                                    <select class="search_sel_box" id="" name="searchOpt">
                                        <option value="emp_name" <c:if test="${searchOpt eq 'emp_name'}">selected</c:if> >사원명</option>
	                                    <option value="emp_num" <c:if test="${searchOpt eq 'emp_num'}">selected</c:if>>사원번호</option>
	                                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
                                    </select>
                                    <input type="text" class="m_lr5 p_l5" id="" name="words" value="${words}" />
                                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="flex m_tb10">
                            <div>
                                <button class="btn_red" id="deleteAll">선택삭제</button>
                            </div>
                            <div class="list_comment font_12" style="width:100%; padding: 10px 20px; background-color: #f9f9f9;">
                                회원자료 삭제 시 다른 회원이 기존 회원아이디를 사용하지 못하도록 회원아이디, 이름, 닉네임은 삭제하지 않고 영구 보관합니다.
                            </div>
                        </div>
                    </div>
                    <div class="right_bottom">
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="td_2" rowspan="2" style="line-height: 15px;">
                                            <input type="checkbox" onClick="chkAll();" id="chkAll" />
                                        </th>
                                        <th rowspan="2" class="td_5">번호</th>
                                        <th>소속</th>
                                        <th>직급</th>
                                        <th>사원번호</th>
                                        <th>생년월일</th>
                                        <th class="td_5">호봉</th>
                                        <th class="td_5">부서장여부</th>
                                        <th>휴대폰</th>
                                        <th class="td_20">입사년월일</th>
                                        <th class="td_5" rowspan="2">관리</th>
                                    </tr>
                                    <tr>
                                        <th>근무부서</th>
                                        <th>직책</th>
                                        <th>사원명</th>
                                        <th>성별</th>
                                        <th>권한</th>
                                        <th>승인여부</th>
                                        <th>내선전화</th>
                                        <th>가입년월일</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:if test="${empty list}">
                                        <tr>
                                            <td colspan="11">등록된 사원 정보가 없습니다.</td>
                                        </tr>
                                    </c:if>

                                    <c:forEach items="${list}" var="emp" varStatus="status">
                                        <tr>
                                            <td rowspan="2" style="line-height: 15px;">
                                                <input type="checkbox" name="chk" class="chk" data-uid="${emp.empId}" />
                                            </td>
                                            <td rowspan="2">
                                            	${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}
                                            </td>
                                            <td>${emp.empCompany}</td>
                                            <td>${emp.empPositionName}</td>
                                            <td><a href="${pageContext.request.contextPath}/user/employee_register?empId=${emp.empId}" class="under">${emp.empNum}</a></td>
                                            <td>${emp.empBirth}</td>
                                            <td>${emp.empStep}</td>
                                            <td style="line-height: 15px;">
                                                <input type="checkbox" onClick="headChange(this.value, '${emp.empNum}');" value="${emp.empHeadcheck}" class="headChk" <c:if test="${emp.empHeadcheck eq 'Y'}">checked</c:if> />
                                            </td>
                                            <td>${emp.empCP}</td>
                                            <td>${emp.empEnter}</td>
                                            <td rowspan="2">
                                                <button class="s_btn_blue" onClick="window.location.href='${pageContext.request.contextPath}/user/employee_register?empId=${emp.empId}'">수정</button>
                                                <button class="s_btn_gray" onClick="deleteOne(${emp.empId});">삭제</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>${emp.empDepartmentName} ${emp.empTeam} </td>
                                            <td>
                                            	<c:if test="${emp.empLeader ne '-'}">${emp.empLeader}</c:if>
                                            </td>
                                            <td><a href="${pageContext.request.contextPath}/user/employee_register?empId=${emp.empId}" class="under">${emp.empName}</a></td>
                                            <td>${emp.empGender}</td>
                                            <td class="p_tb2">
                                            	<select class="sel_100" name="empAuth" id="empAuth" onChange="authChange(this.value, '${emp.empId}');" style="height:30px;">
                                            		<c:forEach var="status" begin = "1" end = "10">
                                            			<option value="${status}" <c:if test="${emp.empAuth eq status}"> selected </c:if>>${status}</option>
                                            		</c:forEach>
                                            		
                                            	</select>
                                            </td>
                                            <td style="line-height: 15px;">
                                                <input type="checkbox" onClick="confirmChange(this.value, '${emp.empNum}');" value="${emp.empConfirm}" class="confirmChk" <c:if test="${emp.empConfirm eq 'Y'}">checked</c:if> />
                                            </td>
                                            <td>${emp.empExtension}</td>
                                            <td>
                                            	<fmt:formatDate value="${emp.empRegdate}" type="date" pattern="yyyy-MM-dd" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
		        	<%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
		        </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
<script src = "${pageContext.request.contextPath}/js/employee_list.js"></script>
<script>
	var curHref = "/erp/user/employee_list";
	function fn_paging(curPage) {
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>
            