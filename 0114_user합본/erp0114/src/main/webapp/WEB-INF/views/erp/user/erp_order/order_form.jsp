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
    
	<title>구매요청서 결재</title>
</head>
<body>
	<div class="page_wrap noto font_12">
		<div class="print_btn_grp flex flex_fe">
			<button type="button" id="print_btn" class="m_r5 btn_blue" style="outline:none" onClick='window.print();'>인쇄</button>
			<c:if test="${orderConfirm eq 'N' }">
				<button type="button" id="sign_btn" class="m_r5 btn_red" style="outline:none" onClick="signConfirm('${orderDocNum}');">결재</button>
			</c:if>
		</div>
        <div class="subpage_wrap">
            <div class="main_right" style="width: 100%;">
                <div class="main_right_title p_10 w_100 m_b20">
                    <h1 class="center">${empDepartmentName} 구매요청서</h1>
                </div>
            </div>
            <div class="main_right_info w_100">
                <div class="table_grp flex space_between">
                    <table class="form_tbl">
                        <tr>
                            <td class="bg_gray">문서번호</td>
                            <td>
                                <span id="orderDocNum" class="">${orderDocNum}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성일</td>
                            <td>
                                <span class="">${orderDate}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성부서</td>
                            <td>
                                <span class="">${empDepartmentName}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">마지막작성자</td>
                            <td>
                                <span class="">${orderEmpName} ${empPositionName}</span>
                            </td>
                        </tr>
                    </table>
                    <table class="form_tbl td_20">
                        <tr>
                            <td class="bg_gray" rowspan="4">결<br />재</td>
                            <td>
                                <span class="">총무팀장</span>
                            </td>
                        </tr>
                        <tr>
                       		<td rowspan="2" id="signature">
	                        	<c:choose>
	                        		<c:when test="${orderConfirm eq 'Y'}">
	                        			<img class="w_100" src="${pageContext.request.contextPath}/images/signature/signatureempid5.jpg" />
	                        		</c:when>
	                        		<c:otherwise>서명</c:otherwise>
	                        	</c:choose>
                        	</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td>
                            	<c:choose>
                            		<c:when test="${orderConfirm eq 'Y'}">${orderConfirmDate}</c:when>
                            		<c:otherwise>결재일</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="form_title w_100 m_tb20">
                    <table class="form_tbl w_100">
                        <tr>
                            <td class="bg_gray">제목</td>
                            <td class="" style="text-align: left;">
                                <span id="title" class="">${orderSubject}</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="">
                    <div class="table_grp">
                        <table class="form_tbl w_100" style="border: 2px solid #000;">
                            <tr>
                                <td class="td_5">No</td>
                                <td class="td_20">요청품목</td>
                                <td class="td_6">수량</td>
                                <td class="td_6">단위</td>
                                <td class="td_15">단가</td>
                                <td class="td_15">금액</td>
                                <td>용도</td>
                            </tr>
                            
                            <!-- 반복시작 -->
                            <c:forEach items="${orderList}" var="list">
                                <tr>
                                    <td>10</td>
                                    <td>${list.orderPName}</td>
                                    <td>${list.orderPAmount}</td>
                                    <td>${list.orderPUnit}</td>
                                    <td>
                                    	<fmt:formatNumber value="${list.orderPBuy}" pattern="#,###"/> 원
                                    <td>
                                    	<fmt:formatNumber value="${list.orderTotalPrice}" pattern="#,###"/> 원
                                    </td>
                                    <td>${list.orderPurpose}</td>
                                </tr>
                            </c:forEach>
                            
                            <!-- 계 -->
                            <tr>
                                <td colspan="5">
                                    <span class="weight_700">계</span>
                                </td>
                                <td colspan="2" class="weight_700">
                                    <fmt:formatNumber value="${tPrice}" pattern="#,###"/> 원
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">비고사항</td>
                            </tr>
                            <tr>
                                <td colspan="7" style="height: 200px;">
                                    <textarea class="w_100 p_5" id="" name="" style="height:200px;border: none;outline: transparent;">총무팀장의 개인의견 기입 ex) 총무팀에서 업체와 협의를 통해 5만원 DC</textarea>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/order_buy.js"></script>
</html>