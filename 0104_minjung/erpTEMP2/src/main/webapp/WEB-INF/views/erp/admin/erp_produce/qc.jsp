<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>

<div class="page_wrap bg_white noto font_14">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>2. 품질검사</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="input_list">
                <table class="list">
                    <tr>
                        <td class="bg_gray weight_700 td_10 center">거래처</td>
                        <td class="p_lr3 td_15 center">삼성전자</td>
                        <td class="bg_gray weight_700 td_10 center">발주일</td>
                        <td class="p_lr3 td_15 center">2020.12.03
                        </td>
                        <td class="bg_gray weight_700 td_10 center">납기일</td>
                        <td class="p_lr3 td_15 center">2021.01.24
                        </td>
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
                                <th class="td_5">출고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>5</td>
                                <td>PRODUCT 5</td>
                                <td>EA</td>
                                <td>50</td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                               <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <button class="btn_blue" >출고완료</button>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>PRODUCT 4</td>
                                <td>EA</td>
                                <td>150</td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                               <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <button class="btn_red">출고</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>PRODUCT 3</td>
                                <td>EA</td>
                                <td>30</td>
                               <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                              <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N" selected>FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                               <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                               <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <button class="btn_ivory" disabled>출고</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>PRODUCT 2</td>
                                <td>EA</td>
                                <td>20</td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N" selected>FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N" selected>FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <button class="btn_ivory" disabled>출고</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>PRODUCT 1</td>
                                <td>EA</td>
                                <td>10</td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y" selected>PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N" selected>FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <select class="sel_100">
                                        <option>-</option>
                                        <option value="N">FAIL</option>
                                        <option value="Y">PASS</option>
                                    </select>
                                </td>
                                <td class="p_lr3">
                                    <button class="btn_ivory" disabled>출고</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>