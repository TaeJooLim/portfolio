<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>

 <div class="page_wrap bg_white noto font_14">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>3. 출고상품목록</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="product_reg">
                        <table class="list">
                            <tr>
                                <td class="bg_gray weight_700 td_10 center">문서번호</td>
                                <td class="p_lr3">
                                    <select name="" id="" class="sel_100">
                                        <option value="">문서번호를 선택해주세요.</option>
                                    </select>
                                </td>
                                <td class="bg_gray weight_700 td_10 center">거래처명</td>
                                <td class="p_lr3">
                                    <select name="" id="" class="sel_100">
                                        <option value="">거래처를 선택해주세요.</option>
                                    </select>
                                </td>
                                <td class="bg_gray weight_700 td_10 center">발주일</td>
                                <td class="p_lr3">
                                    <input type="date" id="" name="" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 td_10 center">납기일</td>
                                <td class="p_lr3">
                                    <input type="date" id="" name="" class="input_100" required />
                                </td>
                            </tr>
                            <tr>
                                <td class="bg_gray weight_700 center">품명</td>
                                <td class="p_lr3 bg_white">
                                    <select name="" id="" class="sel_100">
                                        <option value="">품명을 선택해주세요.</option>
                                    </select>
                                </td>
                                <td class="bg_gray weight_700 td_10 center">담당자명</td>
                                <td class="p_lr3 bg_white">
                                    <select name="" id="" class="sel_100">
                                        <option value="">담당자를 선택해주세요.</option>
                                    </select>
                                </td>
                                <td class="bg_gray weight_700 td_10 center">추가예정</td>
                                <td class="p_lr3 bg_white">
                                    <input type="" id="" name="" class="input_100" placeholder="추가예정입니다.">
                                </td>
                                <td class="bg_gray weight_700 td_10 center">추가예정</td>
                                <td class="p_lr3 bg_white">
                                    <input type="" id="" name="" class="input_100" placeholder="추가예정입니다.">
                                </td>
                            </tr>
                        </table>
                        <div class="btn-grp center m_t10">
                            <button type="submit" class="btn_blue">상품조회</button>
                            <button type="reset" class="btn_red">새로고침</button>
                        </div>
                    </div>
                    <div class="product_reg_table m_t20" style="border-top: 1px solid #000;">
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            출고완료된 상품 목록입니다.
                        </div>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list">
                                <thead>
                                    <tr>
                                        <th class="td_3">번호</th>
                                        <th class="td_10">문서번호</th>
                                        <th class="td_10">거래처명</th>
                                        <th class="td_5">담당자명</th>
                                        <th class="td_10">품명</th>
                                        <th class="td_3">단위</th>
                                        <th class="td_8">단가</th>
                                        <th class="td_3">수량</th>
                                        <th class="td_8">공급가액</th>
                                        <th class="td_10">발주일</th>
                                        <th class="td_10">납기일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
<%--                                         <c:forEach items=${list} var="wc" varStatus="var"> --%>
                                            <tr>
                                                <td>1</td>
                                                <td>20201206_거래처코드_contD_id</td>
                                                <td>그린컴퓨터 아카데미</td>
                                                <td>임태주</td>
                                                <td>데스크탑A</td>
                                                <td>EA</td>
                                                <td>2000000</td>
                                                <td>10</td>
                                                <td>20000000</td>
                                                <td>2020-12-06</td>
                                                <td>2020-12-11</td>
                                            </tr><tr>
                                                <td>2</td>
                                                <td>20201206_거래처코드_contD_id</td>
                                                <td>LG휘센</td>
                                                <td>임태주</td>
                                                <td>에어컨</td>
                                                <td>EA</td>
                                                <td>3000000</td>
                                                <td>20</td>
                                                <td>60000000</td>
                                                <td>2020-12-04</td>
                                                <td>2020-12-18</td>
                                            </tr>
<%--                                         </c:forEach> --%>
                                    </tbody> 
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>