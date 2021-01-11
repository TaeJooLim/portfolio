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
	<title>견적서</title>
</head>
<body>
    <div class="page_wrap noto font_14">
    	<div class="print_btn_grp flex flex_fe">
			<button type="button" id="print_btn" class="m_r5 btn_blue" style="outline:none" onClick='window.print();'>인쇄</button>
		</div>
        <div class="subpage_wrap">
            <div class="main_right" style="width: 100%;">
                <div class="main_right_title p_10 w_100 m_b20">
                    <h1 class="center">견 적 서</h1>
                </div>
            </div>
            <div class="main_right_info w_100">
                <div class="table_grp flex space_between">
                    <table class="td_50 m_r10">
                        <tr>
                            <td class="p_l5">
                                <span class="weight_700" id="accountName">${contractVO.contClientCompany} ${contractVO.contClientCeoName}</span>
                            </td>
                            <td class="td_20">귀하</td>
                        </tr>
                        <tr>
                            <td class="p_l5" colspan="2">${contractVO.contOrderDate}</td>
                        </tr>
                        <tr>
                            <td>
                                <span>아래와 같이 견적합니다.</span>
                            </td>
                        </tr>
                    </table>
                    <table class="form_tbl w_100">
                        <tr>
                            <td class="td_6" rowspan="5">공급자</td>
                            <td class="td_20">사업자<br />등록번호</td>
                            <td class="weight_700" colspan="3">
                                <span>${companyVO.comNum}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>상호명</span>
                            </td>
                            <td class="weight_700">
                                <span>${companyVO.comName}</span>
                            </td>
                            <td class="td_20">
                                <span>대표자</span>
                            </td>
                            <td class="weight_700">
                                <span>${companyVO.comCeo}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>사업장<br />소재지</span>
                            </td>
                            <td class="weight_700" colspan="3">
                                <span>${companyVO.comAddress}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>업태</span>
                            </td>
                            <td class="weight_700">
                                <span>${companyVO.comType}</span>
                            </td>
                            <td>
                                <span>업종</span>
                            </td>
                            <td class="weight_700">
                                <span>${companyVO.comItem}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>담당부서</span>
                            </td>
                            <td class="weight_700">
                                <span>${contractVO.contDepartName}</span>
                            </td>
                            <td>
                                <span>담당자</span>
                            </td>
                            <td class="weight_700">
                                <span>${contractVO.contPositionName} ${contractVO.contEmpName}</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="m_t20">
                    <div class="table_grp">
                        <table class="form_tbl w_100" style="border: 2px solid #000;">
                            <tr>
                                <td class="td_20">
                                    <span>품명</span>
                                </td>
                                <td class="td_20">
                                    <span>규격</span>
                                </td>
                                <td class="td_8">
                                    <span>수량</span>
                                </td>
                                <td>
                                    <span>단가</span>
                                </td>
                                <td>
                                    <span>공급가액</span>
                                </td>
                                <td>
                                    <span>세액</span>
                                </td>
                            </tr>
                            <!-- 반복시작 -->
                            <c:forEach items="${cList}" var="clist">
                                <tr>
                                    <td>${clist.contDpName}</td>
                                    <td>${clist.contDpUnit}</td>
                                    <td>${clist.contDpAmount}</td>
                                    <td>
                                    	<fmt:formatNumber value="${clist.contDpSell}" pattern="#,###"/> 원
                                    </td>
                                    <td>
                                    	<fmt:formatNumber value="${clist.contDpAmount * clist.contDpSell}" pattern="#,###"/> 원
                                    </td>
                                    <td>
                                    	<fmt:formatNumber value="${clist.contDpAmount * clist.contDpSell * 0.1}" pattern="#,###"/> 원
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- 계 -->
                            <tr>
                                <td colspan="4">
                                    <span>계</span>
                                </td>
                                <td class="weight_700" colspan="2">
                                    <fmt:formatNumber value="${totalCost}" pattern="#,###"/> 원
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">비고</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="height: 400px;">
                                    ${contractVO.contNote}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
</script>
</html>