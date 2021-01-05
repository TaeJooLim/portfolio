<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>

<div class="page_wrap bg_white noto font_14" style="height: 100vh;">
    <div class="main_right bg_white" style="width: 100%;">
        <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
            <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>1. 생산현황</h2>
        </div>
    </div>
    <div class="main_right_info" style="padding: 30px 20px;">
        <div class="product_list">
            <table class="list">
                <tr>
                    <td class="bg_gray weight_700 td_10 center">거래처</td>
                    <td class="p_lr3 td_15 center">삼성전자</td>
                    <td class="bg_gray weight_700 td_10 center">발주일</td>
                    <td class="p_lr3 td_15 center">2020.12.03</td>
                    <td class="bg_gray weight_700 td_10 center">납기일</td>
                    <td class="p_lr3 td_15 center">2021.01.24</td>
                    <td class="bg_gray weight_700 td_10 center">담당자</td>
                    <td class="p_lr3 td_15 center">신짱구
                    </td>
                </tr>
            </table>
        </div>
        <div class="m_t10">
            <div class="">
                <div class="m_b5">
                    <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                        문서번호 : <strong>20201203_2133_2</strong>
                    </div>
                </div>
                <div class="w_100 white_s_no overflow_x_auto">
                    <table class="list">
                        <thead>
                            <tr>
                                <th class="td_5">번호</th>
                                <th>품명</th>
                                <th>단위</th>
                                <th>수량</th>
                                <th class="td_7">공정1</th>
                                <th class="td_7">공정2</th>
                                <th class="td_7">공정3</th>
                                <th class="td_7">공정4</th>
                                <th class="td_7">공정5</th>
                                <th class="td_7">출고여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>5</td>
                                <td>PRODUCT 5</td>
                                <td>EA</td>
                                <td>50</td>
                                <td class="p_lr3">PASS</td>
                                <td class="p_lr3">PASS</td>
                                <td class="p_lr3">PASS</td>
                                <td class="p_lr3">PASS</td>
                                <td class="p_lr3">PASS</td>
                                <td class="p_lr3">출고완료</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>PRODUCT 4</td>
                                    <td>EA</td>
                                    <td>150</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="p_lr3">미출고</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>PRODUCT 3</td>
                                    <td>EA</td>
                                    <td>30</td>
                                    <td class="p_lr3">PASS</td>
                                    <td class="td_7">PASS</td>
                                    <td class="td_7">FAIL</td>
                                    <td class="td_7">-</td>
                                    <td class="td_7">-</td>
                                    <td class="td_7">미출고</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>PRODUCT 2</td>
                                    <td>EA</td>
                                    <td>20</td>
                                    <td class="td_7">PASS</td>
                                    <td class="td_7">FAIL</td>
                                    <td class="td_7">FAIL</td>
                                    <td class="td_7">-</td>
                                    <td class="td_7">-</td>
                                    <td class="td_7">미출고</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>PRODUCT 1</td>
                                    <td>EA</td>
                                    <td>10</td>
                                    <td class="td_7">PASS</td>
                                    <td class="td_7">PASS</td>
                                    <td class="td_7">PASS</td>
                                    <td class="td_7">FAIL</td>
                                    <td class="td_7">-</td>
                                    <td class="td_7">미출고</td>
                                </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>