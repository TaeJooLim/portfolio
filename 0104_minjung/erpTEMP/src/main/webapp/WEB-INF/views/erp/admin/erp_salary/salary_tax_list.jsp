<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
</head>
<style>
	.salary_input {
        border: 1px solid transparent;
        background-color:transparent;
        text-align:center;
	    padding: 10px;
	    margin: 0px;
	    box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    -webkit-box-sizing: border-box;
    }
</style>
<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">인사/급여관리<i class="fas fa-chevron-right p_lr10"></i>2. 세금계산테이블수정</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="right_top">
                        <div class="employee_count_btn_grp flex">
                            <div class="font_14 left_radius_btn white">기준년도</div>
                            <div class="font_14 right_radius_btn">2020년</div>
                        </div>
                        <div class="list_comment font_14 m_tb10 p_10" style="background-color: #f9f9f9;">
                            세금 계산 테이블은 <strong>매년 교체</strong>가 <strong>필요</strong>합니다.
                        </div>
                    </div>
                    <div class="list w_100 white_s_no overflow_x_auto">
                        <table>
                            <thead>
	                            <tr>
	                                <th class="td_4" rowspan="2">번호</th>
	                                <th colspan="2">금액범위</th>
	                                <th class="td_7" rowspan="2">실수령액</th>
	                                <th colspan="7">공제항목</th>
	                                <th class="td_10" rowspan="2">관리</th>
	                            </tr>
	                            <tr>
	                                <th class="td_7">시작 범위</th>
	                                <th class="td_7">끝 범위</th>
	                                <th>소계</th>
	                                <th>국민연금</th>
	                                <th>건강보험</th>
	                                <th>장기요양</th>
	                                <th>고용보험</th>
	                                <th>소득세</th>
	                                <th>지방소득세</th>
	                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="list" varStatus="status">
                                <tr>
                                    <td>${list.salaryId}</td>
                                    
                                    <td>
                                    <input type="text"id="startingRange_${list.salaryId}" class="salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.startingRange}" pattern="#,###"/>" readonly /></td>
                                    
                                    <td>
                                    <input type="text" id="endRange_${list.salaryId}" class="salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.endRange}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="netPay_${list.salaryId}" class="salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.netPay}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryTotalcost_${list.salaryId}" class="salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryTotalcost}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryNps_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryNps}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryHInsurance_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryHInsurance}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryCare_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryCare}" pattern="#,###"/>" readonly /></td>
                                    
                                    <td>
                                    <input type="text" id="salaryEInsurance_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryEInsurance}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryIncome_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryIncome}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    <input type="text" id="salaryLIncome_${list.salaryId}" class="modTarget_${list.salaryId} salary_input w_100 noto font_14" 
                                    value="<fmt:formatNumber value="${list.salaryLIncome}" pattern="#,###"/>" readonly/></td>
                                    
                                    <td>
                                    	<!--	수정버튼을 누르면 : 저장+취소버튼 등장 & 수정+삭제버튼 숨김  	-->
                                    	<button type="button" id="saveBtn" onClick="saveSalaryTax(${list.salaryId});" 
                                    	class="saveBtn_${list.salaryId} s_btn_red" style="display:none;">저장</button>
                                        <button type="button" id="resetBtn" onClick="resetSalaryTax(${list.salaryId});" class="resetBtn_${list.salaryId} s_btn_gray" style="display:none;">취소</button>
                                        <button type="button" id="modBtn" onClick="modifySalaryTax(${list.salaryId});" class="modBtn_${list.salaryId} s_btn_blue">수정</button>
                                        <button type="button" id="delBtn" onClick="deleteSalaryTax(${list.salaryId},${list.salaryNps});" class="delBtn_${list.salaryId} s_btn_gray">삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody> 
                        </table>
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
    </div>
<script>
	function onlyNumbers(value, sid){
		
	}


	/*	수정버튼 클릭 이벤트 - input 스타일 수정 & 저장버튼과 취소버튼 등장 & 수정버튼과 삭제버튼 숨김 	*/
	function modifySalaryTax(sid){
		
		$(".modTarget_"+sid+"").prop('readonly', false);
		$(".modTarget_"+sid+"").removeClass('salary_input');
		$(".modTarget_"+sid+"").css('text-align','right');
		
		$(".saveBtn_"+sid+"").css('display','inline-block');
		$(".resetBtn_"+sid+"").css('display','inline-block');
		$(".modBtn_"+sid+"").css('display','none');
		$(".delBtn_"+sid+"").css('display','none');
		
	}

	/*	세금계산 테이블 수정 후 저장	- 저장후 새로고침	*/
	function saveSalaryTax(sid){

		// 콤마 제거 후 저장
		function parseNumberCustom(number_string) {
		    return number_string = parseInt(number_string.replace(/,/g, ""));
		}
		
		var startingRange			= parseNumberCustom($("#startingRange_"+sid+"").val());
		var salaryNps				= parseNumberCustom($("#salaryNps_"+sid+"").val());
		var salaryHInsurance		= parseNumberCustom($("#salaryHInsurance_"+sid+"").val());
		var salaryCare				= parseNumberCustom($("#salaryCare_"+sid+"").val());
		var salaryEInsurance		= parseNumberCustom($("#salaryEInsurance_"+sid+"").val());
		var salaryIncome			= parseNumberCustom($("#salaryIncome_"+sid+"").val());
		var salaryLIncome			= parseNumberCustom($("#salaryLIncome_"+sid+"").val());
		
		var salaryData = {
				salaryId				:	sid,
				startingRange			:	startingRange,
				salaryNps				:	salaryNps,
				salaryHInsurance		:	salaryHInsurance,
				salaryCare				:	salaryCare,
				salaryEInsurance		:	salaryEInsurance,
				salaryIncome			:	salaryIncome,
				salaryLIncome			:	salaryLIncome 
		}

		$.ajax({
			url		: "${pageContext.request.contextPath}/admin/salary_tax_list",
			type	: "POST",
			data	: salaryData,
			success	: function(resData){
				alert("세금계산테이블 수정 성공");
				window.location.reload();
				
			},
			error	: function(){
				alert("ajax에러");
			}
		});
	}

	/*	세금계산테이블 행 삭제	*/
	function deleteSalaryTax(sid, netPay){

		var msg = "실수령액이 " + netPay + "원인 "+sid+"번 세금계산테이블을 삭제하시겠습니까?";

		if( confirm(msg) ){
			$.ajax({
				url		: "${pageContext.request.contextPath}/admin/delete_salary_tax_list",
				type	: "POST",
				data	: {	salaryId	:	sid},
				success	:	function(resData){
					alert("성공적으로 삭제하였습니다.");
					window.location.reload();
				},
				error	: function(){
					alert(""+sid+"번 세금계산테이블 삭제에 실패하였습니다.\n관리자에게 문의하세요.");
					return false;
				}
				
			});
		}else{
			return false;
		}		
	}

	function resetSalaryTax(sid){
		window.location.reload();
	}
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>