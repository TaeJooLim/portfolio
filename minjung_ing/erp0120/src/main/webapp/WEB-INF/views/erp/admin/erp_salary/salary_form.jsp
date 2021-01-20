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

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->
	<title>급여명세서</title>
</head>
<body>
	<div class="page_wrap noto font_14">
		<div class="print_btn_grp flex flex_fe">
			<button type="button" id="print_btn" class="m_r5 btn_blue" style="outline:none" onClick='window.print();'>인쇄</button>
			<button type="button" id="print_btn" class="btn_red" style="outline:none" onClick='window.close();'>닫기</button>
		</div>
        <div class="subpage_wrap">
            <div class="main_right" style="width: 100%;">
                <div class="main_right_title p_10 w_100 m_tb30">
                    <h1 class="center">급여명세서</h1>
                </div>
            </div>
            <div class="main_right_info w_100">
                <div class="table_grp w_100">
                    <table class="form_tbl w_100">
                        <tr>
                        	<td class="td_25 bg_gray">부서</td>
                        	<td class="td_25">${svo.empDepartmentName}</td>
                        	<td class="td_25 bg_gray">직급</td>
                        	<td class="td_25">${svo.empPositionName}</td>
                        </tr>
                        <tr>
                        	<td class="bg_gray">사원명</td>
                        	<td>${svo.empName}</td>
                        	<td class="bg_gray">입사일</td>
                        	<td>${svo.empEnter}</td>
                        </tr>
                        <tr>
                        	<td class="bg_gray" colspan="2" rowspan="2">비과세항목</td>
                        	<td class="bg_gray" colspan="2" rowspan="2">공제항목</td>
                        </tr>
                        <tr></tr>
                        <tr>
                        	<td style="border:none;">기본급</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryPay}" pattern="#,###"/>원</td>
                        	<td style="border:none;">국민연금</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryNps}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                        	<td style="border:none;">호봉수당</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.empStep}" pattern="#,###"/>원</td>
                        	<td style="border:none;">건강보험</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryHInsurance}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                        	<td style="border:none;">직책수당</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.empHeadcheck}" pattern="#,###"/>원</td>
                        	<td style="border:none;">장기요양</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryCare}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                        	<td style="border:none;">식대</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryFood}" pattern="#,###"/>원</td>
                        	<td style="border:none;">고용보험</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryEInsurance}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                        	<td style="border:none;">추가근무수당</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryOvertimePay}" pattern="#,###"/>원</td>
                        	<td style="border:none;">소득세</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryIncome}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                        	<td style="border:none;"></td>
                        	<td style="border:none;"></td>
                        	<td style="border:none;">지방소득세</td>
                        	<td style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryLIncome}" pattern="#,###"/>원</td>
                        </tr>
                    </table>
                    <table class="form_tbl w_100 m_t30" style="border:2px solid #000">
                    	<tr>
                    		<td class="bg_gray td_25">비과세총액</td>
                    		<td class="td_25" style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryNontaxTotalcost}" pattern="#,###"/>원</td>
                    		<td class="bg_gray td_25">공제총액</td>
                    		<td class="td_25" style="border:none;text-align:right;"><fmt:formatNumber value="${svo.salaryTotalcost}" pattern="#,###"/>원</td>
                    	</tr>
                    	<tr>
                    		<td class="bg_gray">지급일</td>
                    		<td>${svo.salaryDate}-01</td>
                    		<td class="bg_gray">실지급액</td>
                    		<td class="weight_700" style="text-align:right;"><fmt:formatNumber value="${svo.netPay + svo.salaryNontaxTotalcost}" pattern="#,###"/>원</td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
</script>
</html>