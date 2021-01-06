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
        padding: 0 3px;
    }

    .list tr:nth-child(2n) {
        background-color: #eff3f9;
    }

    .list td {
        border: 1px solid #d6dce7;
        padding: 0 3px;
    }
    
    /* modal css */
    .flex_wrap {
        flex-wrap: wrap;
	}
    .modal_wrapper {
        background-color: rgba(0, 0, 0, 0.3);
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        visibility: hidden;
        /* 눌렀을 때 나와야 하니깐 = visibility */
        transition: 0.3s;
    }
    .modal_wrapper.open {
        visibility: visible;
        opacity: 1;
        transition: 0.3s;
    }	
    .modal_wrapper.open .modal {
        opacity: 1;
    }	
    .modal {	
        width: 600px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        opacity: 0;
        border-radius: 5px;
        padding: 20px;
        box-shadow: -60px 0px 100px -90px #000,
            60px 0px 100px -90px #000;
    }
    /* modal css */
</style>
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
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">근태관리<i class="fas fa-chevron-right p_lr10"></i>출퇴근현황</h2>
            </div>
        </div>

        <div class="main_right_info" style="padding: 20px 20px;">
	        <div class="list_title p_tb10">
	            <div class="list_comment font_14" style="padding: 10px 20px; background-color: #f9f9f9;">
					<p>출근·퇴근이 모두 입력되었을 때 : <strong>정상출근</strong></p>
					<p>담당자의 별도의 처리가 필요한 경우 <strong>처리필요</strong> 로 표시됩니다.</p>
				</div>
         	</div>
         	<div class="m_b10 flex space_between" style="align-items:flex-end;">
         		<div>
        			<button type="button" class="btn_red" onclick="deleteRecords();">선택삭제</button>
         		</div>
            	<div class="search_wrap">
	                <div class="flex space_between">
	                	<div class="total_cnt_btn_grp flex m_r5">
		            		<a href="${pageContext.request.contextPath}/admin/attend_list">
			                	<div class="total_list_btn m_r5" style="height:30px;">전체목록</div>
		            		</a>
		                	<div class="search_cnt_btn_grp flex" style="height:30px;">
		                    	<div class="left_radius_btn white">검색된 출퇴근기록</div>
		                		<div class="right_radius_btn">${count}개</div>
		                	</div>
		                </div>
		                <div class="search_grp flex">
		                	<select class="search_sel_box" style="height:30px;" id="searchOpt" name="searchOpt" onchange="changeInputBox(this.value);">
		                    	<option value="emp_name">사원명</option>
		                    	<option value="attend_workdate">기간</option>
		                    	<option value="attend_late">지각</option>
		                    	<option value="all">전체검색</option>
		                	</select>
		                	
		                	<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words"/>
		                	<!-- searchOpt.after(a); 들어가는 자리 -->
		                	
		                    <button type="type" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
		                </div>
	                </div>
                </div>
            </div>
	              <div class="w_100 white_s_no overflow_x_auto m_b10">
	                  <table class="list center">
	                      <thead>
	                          <tr>
	                              <th>
	                                  <input type="checkbox" onClick="chkAll();" id="chkAll" />
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
		               			<td class="weight_700" colspan="13">등록된 출퇴근 기록이 없습니다.</td>
		               		<tr>
		               	</c:if>
	                <c:forEach items="${list}" var="list" varStatus="status">
		                <tr>
		                	<td>
		                            <input type="checkbox" name="chk" class="chk" data-uid="${list.attendId}"/>
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
	            </table>
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
	//체크박스 함수
	var flag = false;
	
	function chkAll() {
	
	    var chk = document.getElementsByName("chk");
	    if (flag == false) { //선택 x
	        flag = true;
	
	        for (var i = 0; i < chk.length; i++) {
	            chk[i].checked = true;
	        }
	
	    } else {
	        flag = false;
	        for (var i = 0; i < chk.length; i++) {
	            chk[i].checked = false;
	        }
	    }
	}
	
    function changeLate(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 지각여부를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/change_late",
				type	: "POST",
				data	: {
					attendId	: aid,
					attendLate	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("지각여부 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
    }
    
	function changeWorkplace(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 내외근여부를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/change_workplace",
				type	: "POST",
				data	: {
					attendId		: aid,
					attendWorkplace	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("내외근여부 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
	}
	
	function changeStatus(thisValue,aid,empName,attendWorkdate){
		
        var msg = "("+ attendWorkdate +") "+empName+"의 상태를 변경하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/change_status",
				type	: "POST",
				data	: {
					attendId		: aid,
					attendStatus	: thisValue
				},
				success	: function(resData){
					window.location.reload();
				},
				error	: function(){
					alert("상태 변경 ajax 에러");
				}
			});
		}
		window.location.reload();
    }

    function changeInputBox(thisValue){

    	var a = '';

    	// 사원별 검색
		if( thisValue == 'emp_name'){
			$("#words").remove();
			
			a += '<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words"/>';
			$("#searchOpt").after(a);
		}

    	// 근무월별 검색
		if( thisValue == 'attend_workdate' ){
			$("#words").remove();
			
			a += '<input type="month" class="m_lr5" style="width:160px; height:30px;" name="words" id="words" />';
			$("#searchOpt").after(a);
		}

    	// 지각유무별 검색
		if( thisValue == 'attend_late' ){
			$("#words").remove();
			
			a += '<select class="search_sel_box m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words">';
	        	a += '<option value="Y">지각</option>';
	        	a += '<option value="N">정상</option>';
	    	a += '</select>';
	    	$("#searchOpt").after(a);
		}

    	// 전체 검색
		if( thisValue == 'all' ){
			$("#words").remove();
			
			a += '<input type="text" class="m_lr5 p_l5" style="width:160px; height:30px;" name="words" id="words" />';
			$("#searchOpt").after(a);
		}
    	
    }

 	// 선택삭제
    function deleteRecords(aid){
    	var msg = "선택하신 기록을 삭제하시겠습니까?";

    	if(confirm(msg)){
			var chkArr = new Array();
			$(".chk:checked").each(function(){
				chkArr.push($(this).attr("data-uid"));
			});

			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/delete_records",
				type	: "POST",
				data	: {
					chkArr	:	chkArr
				},
				success	: function(resData){
					alert("삭제되었습니다.");
					window.location.reload();
				},
				error	: function(){
					alert("선택하신 근태기록이 없습니다.");
				}
				
			});
       	}else{
			window.location.reload();
      	}
    }

    function getRecordOne(attendId){
  		
		$.ajax({
			url		: "${pageContext.request.contextPath}/admin/get_record_one",
			type	: "POST",
			data	: {
				attendId	: attendId
			},
			success	: function(resData){
				var a = '';
				a += '<tr>';
	            	a += '<th>부서</th>';
	            	a += '<th colspan="2">사원명</th>';
	            a += '</tr>';
	            a += '<tr style="background-color:#fff;">';
			  		a += '<td>'+ resData.departName +'</td>';
	         		a += '<td colspan="2">'+ resData.empName +'</td>';
	            a += '</tr>';
	            a +='<tr>';
	            	a += '<th>근무일자</th>';
	            	a += '<th>출근시간</th>';
	            	a += '<th>퇴근시간</th>';
            	a += '</tr>';
	            a += '<tr style="background-color:#fff;">';
	            	a += '<td>';
	            		a += '<input type="date" name="attendWorkdate" value="'+ resData.attendWorkdate +'"/>';
	            	a += '</td>';
	            	a += '<td>';
	            		a += '<input type="time" name="attendStarttime" value="'+ resData.attendStarttime +'"/>';
	            	a += '</td>';
	            	a += '<td>';
	            		a += '<input type="time" name="attendEndtime" value="'+ resData.attendEndtime +'"/>';
	            		a += '<input type="hidden" name="attendId" value="'+ resData.attendId +'"/>';
	            	a += '</td>';
	            a += '</tr>';

	            $("#modal_list").append(a);
			},
			error	: function(){
				alert("해당 사원의 근태기록을 찾을 수 없습니다.\n관리자에게 문의하세요.");
				window.location.reload();
			}
			
		});

		// 모달창 오픈
        $(".modal_wrapper").toggleClass("open");
		
   	}

   	function setRecordOne(){

		var formData = $("#frm").serialize();

		$.ajax({
			url		: "${pageContext.request.contextPath}/admin/set_record_one",
			type	: "POST",
			data	: formData,
			success	: function(resData){
				alert("성공");
			},
			error	: function(){
				alert("출퇴근기록 변경에 실패하였습니다.\n관리자에게 문의하세요.");
				return false;
			}

		});

		window.location.reload();
  	}
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>