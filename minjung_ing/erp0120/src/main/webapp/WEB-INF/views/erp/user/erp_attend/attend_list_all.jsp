<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
<!-- 읽기 권한 처리 -->
<c:if test="${sessionScope.empDepartment ne '100' && sessionScope.empAuth ne 10}">
	<script>
		alert("인사과 외의 사용자는 접근할 수 없는 페이지입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/attend_list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">

<body>
    <!-- 모달 시작-->
	<div class="modal_wrapper">
        <div class="modal flex space_between flex_wrap" style="align-content: flex-start;">
            <div>
                <h3 class="font_18">출퇴근 기록 변경</h3>
            </div>
            <a href="" class="popup font_20">
                <i class="fas fa-window-close"> 창닫기</i>
            </a>
            <div class="m_t20 w_100 flex" style="flex-wrap: nowrap; overflow-y: auto;">
            	<div class="font_14 m_b10 w_100 p_10" style="background-color: #f9f9f9;">
            		<strong>사원정보는 수정불가</strong>하며 <strong>근무일자, 출근시간, 퇴근시간</strong>은 변경하실 수 있습니다.<br/>
            		초과근무시간과 총근무시간은 별도의 입력없이 자동으로 계산됩니다.
            		<p><strong>지각여부, 외근여부, 상태</strong>는 <strong>별도처리</strong>하여야 합니다.</p>
                </div>
            </div>
            <div class="w_100 center">
            	<form id="frm">
		            <table class="list center" id="modal_list">
	                    <!-- modal_table 들어갈자리 -->
		            </table>
		            <button type="button" onclick="setRecordOne();" class="btn_blue m_t10">저장</button>
		            <button type="reset" class="btn_ivory m_t10">취소</button>
	            </form>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->
    <div class="page_wrap bg_white noto font_14">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">근태관리<i class="fas fa-chevron-right p_lr10"></i>2. 출퇴근현황</h2>
            </div>
        </div>

        <div class="main_right_info" style="padding: 30px 20px;">
        	<div class="table_wrap_box">
	        <div class="list_title">
	            <div class="list_comment font_14 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
					<p>출근·퇴근이 모두 입력되었을 때 : <strong>정상출근</strong></p>
					<p>담당자의 별도의 처리가 필요한 경우 <strong>처리필요</strong> 로 표시됩니다.</p>
				</div>
         	</div>
         	<div class="m_b10 flex space_between" style="align-items:flex-end;">
         		<div>
        			<button type="button" class="rad_btn_blue" onclick="deleteRecords();">선택삭제</button>
         		</div>
            	<div class="search_wrap">
	                <div class="flex space_between">
	                	<div class="total_cnt_btn_grp flex m_r5">
		            		<a href="${pageContext.request.contextPath}/user/attend_list_all">
			                	<button class="total_list_btn m_r5">전체목록</button>
		            		</a>
		                	<div class="search_cnt_btn_grp flex">
		                		<button type="button" class="left_radius_btn white">검색된 출퇴근기록</button>
	                			<button class="right_radius_btn">${count}개</button>
		                	</div>
		                </div>
		                <form id="frm" method="POST" action="${pageContext.request.contextPath}/user/attend_list_all" >
			                <div class="search_grp flex">
			                	<select class="search_sel_box" style="height:30px;" id="searchOpt" name="searchOpt" onchange="changeInputBox(this.value);">
			                    	<option value="emp_name" <c:if test="${searchOpt eq 'emp_name'}"> selected </c:if>>사원명</option>
			                    	<option value="attend_workdate" <c:if test="${searchOpt eq 'attend_workdate'}"> selected </c:if>>기간</option>
			                    	<option value="attend_late" <c:if test="${searchOpt eq 'attend_late'}"> selected </c:if>>지각</option>
			                    	<option value="attend_status" <c:if test="${searchOpt eq 'attend_status'}"> selected </c:if>>상태</option>
			                    	<option value="all" <c:if test="${searchOpt eq 'all'}"> selected </c:if>>전체검색</option>
			                	</select>
			                	
			                	<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words" value=""/>
			                	<!-- searchOpt.after(a); 들어가는 자리 -->
			                	
			                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
		                </form>
	                </div>
                </div>
            </div>
            <div class="m_b30">
                <table class="user_table_list">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" onClick="chkAll();" id="chkAll" />
                            </th>
                            <th>번호</th>
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
	              	<c:forEach items="${list}" var="list" varStatus="status">
	               		<tr>
	               			<td>
	                           <input type="checkbox" name="chk" class="chk" data-uid="${list.attendId}"/>
	                       	</td>
	                       	<td>
	                       	${(count - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)} 
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
	                       		<select class="sel_100" onchange="changeLate(this.value,${list.attendId},'${list.empName}','${list.attendWorkdate}');">
	                               <option value="Y" <c:if test="${list.attendLate eq 'Y'}"> selected </c:if>>지각</option>
	                               <option value="N" <c:if test="${list.attendLate eq 'N'}"> selected </c:if>>정상</option>
	                           	</select>
	                       	</td>
	                       	<td>
	                       		<select class="sel_100" onchange="changeWorkplace(this.value,${list.attendId},'${list.empName}','${list.attendWorkdate}');">
	                               <option value="Y" <c:if test="${list.attendWorkplace eq 'Y'}"> selected </c:if>>내근</option>
	                               <option value="N" <c:if test="${list.attendWorkplace eq 'N'}"> selected </c:if>>외근</option>
	                           	</select>
	                       	</td>
	                       	<td>
	                           	<select class="sel_100" onchange="changeStatus(this.value,${list.attendId},'${list.empName}','${list.attendWorkdate}');">
	                               <option value="1" <c:if test="${list.attendStatus eq 1}"> selected </c:if>>처리필요</option>
	                               <option value="2" <c:if test="${list.attendStatus eq 2}"> selected </c:if>>정상출근</option>
	                               <option value="3" <c:if test="${list.attendStatus eq 3}"> selected </c:if>>휴가</option>
	                               <option value="4" <c:if test="${list.attendStatus eq 4}"> selected </c:if>>결근</option>
	                           	</select>
	                       	</td>
	                       	<td>
                           		<button type="button" class="popup s_btn_blue" onclick="getRecordOne(${list.attendId});">수정</button>
	                       	</td>
          				</tr>
	              </c:forEach>
              </tbody>
              <c:if test="${empty list}">
             	<tfoot>
	               <tr>
	                   <td class="weight_700" colspan="14" style="height: 100px">등록된 출퇴근 기록이 없습니다.</td>
	               </tr>
            	</tfoot>
           	</c:if>
          </table>
   		</div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
    </div>
    </div>
    <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/attend_list_all.js"></script>
<script>
	var curHref = "/erp/user/attend_list_all";
	function fn_paging(curPage){
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	}
</script>