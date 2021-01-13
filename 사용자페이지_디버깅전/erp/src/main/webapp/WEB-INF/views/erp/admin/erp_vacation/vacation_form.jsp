<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

    <!-- FontAweSome -->
    <script src="https://kit.fontawesome.com/5990def7eb.js" crossorigin="anonymous"></script>
    <!-- FontAweSome -->

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->
	<title>연차신청서 결재</title>
</head>
<body>
    <div class="page_wrap noto font_12">
    	<div class="print_btn_grp flex flex_fe">
			<button type="button" id="print_btn" class="m_r5 btn_blue" style="outline:none" onClick='window.print();'>인쇄</button>
			<c:if test="${vList.offConfirm eq 'N' }">
				<button type="button" id="sign_btn" class="m_r5 btn_red" style="outline:none" onClick="updateConfirm('${vList.offConfirm}', '${vList.offDocNum}');">결재</button>
			</c:if>
		</div>
        <div class="subpage_wrap">
            <div class="main_right" style="width: 100%;">
                <div class="main_right_title p_10 w_100 m_b20">
                    <h1 class="center">휴가신청서</h1>
                </div>
            </div>
            <div class="main_right_info w_100">
                <div class="table_grp flex space_between">
                    <table class="form_tbl">
                        <tr>
                            <td class="bg_gray">작성일</td>
                            <td>
                                <span class="">${vList.offRegdate}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성부서</td>
                            <td>
                                <span class="">${vList.empDepartmentName} ${vList.empTeam}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성자</td>
                            <td>
                                <span class="">${vList.empName} ${vList.empPositionName}</span>
                            </td>
                        </tr>
                    </table>
                    <table class="form_tbl td_20">
                        <tr>
                            <td class="bg_gray" rowspan="4">결<br />재</td>
                            <td>
                                <span class="">부서장</span>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2" id="signature">
	                        	<c:choose>
	                        		<c:when test="${vList.offConfirm eq 'Y'}">
	                        			<img class="w_100" src="${pageContext.request.contextPath}/images/signature/signatureempid5.jpg" />
	                        		</c:when>
	                        		<c:otherwise>서명</c:otherwise>
	                        	</c:choose>
                        	</td>
                        </tr>
                        <tr></tr>
                    </table>
                </div>
                <div class="form_title w_100 m_tb20">
                    <table class="form_tbl w_100">
                        <tr>
                            <td class="bg_gray td_10">제목</td>
                            <td class="" style="text-align: left;" colspan="3">
                                <span id="title" class="">${vList.empDepartmentName} ${vList.empTeam} ${vList.empName} ${vList.empPositionName} 휴가신청서</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">구분</td>
                            <td>
                                <span id="" class="">
                                	<c:if test="${vList.offType eq 'A'}">연차</c:if>
                                    <c:if test="${vList.offType eq 'B'}">반차</c:if>
                                    <c:if test="${vList.offType eq 'C'}">반반차</c:if>
                                    <c:if test="${vList.offType eq 'D'}">휴직</c:if>
                                </span>
                            </td>
                            <td class="bg_gray td_10">휴가기간</td>
                            <td>
                                <span id="" class="">${vList.offStartDate} ~ ${vList.offEndDate} </span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="form_txt_wrap center m_tb20">
                    상기와 같이 휴가를 신청합니다.
                </div>
                <div class="form_footer_wrap">
                    <div id="" class="">...................................................................................................................................................................................................................</div>
                    <div id="p_l10" class="">
                        ※ 휴가 신청서 작성 시 의무사항 : 복무규정에 근거
                    </div>
                    <div class="p_l20">
                        · 회사는 1년간 8할 이상 출근한 사원에 대하여는 16일의 연차유급휴가를 지급한다.
                    </div>
                    <div class="p_l20">
                        · 근로연수가 1년 미만인 사원에 대해서는 1개월간 개근 시 1일의 연차유급휴가를 부여하되, 1년 근속 시 연차휴가 16일에서 그간 사용한 휴가를 공제한 일 수를 휴가로 부여한다.
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
function updateConfirm(offConfirm, offDocNum) {

	if(confirm("결재하시겠습니까?")) {
		var formData = {
				offConfirm	 : offConfirm,
				offDocNum: offDocNum
		};
		
		$.ajax({
			url		: "${pageContext.request.contextPath}/admin/vacation_confirm",
			type	:"POST",
			data	: formData,
			success	: function(resData) {
				alert("결재가 완료되었습니다.");
				window.location.reload();
			},
			error	: function() {
			}
		});
	} else {
		window.location.reload();
	}
} 
</script>
</html>