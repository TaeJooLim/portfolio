<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vacation.css">
    
<div class="page_wrap bg_white noto font_14">
    <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">연차 / 휴가 신청</h2>
            </div>
            <div class="main_right_info p_20">
                <div class="right_top">
                    <div class="flex space_between">
                        <div class="">
                            <div class="table_title">
                                <i class="fas fa-edit"></i> 연차 / 휴가 신청
                            </div>
                            <div class="vacationInfo_box">
                                <div class="emp_info m_b10 flex">
                                    <div class="employee_count_btn_grp flex m_r5">
                                        <div class="left_radius_btn white">사원번호</div>
                                        <div class="right_radius_btn">${employee.empNum}</div>
                                    </div>
                                    <div class="employee_count_btn_grp flex m_r5">
                                        <div class="left_radius_btn white">사원명</div>
                                        <div class="right_radius_btn">${employee.empName}</div>
                                    </div>
                                    <div class="employee_count_btn_grp flex">
                                        <div class="left_radius_btn white">소속</div>
                                        <div class="right_radius_btn">${employee.empDepartmentName} ${employee.empTeam}</div>
                                    </div>
                                </div>
                                <div class="">
                                	<form id="vcFrm" onsubmit="return chk();" action="${pageContext.request.contextPath}/admin/vacation?empId=${employee.empId}" method="POST">
                                	<input type="hidden" name="empIdFk" id="empIdFk" value="${employee.empId}">
                                    <div class="flex space_between">
                                        <div class="">
                                        	<div class="weight_700 m_b5">시작일</div>
                                            <input type="date" name="offStartDate" maxlength="20" id="offStartDate" class="input_100" required />
                                        </div>
                                        <div class="weight_700 m_lr5" style="line-height: 35px; padding-top:25px;"> ~ </div>
                                        <div class="">
                                        	<div class="weight_700 m_b5">종료일</div>
                                            <input type="date" name="offEndDate" maxlength="20" id="offEndDate" class="input_100" required />
                                        </div>
                                        <div class="" style="padding-top:25px;">
                                            <select class="m_l5 sel_100" name="offType" style="width: 60px;">
                                                <option value="A">연차</option>
                                                <option value="B">반차</option>
                                                <option value="C">반반차</option>
                                                <option value="D">휴직</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="m_t10 flex space_between">
                                        <div class="">
                                            <span class="weight_700" style="line-height: 35px;">신청 일수</span>
                                            <input type="text" id="offDateCnt" name="offDateCnt" class="num_auto center" onClick="chkDate();" maxlength="20" required placeholder="클릭하여 확인" readonly />
                                            <input type="hidden" name="empOffUse" id="empOffUse" value="${employee.empOffUse}" >
                                            <input type="hidden" name="empOffRemain" id="empOffRemain" value="${employee.empOffRemain}" >
                                            <span class="">일</span>
                                        </div>
                                        <div class="">
                                            <button type="submit" class="btn_blue">신청</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="w_100 p_l15">
                            <div class="font_16 weight_500 m_b10">
                                연차 / 휴가 사용 내역
                            </div>
                            <table class="vacationInfo_tbl">
                                <tr>
                                    <td class="td_25">입사일</td>
                                    <td class="td_25">총 휴가일수</td>
                                    <td class="td_25">잔여 휴가일수</td>
                                    <td class="td_25">사용 휴가일수</td>
                                </tr>
                                <tr>
                                    <td>${employee.empEnter}</td>
                                    <td class="under weight_700">${employee.empOffTotal}</td>
                                    <td class="under weight_700">${employee.empOffRemain}</td>
                                    <td>${employee.empOffUse}</td>
                                </tr>
                                <tr>
                                    <td>연차일수</td>
                                    <td>반차일수</td>
                                    <td>반반차일수</td>
                                    <td>휴직일수</td>
                                </tr>
                                <tr>
                                    <td>${typeA}일</td>
                                    <td>${typeB}일</td>
                                    <td>${typeC}일</td>
                                    <td>${typeD}일</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="right_bottom">

                    <div class="font_16 weight_500 m_b10 m_t30">
                        연차 / 휴가 신청 현황
                    </div>
                    <div class="tbl_wrap">
                        <table class="emp_info_tbl">
                            <tr>
                            	<td>번호</td>
                            	<td>문서번호</td>
                                <td>휴가분류</td>
                                <td>성명</td>
                                <td>소속</td>
                                <td>직위</td>
                                <td>시작일</td>
                                <td>종료일</td>
                                <td>사용일수</td>
                                <td>상태</td>
                                <td>신청일자</td>
                                <td class="td_5">관리</td>
                            </tr>
                            <c:if test="${empty vacationList}">
                            	<tr>
                                    <td colspan="12">휴가 신청 내역이 없습니다.</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${vacationList}" var="vc">
                            	<tr>
                            		<td></td>
	                            	<td>${vc.offDocNum}</td>
	                                <td>
                                        <c:if test="${vc.offType eq 'A'}">연차</c:if>
                                        <c:if test="${vc.offType eq 'B'}">반차</c:if>
                                        <c:if test="${vc.offType eq 'C'}">반반차</c:if>
                                        <c:if test="${vc.offType eq 'D'}">휴직</c:if>
	                                </td>
	                                <td>${vc.empName}</td>
	                                <td>${vc.empDepartmentName}</td>
	                                <td>${vc.empPositionName}</td>
	                                <td>${vc.offStartDate}</td>
	                                <td>${vc.offEndDate}</td>
	                                <td>${vc.offDateCnt}</td>
	                                <td>
	                                	<c:choose>
		                                    <c:when test="${vc.offConfirm eq 'Y'}">
		                                    			<button type="button" class="s_btn_blue"  style="cursor:default;">완결</button>
		                                    </c:when>
		                                    <c:otherwise>
		                                    			<button type="button" class="s_btn_red" style="cursor:default;">미결</button>
		                                    </c:otherwise>
	                                    </c:choose>
	                                </td>
	                                <td>${vc.offRegdate}</td>
	                                <td>
	                                	<button class="s_btn_gray" onClick="deleteOne('${vc.offConfirm}','${vc.offDocNum}', ${vc.offDateCnt});">취소</button>
	                                </td>
                            	</tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="page_grp center m_t15">
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
        </div>
    </div>
</div>

<script src = "${pageContext.request.contextPath}/js/vacation.js"></script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>