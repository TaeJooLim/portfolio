<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
</head>
<style>
    /* 검색박스 css */
    .search_input {
        width: 180px;
        border: 1px solid #eee;
</style>

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">메세지 보관함</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="right_top">
                        <div class="right_top_btn flex">
                            <div class="  total_list_btn m_r5">받은 메세지</div>
                            <div class="  total_list_btn m_r5" style="background-color: #9eacc6;">보낸 메세지</div>
                        </div>
                        <div class="search_grp flex m_t10">
                            <input type="text" name="empName" class="search_input p_l5 m_r5" id="" placeholder="사원명을 입력해주세요" />
                            <div class="search_btn flex flex_vc flex_hc">
                                <i class="fas fa-search font_18" style="color: #959595;"></i>
                            </div>
                        </div>
                        <div class="list_comment   m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                           받은 메세지와 보낸 메세지들이 저장됩니다.
                        </div>
                    </div>
                    <div class="right_bottom">
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list   center">
                                <thead>
                                    <tr>
                                        <th class="td_2" style="line-height: 15px;">
                                        <input type="checkbox" />
                                    </th>
                                    <th class="td_60">제목</th>
                                    <th>보낸이</th>
                                    <th>부서</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="msg">
                                        <tr>
                                            <td style="line-height: 15px;">
                                                <input type="checkbox" />
                                            </td>
                                            <td class="left p_l10" <c:if test="${msg eq 'Y'}"> style="font-weight: bold;"</c:if>>${msg_subject}</td>
                                            <td>join : ${emp_name} + ${position_name}</td>
                                            <td>join : ${depart_name}</td>
                                            <td>${msgRegdate}</td>
                                        </tr>
                                        <tr>
                                            <td style="line-height: 15px;">
                                                <input type="checkbox" />
                                            </td>
                                            <td class="left p_l10">안녕하십니까. 인사팀 임태주 사원입니다.</td>
                                            <td>임태주 사원</td>
                                            <td>인사팀</td>
                                            <td>2020-11-29</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script>
	function get

	$(function() {
		
	});
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>