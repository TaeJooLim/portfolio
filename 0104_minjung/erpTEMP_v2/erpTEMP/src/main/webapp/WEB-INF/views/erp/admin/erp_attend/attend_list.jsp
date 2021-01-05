<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<style>
    td {
        border: 1px solid #d6dce7;
    }
    .list th {
        border: 1px solid #60718b;
        background-color: #6f809a;
        color: #fff;
        padding: 8px 5px;
    }

    .list tr:nth-child(2n) {
        background-color: #eff3f9;
    }

    .list td {
        border: 1px solid #d6dce7;
        padding: 8px 5px;
    }
</style>
<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">근태관리<i class="fas fa-chevron-right p_lr10"></i>출퇴근현황</h2>
            </div>
        </div>

        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="list_comment font_14" style="padding: 10px 20px; background-color: #f9f9f9;">
				출퇴근 모두 입력이 되면 <strong>정상출근</strong>, 담당자의 휴가 및 결근 처리가 필요한 경우 <strong>처리필요</strong> 로 표시됩니다.
			</div>

            <div class="m_tb20" style="border-top: 1px solid #000;">
                <div class="">
                    <div class="list_title center p_tb10">
                        <h2>출퇴근현황</h2>
                    </div>
                    <div class="w_100 white_s_no overflow_x_auto">
                        <table class="list center">
                            <thead>
                                <tr>
                                	<th>test</th>
                                    <th>
                                        <input type="checkbox" />
                                    </th>
                                    <th>일자</th>
                                    <th>부서</th>
                                    <th>사원명</th>
                                    <th>출근시간</th>
                                    <th>퇴근시간</th>
                                    <th>소정근무시간</th>
                                    <th>초과근무시간</th>
                                    <th>총근무시간</th>
                                    <th>지각여부</th>
                                    <th>외근여부</th>
                                    <th>상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${count == 0}">
                           		<tr>
                           			<td class="weight_700" colspan="10">등록된 출퇴근 기록이 없습니다.</td>
                           		<tr>
                           	</c:if>
                            <c:forEach items="${list}" var="list" varStatus="status">
                                <tr>
                                	<td>${list.attendId}</td>
                                    <td>
                                        <input type="checkbox" />
                                    </td>
                                    <td>${list.attendWorkdate}</td>
                                    <td>${list.departName}</td>
                                    <td>${list.empName}</td>
                                    <td>
                                    	<fmt:setTimeZone value="Europe/London" scope="session"/>
                                    	<fmt:formatDate pattern="HH:mm" value="${list.attendStarttime}" />
                                    </td>
                                    <td>
                                    	<fmt:formatDate pattern="HH:mm" value="${list.attendEndtime}" />
                                    </td>
                                    <td>${list.attendDefaulttime} 분</td>
                                    <td>${list.attendOvertime} 분</td>
                                    <td>${list.attendTotaltime} 분</td>
                                    <td>
                                    	<select class="s_sel_100" onchange="changeLate(this.value,${list.attendId},'${list.empName}','${list.attendWorkdate}');">
                                            <option value="Y" <c:if test="${list.attendLate eq 'Y'}"> selected </c:if>>지각</option>
                                            <option value="N" <c:if test="${list.attendLate eq 'N'}"> selected </c:if>>정상</option>
                                        </select>
                                    </td>
                                    <td>
                                    	<select class="s_sel_100">
                                            <option value="Y" <c:if test="${list.attendWorkplace eq 'Y'}"> selected </c:if>>내근</option>
                                            <option value="N" <c:if test="${list.attendWorkplace eq 'N'}"> selected </c:if>>외근</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="s_sel_100">
                                            <option value="1" <c:if test="${list.attendStatus eq 1}"> selected </c:if>>처리필요</option>
                                            <option value="2" <c:if test="${list.attendStatus eq 2}"> selected </c:if>>정상출근</option>
                                            <option value="3" <c:if test="${list.attendStatus eq 3}"> selected </c:if>>휴가</option>
                                            <option value="4" <c:if test="${list.attendStatus eq 4}"> selected </c:if>>결근</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="s_btn_blue">수정</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="page_grp center">
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
<script src="${pageContext.request.contextPath}/js/admin_main.js"></script>
<script>
    function changeLate(lateValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 지각여부를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/change_late",
				type	: "POST",
				data	: {
					attendId	: aid,
					attendLate	: lateValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("지각여부 변경 ajax 에러");
				}
			});
		}
		
		return false;
    }
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>