<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp_attendance.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
<body>
    <div class="page_wrap bg_white noto font_14" >

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">근태관리<i class="fas fa-chevron-right p_lr10"></i>1. 출퇴근 현황</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 20px 20px;">
            <div class="flex space_between flex_vc">
                <div class="td_40">
                    <span class="weight_500" style="color:#555">선택한 년도의 해당 월 출근내역을 확인합니다.</span>
                </div>
                
                <div class="td_40 right">
                	<form id="frm" method="POST" action="${pageContext.request.contextPath}/user/attend_list?empIdFk=${sessionScope.empId}">
	                    <input type="month" id="words" name="words" style="height:35px;border:1px solid #ccc;" value="${words}"/>
	                    <button type="submit" class="btn_white">검색</button>
                    </form>
                </div>
            </div>
            <div class="m_t10">
                <div class="attend_box">
                    <div class="m_b10">
                        <h3>출퇴근 Summary</h3>
                    </div>
                    <div class="flex space_between">
                        <div class="attend_box_s flex" style="background-color: #00B8D4; border: transparent; box-shadow: 2px 3px 2px #ececec;">
                            <div class="attend_icon m_r10" style="background-color: #E0F7FA;">
                                <i class="fas fa-briefcase font_16" style="color: #00B8D4; "></i>
                            </div>
                            <div class="attend_info">
                                <div class="font_16 white weight_500">실제 출퇴근등록일</div>
                                <div class="white"><span class="font_20 weight_700">${count}</span> 건</div>
                            </div>
                        </div>

                        <div class="attend_box_s flex" style="">
                            <div class="attend_icon m_r10" style="background-color: #EDE7F6">
                                <i class="fas fa-briefcase font_16" style="color: #7C4DFF;"></i>
                            </div>
                            <div class="attend_info">
                                <div class="font_16 weight_500">정상근로일</div>
                                <div class=""><span class="font_20 weight_700" style="color: #7C4DFF;">${countStatusTwo}</span> 건</div>
                            </div>
                        </div>
                        <div class="attend_box_s flex" style="">
                            <div class="attend_icon m_r10" style="background-color: #E8EAF6">
                                <i class="fas fa-exclamation-circle font_16" style="color: #555"></i>
                            </div>
                            <div class="attend_info">
                                <div class="font_16 weight_500">처리필요</div>
                                <div class=""><span class="font_20 weight_700" style="color: #555">${countStatusOne}</span> 건</div>
                            </div>
                        </div>
                        <div class="attend_box_s flex" style="">
                            <div class="attend_icon m_r10" style="background-color: #FCE4EC">
                                <i class="fas fa-briefcase font_16" style="color: #FF4081"></i>
                            </div>
                            <div class="attend_info">
                                <div class="font_16 weight_500">지각일</div>
                                <div class=""><span class="font_20 weight_700" style="color: #FF4081">${countLate}</span> 건</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m_t20 attend_box">
                <div class="m_b20">
                    <h3>${sessionScope.empName} 님의 최근 출퇴근기록</h3>
                </div>
                <div class="">
                    <table class="attend_list center">
                        <thead>
                            <tr style="background-color: #Eee;">
                            	<th class="td_5">번호</th>
                                <th class="td_15">일자</th>
                                <th class="td_10">출근시간</th>
                                <th class="td_10">퇴근시간</th>
                                <th class="td_10">소정근무시간</th>
                                <th class="td_10">초과근무시간</th>
                                <th class="td_10">총근무시간</th>
                                <th class="td_10">지각여부</th>
                                <th class="td_10">외근여부</th>
                                <th class="td_10">상태</th>
                            </tr>
                        </thead>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="9">등록된 출퇴근 기록이 없습니다.</td>
                            </tr>
                        </c:if>
                        <tbody>
                        	<c:forEach items="${list}" var="list" varStatus="status">
                            <tr>
                            	<td>
                            		${(count - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}
                            	</td>
                                <td>${list.attendWorkdate}</td>
                                <td><fmt:setTimeZone value="Europe/London" scope="session"/>
		                        	<fmt:formatDate pattern="HH:mm" value="${list.attendStarttime}" />
		                        </td>
                                <td>
                                	<fmt:formatDate pattern="HH:mm" value="${list.attendEndtime}" />
                               	</td>
                                <td>${list.attendDefaulttime} 분</td>
                                <td>${list.attendOvertime} 분</td>
                                <td>${list.attendTotaltime} 분</td>
                                <td>
                                	<c:if test="${list.attendLate eq 'Y'}"><i class="fas fa-check"></i></c:if>
                                	<c:if test="${list.attendLate eq 'N'}"> - </c:if>
                                	</td>
                                <td>
                                    <select class="input_box" style="width: 100px" disabled>
                                        <option value="Y" <c:if test="${list.attendWorkplace eq 'Y'}"> selected </c:if>> - </option>
                                        <option value="N" <c:if test="${list.attendWorkplace eq 'N'}"> selected </c:if>> 외근/출장 </option>
                                    </select>
                                </td>
                                <td>
                                    <select class="input_box" style="width: 100px" disabled>
                                        <option value="1" <c:if test="${list.attendStatus eq 1}"> selected </c:if>>처리필요</option>
                                        <option value="2" <c:if test="${list.attendStatus eq 2}"> selected </c:if>>정상출근</option>
                                        <option value="3 <c:if test="${list.attendStatus eq 3}"> selected </c:if>">휴가</option>
                                        <option value="4" <c:if test="${list.attendStatus eq 4}"> selected </c:if>>결근</option>
                                    </select>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="m_t10 center">
                        <%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
                    </div>
                </div>
            </div>
        </div>
</body>
<script>
	var curHref = "/erp/user/attend_list?empIdFk=" + ${sessionScope.empId};
	function fn_paging(curPage){
		var searchTXT = "&searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	}
</script>
<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>