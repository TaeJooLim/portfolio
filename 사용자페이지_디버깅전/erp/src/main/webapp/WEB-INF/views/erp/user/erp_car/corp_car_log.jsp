<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">법인차량관리<i class="fas fa-chevron-right p_lr10"></i>2. 법인차량운행일지</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <form method="post" id="frm" name="frm" action="${pageContext.request.contextPath}/user/corp_car_log_update">
            <input type="hidden"  name="carID" id ="carID" value="${carID}"/>
                <div class="input_list">
                    <table>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">차종</td>
                            <td class="p_lr3">
                                <input type="text" name="carModel" id="carModel" value="${carModel}" class="input_100 bg_blue_3" readonly required/>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">차량번호</td>
                            <td class="p_lr3">
                                <input type="text" name="carNum" id="carNum" value="${carNum}" class="input_100 bg_blue_3" readonly required/>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">운행일자</td>
                            <td class="p_lr3">
                                <input type="date" name="carDriveDate" id="carDriveDate" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">운전자</td>
                            <td class="p_lr3">
                                <input type="text" name="carDriver" maxlength="20" id="carDriver" class="input_100" value="${sessionScope.empName}" required />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">동승자</td>
                            <td class="p_lr3">
                                <input type="text" name="carPassenger" maxlength="20" id="carPassenger" class="input_100" />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">행선지</td>
                            <td class="p_lr3">
                                <input type="text" name="carDestination" maxlength="20" id="carDestination" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">운행목적</td>
                            <td class="p_lr3">
                                <input type="text" name="carPurpose" maxlength="20" id="carPurpose" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">키 반납확인</td>
                            <td class="p_lr3">
                                <select class="sel_100" name="carKey" id="carKey">
                                    <option value="N"<c:if test="car_key=='N'">selected</c:if>>미반납</option>
                                    <option value="Y"<c:if test="car_key =='Y'">selected</c:if>>반납확인</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">출발시간</td>
                            <td class="p_lr3">
                                <input type="time" name="carDriveStart" id="carDriveStart" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">도착시간</td>
                            <td class="p_lr3">
                                <input type="time" name="carDriveEnd" id="carDriveEnd" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">주행거리<br/>(출발전)</td>
                            <td class="p_lr3">
                                <span class="" style="position: relative">
                                    <input type="text" name="carStartKm" maxlength="20" id="carStartKm" class="input_100 bg_blue_3" value="${carTotalMileage}" required style="display: inline-block;" readonly />
                                    <span style="color: #000; font-size: 12px; position: absolute; line-height: 35px; right:10px;">km</span>
                                </span>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">주행거리<br/>(도착후)</td>
                            <td class="p_lr3">
                                <span class="" style="position: relative">
                                    <input type="text" name="carEndKm" maxlength="20" id="carEndKm" class="input_100" required style="display: inline-block;" />
                                    <span style="color: #ccc; font-size: 12px; position: absolute; line-height: 35px; right:10px;">km</span>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">주유 및 정비사항</td>
                            <td class="p_lr3">
                                <input type="text" name="carFuel" id="carFuel" class="input_100" />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">주유금액</td>
                            <td class="p_lr3">
                                <input type="text" name="carFuelAmount" id="carFuelAmount" class="input_100" value=0 />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">비고</td>
                            <td class="p_lr3" colspan="3">
                                <input type="text" name="carRemark" id="carRemark" class="input_100" />
                            </td>
                        </tr>
                    </table>
                    <div class=pid_area></div>
	                    <div class="btn-grp center m_t10">
	                    	<button type="button" id="carUsechangebtn" name="carUsechangebtn" class="btn_blue">일지수정</button>
	                        <button type="button" id="carRegUseBtn" class="btn_blue" onClick="setCarUse('${carID}')">일지등록</button>
	                        <button type="reset" id="cancel" class="btn_red">취소</button>	                    
		                	<button type="button" id="back" onClick="location.href='${pageContext.request.contextPath}/user/corp_car_log?carID=${carID}'" class="btn_red">수정취소</button>
			   		 	</div>
			   		 	</div>
			   	</form> 
                

            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="w_100 white_s_no">
                    <div class="table_title m_tb5">
                     &nbsp;<i class="fas fa-edit"></i>
                        법인차량운행일지
                    </div>
                    <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                 <strong>차량 번호</strong>를 선택하시면 해당 차량의 일지를 작성할 수 있습니다.
            	 </div>
                    <div class="m_b5 flex space_between">
	                        <div class="btn_wrap float_l m_b5" style="position: relative;">
	                            <button class="btn_red " id="deleteAll">선택삭제</button>
	                            <button class="btn_blue m_r3"  onClick="location.href='${pageContext.request.contextPath}/user/corp_car_log?carID=0'">전체일지</button>
	                            <button class="btn_write" style="position: absolute; height: 35.49px;" onClick="location.href='${pageContext.request.contextPath}/user/corp_car_management'">차량목록</button>	                            
	                        </div>
	                        <form method="post" action="${pageContext.request.contextPath}/user/corp_car_log">
		                        <div class="search_grp flex float_r m_b5">
		                        	<input type="hidden" name="carID" value="${carID}" />
				                        <select class="search_sel_box" name="searchOpt" style="height: 25px;">
				                            <option value="car_model" <c:if test="${searchOpt eq 'car_model'}">selected</c:if>>차종</option>
				                            <option value="car_num" <c:if test="${searchOpt eq 'car_num'}">selected</c:if>>차량번호</option>
				                            <option value="car_drive_date" <c:if test="${searchOpt eq 'car_drive_date'}">selected</c:if>>운행일자</option>
				                            <option value="car_destination" <c:if test="${searchOpt eq 'car_destination'}">selected</c:if>>행선지</option>
				                        	<option value="car_driver" <c:if test="${searchOpt eq 'car_driver'}">selected</c:if>>운전자</option>       
				                        </select>
				                    	<input value="${words}" type="text" class="m_lr5" name="words" required style="height: 25px;" />		                            
				                	<button type="submit" class="s_btn_gray" style="margin-left:-2px;">검색</button>                         
		                        </div>
                        </form>
                    </div>
                    <div class="w_100 white_s_no">
                        <table class="list clearfix m_b10">
                            <thead>
                                <tr>
                                    <th rowspan="2">
                                        <input type="checkbox" onClick="chkAll();" id="chkAll" />
                                    </th>
                                    <th rowspan="2">번호</th>
                                    <th colspan="2">차량정보</th>
                                    <th rowspan="2">운행일자</th>
                                    <th colspan="2">운행시간</th>
                                    <th colspan="2">운행목적</th>
                                    <th colspan="2">주행거리</th>
                                    <th rowspan="2">운전자</th>
                                    <th rowspan="2">동승자</th>
                                    <th rowspan="2">키반납확인</th>
                                    <th colspan="3">기타사항</th>
                                    <th rowspan="2">관리</th>
                                </tr>
                                <tr>
                                    <th>차종</th>
                                    <th>차량번호</th>
                                    <th>출발시간</th>
                                    <th>도착시간</th>
                                    <th>행선지</th>
                                    <th>운행목적</th>
                                    <th>출발전</th>
                                    <th>도착후</th>
                                    <th>주유 및 정비사항</th>
                                    <th>주유금액</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="carUse" items="${list}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" name="chk" class="chk"  data-uid="${carUse.carPID}"/></td>
                                    <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
                                    <td>${carUse.carModel}</td>
                                    <td class="weight_700 under"><a href="${pageContext.request.contextPath}/user/corp_car_log?carID=${carUse.carIDFk}">${carUse.carNum}</a></td>
                                    <td>${carUse.carDriveDate}</td>
                                    <td>${carUse.carDriveStart}</td>
                                    <td>${carUse.carDriveEnd}</td>
                                    <td>${carUse.carDestination}</td>
                                    <td>${carUse.carPurpose}</td>
                                    <td>
                                    	<fmt:formatNumber value="${carUse.carStartKm}" pattern="#,###,###"/>
                                    </td>
                                    <td>
                                    	<fmt:formatNumber value="${carUse.carEndKm}" pattern="#,###,###"/>
                                    </td>
                                    <td>${carUse.carDriver}</td>
                                    <td>${carUse.carPassenger}</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${carUse.carKey=='N'}">
                                    			<button type="button" class="s_btn_red">미반납</button>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<button type="button" class="s_btn_blue">반납확인</button>
                                    		</c:otherwise>
                                    	</c:choose>
                                    
                                    </td>
                                    <td>${carUse.carFuel}</td>
                                    <td>
                                    	<fmt:formatNumber value="${carUse.carFuelAmount}" pattern="#,###,###"/>
                                    </td>
                                    <td>${carUse.carRemark}</td>
                                    <td>
                                        <button class="s_btn_blue" id="updateUseBtn" name="updateUseBtn" onclick="updateUseBtn('${carUse.carPID}');">수정</button>
                                    </td>
                                </tr>
                            </c:forEach>                                  
                            </tbody>
                        </table>
                         <%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
        </div>
   	</div>  
</body>
<script>
	var curHref = "/erp/user/corp_car_log";
	function fn_paging(curPage) {
		var searchTXT = "?carID=${carID}&searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>
<script>
$(document).ready(function() {
    $("#carUsechangebtn").hide();
    $("#back").hide();	    	
});


$("#carUsechangebtn").click(function(){
	carUsechangebtn();	
});

$(function() {
	$("#carFuelAmount, #carEndKm").keyup(function () {
	    //정규표현식 = 숫자만 사용가능
	    $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
	});
});

function setCarUse(carID){
	if(!$("#carDriveDate").val()){
		alert("운행일자를 입력해주세요.");
		$("#carDriveDate").focus();
		return false;
		}
	if(!$("#carDriveStart").val()){
		alert("출발시간을 입력해주세요.");
		$("#carDriveStart").focus();
		return false;
	}
	if(!$("#carDriveEnd").val()){
		alert("도착시간을 입력해주세요.");
		$("#carDriveEnd").focus();
		return false;
	}
	if(!$("#carDestination").val()){
		alert("행선지를 입력해주세요.");
		$("#carDestination").focus();
		return false;
	}
	if(!$("#carPurpose").val()){
		alert("운행목적을 입력해주세요.");
		$("#carPurpose").focus();
		return false; 
	}
	if(!$("#carEndKm").val()){
		alert("도착후 주행거리를 입력해주세요.");
		$("#carEndKm").focus();
		return false;
	}
	if(!$("#carDriver").val()){
		alert("운전자를 입력해주세요.");
		$("#carDriver").focus();
		return false;
	}

	var formData = $("#frm").serialize();
	$.ajax({
			url		: "${pageContext.request.contextPath}/admin/corp_car_log_insert",
			type	: "POST",
			data	: formData,
			success	: function(resData) {
				alert( "차량일지가 등록되었습니다.");
				window.location.reload();
			},
			error	:function() {
				alert("시스템 에러");			
			}
	});
};

function carUsechangebtn(){
	if(!$("#carDriveDate").val()){
		alert("운행일자를 입력해주세요.");
		$("#carDriveDate").focus();
		return false;
		}
	if(!$("#carDriveStart").val()){
		alert("출발시간을 입력해주세요.");
		$("#carDriveStart").focus();
		return false;
	}
	if(!$("#carDriveEnd").val()){
		alert("도착시간을 입력해주세요.");
		$("#carDriveEnd").focus();
		return false;
	}
	if(!$("#carDestination").val()){
		alert("행선지를 입력해주세요.");
		$("#carDestination").focus();
		return false;
	}
	if(!$("#carPurpose").val()){
		alert("운행목적을 입력해주세요.");
		$("#carPurpose").focus();
		return false; 
	}
	if(!$("#carEndKm").val()){
		alert("도착후 주행거리를 입력해주세요.");
		$("#carEndKm").focus();
		return false;
	}
	if(!$("#carDriver").val()){
		alert("운전자를 입력해주세요.");
		$("#carDriver").focus();
		return false;
	}
	
	var formData = $("#frm").serialize();
	
	$.ajax({
		url		: "${pageContext.request.contextPath}/admin/corp_car_log_update",
		type	: "POST",
		data	: formData,
		success	: function(resData) {
			alert( "일지가 수정되었습니다.");
			window.location.reload();
			
		},
		error	:function() {
			alert("시스템 에러");
		}
	});
}

function updateUseBtn(carPID){
	var formdata ={
		carPID : carPID
	}
		
	$("#carRegUseBtn").hide();		
    $("#cancel").hide();	
    $("#carUsechangebtn").show(); 
    $("#back").show();
	$('.pid_area').append('<input id="carPID" name="carPID" type="hidden" >');

	$.ajax({
		url 	: "${pageContext.request.contextPath}/admin/corp_car_log_updateList",
		type	: "POST",
		data	: formdata,
		success	: function(resData) {
			$('#carPID').val(resData.carPID);
			$('#carDriveDate').val(resData.carDriveDate);
			$('#carDestination').val(resData.carDestination);
			$('#carPurpose').val(resData.carPurpose);
			$('#carDriveStart').val(resData.carDriveStart);
			$('#carDriveEnd').val(resData.carDriveEnd);
			$('#carStartKm').val(resData.carStartKm);
			$('#carEndKm').val(resData.carEndKm);
			$('#carEndKm').attr("readonly", true);
			$('#carDriver').val(resData.carDriver);
			$('#carPassenger').val(resData.carPassenger);
			$('#carKey').val(resData.carKey);
			$('#carFuel').val(resData.carFuel);
			$('#carFuelAmount').val(resData.carFuelAmount);
			$('#carRemark').val(resData.carRemark);
			$('#carIDFk').val(resData.carIDFk);
			$('#carModel').val(resData.carModel);
			$('#carNum').val(resData.carNum);
		},
		error	: function() {
			alert("시스템 오류입니다.");
		}
	});
	
}
</script>
<script>
$("#deleteAll").click(function() {
    var str = confirm("선택하신 정보를 삭제하시겠습니까?");
    
    if( str ) {
        var chkArr = new Array();
        $(".chk:checked").each(function () {
        	chkArr.push($(this).attr("data-uid"));
        });
                
        $.ajax({
        	url 	: "${pageContext.request.contextPath}/adimn/corp_car_log_delete",
        	type 	: "POST", 	
        	data 	: { chkArr : chkArr },
        	success	: function (resData) {
        		alert("삭제되었습니다.");
	    		window.location.reload();
            },
            error 	: function() {
            	alert("선택하신 정보가 없습니다.");
            }
        });
    }
});
</script>