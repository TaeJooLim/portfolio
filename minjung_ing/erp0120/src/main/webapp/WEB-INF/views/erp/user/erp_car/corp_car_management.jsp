<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
<!-- 읽기 권한 처리 -->
<c:if test="${sessionScope.empAuth ne 10 && sessionScope.empDepartment ne '400'}">
	<script>
		alert("총무과 외의 사용자는 접근할 수 없는 페이지입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
<body>
    <div class="page_wrap bg_white noto font_14">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">법인차량관리<i class="fas fa-chevron-right p_lr10"></i>1. 법인차량관리</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
        	<div class="table_wrap_box">
            <form id="carReg" name="carReg" method="POST" action="${pageContext.request.contextPath}/user/corp_car_management_insert">
                <div class="input_list w_100 white_s_no">
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
	                        	<button type="reset" id="cancel" class="btn_ivory">취소</button>
	                        	<button type="button" id="back" onClick="window.location.reload();" class="btn_red">수정취소</button>
                    </div>
                </div>
            </form>
            <div class="">
                <div class="w_100 white_s_no m_b30">
                    <div class="table_title m_t10">
                    	<i class="fas fa-edit"></i> 법인차량목록
                    </div>
                    <div class="m_b10 flex space_between" style="align-items:flex-end;">
                        <div class="btn_wrap">
                            <button class="rad_btn_blue" id="deleteAll">선택삭제</button>
                        </div>
                        <form method="post" action="${pageContext.request.contextPath}/user/corp_car_management">
                        	<div class="search_grp flex m_t10">
			                	<select class="search_sel_box" name="searchOpt">
				              		<option value="car_model" <c:if test="${searchOpt eq 'car_model'}">selected</c:if>>차종</option>
				                	<option value="car_num" <c:if test="${searchOpt eq 'car_num'}">selected</c:if>>차량번호</option>
				           		</select>
			                	<input type="text" class="m_lr5 p_l5" name="words" value="${words}" required />
			                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
                        </form>
                    </div>
                    <table class="user_table_list">
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
                        	<c:forEach var="car" items="${list}" varStatus="status">
	                            <tr>
	                                <td><input type="checkbox" name="chk" class="chk"  data-uid="${car.carID}"/></td>
	                                <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
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
	                                    <button class="s_btn_blue" onClick="location.href='${pageContext.request.contextPath}/user/corp_car_log?carID=${car.carID}'">일지작성</button>
	                                    <button class="s_btn_red" type=button id="updateBtn" onclick="updateBtn('${car.carID}');">수정</button>
	                                </td>
	                            </tr>
	                         </c:forEach>   
                        </tbody>
                        <c:if test="${empty list}">
                        	<tfoot>
				               <tr>
				                   <td class="weight_700" colspan="15" style="height: 100px">등록된 정보가 없습니다.</td>
				               </tr>
			            	</tfoot>
                   		</c:if>
                    </table>
                </div>
                <%@ include file="/WEB-INF/views/erp/user/include/USER_PAGING.jsp" %>
            </div>
        </div>
    </div>
	<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
</body>
<script>
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
	
	var curHref = "/erp/user/corp_car_management";
	function fn_paging(curPage) {
		var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
		window.location.href = curHref + searchTXT + curPage;
	};
</script>
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
