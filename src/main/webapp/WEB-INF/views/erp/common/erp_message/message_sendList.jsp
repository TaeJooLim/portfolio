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
    <div class="page_wrap bg_white noto font_14">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">쪽지<i class="fas fa-chevron-right p_lr10"></i>보낸 쪽지 보관함</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="right_top">
                        <div class="right_top_btn flex">
                        	<a target="_blank" href="${pageContext.request.contextPath}/common/message_send">
	                            <div class="total_list_btn m_r5">쪽지 쓰기</div>
                        	</a>
                        	<a href="${pageContext.request.contextPath}/common/message_fromList?empId=${sessionScope.empId}">
	                            <div class="total_list_btn m_r5" style="background-color: #d6dcec;">받은 쪽지</div>
                        	</a>
                        	<a href="${pageContext.request.contextPath}/common/message_sendList?empId=${sessionScope.empId}">
                            	<div class="total_list_btn m_r5" style="background-color: #33428C;">보낸 쪽지</div>
                            </a>
                            <div class="total_cnt_btn_grp flex">
			                	<div class="search_cnt_btn_grp flex">
			                    	<div class="left_radius_btn white">검색된 쪽지수</div>
			                		<div class="right_radius_btn">${mCnt}개</div>
			                	</div>
			                </div>
                        </div>
                        <div class="search_wrap m_t10">
			                <form id="" name="" action="">
				                <div class="search_grp flex m_t10">
				                	<select class="search_sel_box" id="" name="searchOpt">
				                    	<option value="msg_subject">제목</option>
				                    	<option value="emp_name">받는사람</option>
				                    	<option value="all">전체검색</option>
				                	</select>
				                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="" />
				                    <input type="hidden" name="empId" value="${sessionScope.empId}" />
				                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
				                </div>
			                </form>
                		</div>
                		<div class="flex m_tb10">
                			<div>
                                <button class="btn_red" id="delSendMsgAll">선택삭제</button>
                            </div>
	                        <div class="list_comment font_12" style="width:100%; padding: 10px 20px; background-color: #f9f9f9;">
	                           보낸 쪽지가 저장됩니다.
	                        </div>
                		</div>
                    </div>
                    <div class="right_bottom">
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list center">
                                <thead>
                                    <tr>
                                        <th class="td_2" style="line-height: 15px;">
                                        <input type="checkbox" onClick="chkAll();" id="chkAll" />
                                    </th>
                                    <th class="td_60">제목</th>
                                    <th>받는사람</th>
                                    <th>부서</th>
                                    <th>날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${mCnt == 0}">
                                		<tr>
                                			<td colspan="6">보관하고 있는 쪽지가 없습니다.</td>
                                		</tr>
                                	</c:if>
                                    <c:forEach items="${mList}" var="mlist">
                                        <tr>
                                            <td style="line-height: 15px;">
                                                <input type="checkbox" class="chk" name="chk" data-uid="${mlist.msgId}" />
                                            </td>
                                            <td class="left p_l10">
	                                            <a target="_blank" href="${pageContext.request.contextPath}/common/message_read?msgId=${mlist.msgId}&typeChk=0" <c:if test="${mlist.msgConfirm eq 'N'}">class="weight_700"</c:if>>
	                                            	${mlist.msgSubject}
	                                            </a>
	                                        </td>
                                            <td>${mlist.empName} ${mlist.empPositionName}</td>
                                            <td>${mlist.empDepartmentName}</td>
                                            <td>${mlist.regDateFormat}</td>
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
</script>
<script src="${pageContext.request.contextPath}/js/message.js"></script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>