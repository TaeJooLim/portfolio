<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">법인차량관리<i class="fas fa-chevron-right p_lr10"></i>1. 법인차량관리</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <form id="carReg" name="carReg" method="POST" action="${pageContext.request.contextPath}/admin/corp_car_management_insert">
                <div class="input_list w_100 white_s_no overflow_x_auto">
                    <table>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">차종</td>
                            <td class="p_lr3">
                                <input type="text" name="carModel" maxlength="20" id="carModel" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">차량명</td>
                            <td class="p_lr3">
                                <input type="text" name="carName" maxlength="20" id="carName" class="input_100" required/>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">차량번호</td>
                            <td class="p_lr3">
                                <input type="text" name="carNum" maxlength="20" id="carNum" class="input_100"  required/>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">총 주행거리</td>
                            <td class="p_lr3">
                                <span class="" style="position: relative">
                                    <input type="text" name="carTotalMileage" maxlength="20" id="carTotalMileage" class="input_100"  style="display: inline-block;" required/>
                                    <span style="color: #ccc; font-size: 12px; position: absolute; line-height: 35px; right:10px;">km</span>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">구입일자</td>
                            <td class="p_lr3">
                                <input type="date" name="carPurchaseDate" maxlength="20" id="carPurchaseDate" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">구입가</td>
                            <td class="p_lr3">
                                <input type="text" name="carPurchasePrice" maxlength="20" id="carPurchasePrice" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">사용년수</td>
                            <td class="p_lr3">
                                <input type="text" class="input_100" id="carUseYear" name="carUseYear" maxlength="2" value="" />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">잔존가액</td>
                            <td class="p_lr3">
                                <input type="text" name="carScrapValue" maxlength="20" id="carScrapValue" class="input_100"  />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">보험계약일</td>
                            <td class="p_lr3">
                                <input type="date" name="carInsuranceStart" maxlength="20" id="carInsuranceStart" class="input_100"  />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">보험종료일</td>
                            <td class="p_lr3">
                                <input type="date" name="carInsuranceEnd" maxlength="20" id="carInsuranceEnd" class="input_100"  />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">종합보험여부</td>
                            <td class="p_lr3">
                                <select class="sel_100" name="carComprehensive" id="carComprehensive">
                                    <option value="N">N</option>
                                    <option value="Y">Y</option>
                                </select>
                            </td>
                            <td class="bg_gray weight_700 td_10 center">최근검사일</td>
                            <td class="p_lr3">
                                <input type="date" name="carInspection" maxlength="20" id="carInspection" class="input_100"  />
                            </td>
                        </tr>
                    </table>
                    <div class="cid_area"></div>
                    <div class="btn-grp center m_t10">
                    			<button type="button" id="carchangebtn" name="carchangebtn" class="btn_blue">차량수정</button>
	                        	<button type="submit" id="carRegBtn" class="btn_blue">차량등록</button>
	                        	<button type="reset" id="cancel" class="btn_red">취소</button>
	                        	<button type="button" id="back" onClick="window.location.reload();" class="btn_red">수정취소</button>
                    </div>
                </div>
            </form>

            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="" style="width: 100%; white-space: nowrap; overflow-x: scroll;">
                    <div class="table_title m_tb5">
                      &nbsp;<i class="fas fa-edit"></i>
                        법인차량목록
                    </div>
                    <div class="m_b5 flex space_between">
                        <div class="btn_wrap m_b5">
                            <button class="btn_red" id="deleteAll">선택삭제</button>
                        </div>
                        <form method="post" action="${pageContext.request.contextPath}/admin/corp_car_management">
                        <div class="search_grp flex float_r m_b5">
	                            <select class="search_sel_box" name="searchOpt" style="height: 25px;">
	                                <option value="car_model" <c:if test="${searchOpt eq 'car_model'}">selected</c:if>>차종</option>
	                                <option value="car_num" <c:if test="${searchOpt eq 'car_num'}">selected</c:if>>차량번호</option>
	                            </select>
	                            <input value="${words}" type="text" class="m_lr5"  name="words" required style="height: 25px;"/>
	                            <button type="submit" class="s_btn_gray" style="margin-left:-2px">검색</button>                       		
                        </div>
                        </form>
                    </div>
                    <table class="list">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" onClick="chkAll();" id="chkAll" />
                                </th>
                                <th>번호</th>
                                <th>차종</th>
                                <th>차량명</th>
                                <th>차량번호</th>
                                <th>총주행거리</th>
                                <th>구입일자</th>
                                <th>구입가</th>
                                <th>사용년수</th>
                                <th>잔존가액</th>
                                <th>보험계약일</th>
                                <th>보험종료일</th>
                                <th>종합보험여부</th>
                                <th>최근검사일</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="car" items="${list}">
	                            <tr>
	                                <td><input type="checkbox" name="chk" class="chk"  data-uid="${car.carID}"/></td>
	                                <td>${car.carID}</td>
	                                <td>${car.carModel}</td>
	                                <td>${car.carName}</td>
	                                <td>${car.carNum}</td>
	                                <td>
	                                	<fmt:formatNumber value="${car.carTotalMileage}" pattern="#,###,###"/>
	                                </td>
	                                <td>${car.carPurchaseDate}</td>
	                                <td>
	                                	<fmt:formatNumber value="${car.carPurchasePrice}" pattern="#,###,###"/>
	                                </td>
	                                <td>${car.carUseYear}</td>
	                                <td>
	                                	<fmt:formatNumber value="${car.carScrapValue}" pattern="#,###,###"/>
	                                </td>
	                                <td>${car.carInsuranceStart}</td>
	                                <td>${car.carInsuranceEnd}</td>
	                                <td>${car.carComprehensive}</td>
	                                <td>${car.carInspection}</td>                   
	                                <td>
	                                    <button class="s_btn_blue" 
	                                     onClick="location.href='${pageContext.request.contextPath}/admin/corp_car_log?carID=${car.carID}'">일지작성</button>
	                                    <button class="s_btn_red" type=button id="updateBtn" onclick="updateBtn('${car.carID}');">수정</button>
	                                </td>
	                            </tr>
	                         </c:forEach>   
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script>

$(document).ready(function() {
    $("#carchangebtn").hide();
    $("#back").hide();   
});

$(function() {
	$("#carTotalMileage, #carPurchasePrice, #carUseYear, #carScrapValue").keyup(function () {
	    //정규표현식 = 숫자만 사용가능
	    $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
	});
});

function updateBtn(carID){
	var formdata = {
			carID : carID
	}
	
	$("#carchangebtn").show(); 
    $("#back").show(); 
    $("#carRegBtn").hide();		
    $("#cancel").hide();
	$('.cid_area').append('<input id="carID" name="carID" type="hidden" >');
	$.ajax({
		url 	: "${pageContext.request.contextPath}/admin/corp_car_management_updateList",
		type	: "POST",
		data	: formdata,
		success	: function(resData) {
			$("#carID").val(resData.carID);
			$("#carModel").val(resData.carModel);
			$("#carName").val(resData.carName);
			$("#carNum").val(resData.carNum);
			$("#carPurchaseDate").val(resData.carPurchaseDate);
			$("#carPurchasePrice").val(resData.carPurchasePrice);
			$("#carUseYear").val(resData.carUseYear);
			$("#carScrapValue").val(resData.carScrapValue);
			$("#carInsuranceStart").val(resData.carInsuranceStart);
			$("#carInsuranceEnd").val(resData.carInsuranceEnd);
			$("#carComprehensive").val(resData.carComprehensive);
			$("#carInspection").val(resData.carInspection);
			$("#carTotalMileage").val(resData.carTotalMileage);
		},
		error	: function() {
			alert("시스템 오류입니다.");
		}
	});
}

function carchangebtn(){
	var formData = $("#carReg").serialize();
	$.ajax({
		url		: "${pageContext.request.contextPath}/admin/corp_car_management_update",
		type	: "POST",
		data	: formData,
		success	: function(resData) {
			alert( "차량정보가 수정되었습니다.");
			window.location.reload();		
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
}


$("#carchangebtn").click(function(){
	carchangebtn();
});

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
        	url 	: "${pageContext.request.contextPath}/admin/corp_car_management_delete",
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
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>