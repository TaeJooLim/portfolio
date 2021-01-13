<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_main.css">
<body>
<input type="hidden" id="hiddenId" value="${sessionScope.empId}"/>
   <div class="page_wrap bg_white noto font_14">
        <div class="main_wrap p_20 flex" style="flex-direction: column;">
            <div class="static-grp flex space_between m_b20">
                <div class="box_20x500 bg_white center">
                    <div class="box_title p_15 m_b20 bd_b1">
                        <h3 class="font_16 display_in">내 정보</h3>
                        <a href="${pageContext.request.contextPath}/user/my_info?empId=${sessionScope.empId}">
                            <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                        </a>
                    </div>
                    <div class="userinfo font_14">
                        <div class="userpic">
                        	<!-- <img src="${pageContext.request.contextPath}/imgUpload/man.png" alt=""> -->
                        </div>
                        <div class="userinfo-content m_t20">
                            <span class="blue weight_700">${sessionScope.empName} ${sessionScope.empId}</span>
                            <span>님 환영합니다.</span>
                        </div>
                        <p>빵빵덕 Corp.</p>
                    </div>

                    <div class="attend-vacation-content p_20">
                        <div class="attend_box">
                            <div class="attend_content p_tb10"
                                style="border-top: 1px solid #e7e7e7;border-bottom: 1px solid #e7e7e7;">
                                <div class="current-time-box w_100 p_tb20"
                                    style="border: 1px solid #e7e7e7; border-radius: 50px;">
                                    <p class="font_14" id="date"></p>
                                    <p class="font_14" id="clock"></p>
                                </div>
                            </div>
                            <div class="attend_time font_14 flex space_between p_t20">
                            	
                                <div class="w_50">
                                    <button type="button" class="btn_attend"
                                        onClick="setStarttime(${sessionScope.empId});">출근</button>
                                    <p class="p_tb10 weight_700 font_18" id="startTime"></p>
                                </div>
                                <div class="w_50">
                                    <button type="button" class="btn_attend"
                                        onClick="setEndtime(${sessionScope.empId});">퇴근</button>
                                    <p class="p_tb10 weight_700 font_18" id="endTime"></p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="box_60x500 bg_white">

                    <div class="notice-system-tab flex space_between bd_b1">
                        <div id="notice" class="notice_tab active font_16 noto p_15 center">사내 공지사항</div>
                        <div id="system" class="system_tab font_16 noto p_15 center">시스템 공지사항</div>
                    </div>

                    <div class="notice_box">
                        <div class="notice_content p_lr20" style="height:440px; overflow-y:auto;">
                        	<c:if test="${empty companyBoard}">
                        		<div class="w_100 flex" style="height:440px;justify-content:center;align-items:center;">
                   					<p class="weight_700">등록된 게시글이 없습니다.</p>
                   				</div>
                       		</c:if>
                            <c:forEach items="${companyBoard}" var="clist" begin="0" end="9">
                            	<input type="hidden" value="${clist.aId}"/>
	                            <div class="flex space_between p_tb20" style="border-bottom: 1px solid #e7e7e7;">
	                                <div class="w_50 flex">
	                                    <div class="">
	                                        <p class="noto font_14 weight_700">
		                                        <c:if test="${clist.division eq 0}">[일반] </c:if>
	                                        	<c:if test="${clist.division eq 1}"><strong style="color: tomato;">[공지] </strong></c:if> 
	                                        	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${comBoardNum}&aId=${clist.aId}">${clist.subject}</a>
	                                        </p>
	                                        <div>
	                                        	<span class="noto font_14 m_r10">${clist.regdate}</span>
	                                        	<span class="noto font_14">${clist.writer}</span>
	                                    	</div>
	                                    </div>
	                                </div>
	                                <div class="w_50" style="width: 50px;">
	                                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${comBoardNum}&aId=${clist.aId}">
	                                    	<span style="font-size: 24px; color: #555;"><i class="fas fa-angle-right"></i></span>
                                        </a>
	                                </div>
	                            </div>
                            </c:forEach>
                        	<p class="weight_700 p_tb10 flex space_between">
                        		<span>
                        			최근 게시글 10개만 표시됩니다
                       			</span>
                       			<a href="${pageContext.request.contextPath}/user/board_list?boardNum=${comBoardNum}">
	                        		<span style="color: #555;">
	                        			더보기 <i class="fas fa-angle-double-right"></i>
	                        		</span>
                        		</a>
                       		</p>
                        </div>
                    </div>
                    <div class="system_box">
                        <div class="system_content m_lr20">
                        	<c:if test="${empty systemBoard}">
                        		<div class="w_100 flex" style="height:443px;justify-content:center;align-items:center;">
                   					<p class="weight_700">등록된 게시글이 없습니다.</p>
                   				</div>
                       		</c:if>
                            <c:forEach items="${systemBoard}" var="slist" begin="0" end="9">
                            	<input type="hidden" value="${slist.aId}"/>
	                            <div class="flex space_between p_tb20" style="border-bottom: 1px solid #e7e7e7;">
	                                <div class="w_50 flex">
	                                    <div class="">
	                                        <p class="noto font_14 weight_700">
		                                        <c:if test="${slist.division eq 0}">[일반] </c:if>
	                                        	<c:if test="${slist.division eq 1}"><strong style="color: tomato;">[공지] </strong></c:if> 
	                                        <a href="${pageContext.request.contextPath}/user/board_view?boardNum=${sysBoardNum}&aId=${slist.aId}">${slist.subject}</a>
	                                        </p>
	                                        <div>
	                                        	<span class="noto font_14 m_r10">${slist.regdate}</span>
	                                        	<span class="noto font_14">${slist.writer}</span>
	                                    	</div>
	                                    </div>
	                                </div>
	                                <div class="w_50" style="width: 50px;">
	                                	<a>
	                                    	<span style="font-size: 24px; color: #555;"><i class="fas fa-angle-right"></i></span>
	                                    </a>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:if test="${not empty systemBoard}">
                        		<p class="weight_700 p_tb10 flex space_between">
	                        		<span>
	                        			최근 게시글 10개만 표시됩니다
	                       			</span>
	                       			<a href="${pageContext.request.contextPath}/user/board_list?boardNum=${sysBoardNum}">
		                        		<span style="color: #555;">
		                        			더보기 <i class="fas fa-angle-double-right"></i>
		                        		</span>
	                        		</a>
	                       		</p>
                       		</c:if>
                        </div>
                    </div>
                </div>
                <div class="" style="width: 20%;">
                    <div class="box_20x250 bg_white center m_b20">
                        <div class="box_title p_15 m_b10 bd_b1">
                            <h3 class="noto font_16">나의 쪽지함</h3>
                            <a
                                href="${pageContext.request.contextPath}/user/message_fromList?empId=${sessionScope.empId}">
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </a>
                        </div>
                        <div class="box-content p_lr10">
                            <table class="font_14" style="background-color: #fff;">
                                <tr>
                                    <td class="center p_b10"
                                        style="background-color: transparent;color: #000; border: 0;">
                                        <span class="font_14">읽지않은 메시지</span>
                                        <span class="weight_700 p_lr5 font_16">14건</span>
                                    </td>
                                </tr>
                            </table>
                            <div style="height:120px; overflow-y:auto;">
                                <table class="font_14">
                                    <tr>
                                        <td class="white_s_no w_10"
                                            style="background-color: #e7e7e7;border-right: 1px solid #fff;">
                                            보낸사람
                                        </td>
                                        <td class="w_90" style="background-color: #e7e7e7;">제목
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" style="background-color: transparent;">김아무
                                        </td>
                                        <td class="left" style="background-color: transparent;">
                                            <p class="one_line_txt p_l5">[주차]사옥 내 주차정산관련</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" style="background-color: transparent;">박지민
                                        </td>
                                        <td class="left" style="background-color: transparent;">
                                            <p class="one_line_txt p_l5">어드민님,어디세요</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" style="background-color: transparent;">박지민
                                        </td>
                                        <td class="left" style="background-color: transparent;">
                                            <p class="one_line_txt p_l5">어드민님,어디세요</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" style="background-color: transparent;">박지민
                                        </td>
                                        <td class="left" style="background-color: transparent;">
                                            <p class="one_line_txt p_l5">어드민님,어디세요</p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="box_20x250 bg_white center">
                        <div class="box_title p_15 bd_b1">
                            <h3 class="noto font_16">나의 휴가 현황</h3>
                            <a href="${pageContext.request.contextPath}/user/vacation?empId=${sessionScope.empId}">
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </a>
                        </div>
                        <div class="font_14 flex p_10"
                            style="height:185px;flex-direction:column;justify-content: space-around;">
                            <div class="vacation_btn flex space_between p_tb10 p_lr20">
                                <span class="">총 휴가일수</span>
                                <span class="blue weight_700">${employee.empOffTotal} 일</span>
                            </div>
                            <div class="vacation_btn flex space_between p_tb10 p_lr20">
                                <span class="">사용 휴가일수</span>
                                <span class="blue weight_700">${employee.empOffUse} 일</span>
                            </div>
                            <div class="vacation_btn flex space_between p_tb10 p_lr20">
                                <span class="">잔여 휴가일수</span>
                                <span class="blue weight_700">${employee.empOffRemain} 일</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="static-grp flex space_between">

                <div class="box_20x300 bg_white">
                    <div class="box_title p_15 bd_b1" style="height:50px;">
                        <h3 class="center font_16">법인차량 사용일지</h3>
                        <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                    	
                    	<div class="font_14 left m_lr20 p_tb10 flex space_between" style="border-bottom:1px solid #ccc;">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[차량번호]</span>
                                <span class="">운전자 및 목적지</span>
                            </div>
                            <div>
                                <span class="one_line_txt font_14">운행일자</span>
                            </div>
                        </div>
                        
                        
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box_42x300 bg_white">
                    <div class="box_title p_15 center bd_b1" style="height:50px;">
                        <h3 class="noto font_16">${sessionScope.empDepartmentName} 공지사항</h3>
                        <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                    	<div class="font_14 left m_lr20 p_tb10 flex space_between" style="border-bottom:1px solid #ccc;">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[작성자]</span>
                                <span class="">제목</span>
                            </div>
                            <div>
                                <span class="one_line_txt font_14">작성일</span>
                            </div>
                        </div>
                    
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box_42x300 bg_white">
                    <div class="box_title p_15 bd_b1">
                        <h3 class="noto center font_16">결재대기</h3>
                        <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                            <div class="one_line_txt">
                                <span class="blue weight_700 m_r5">[관리자]</span>
                                <span class="">포트폴리오 제출의 건 안내</span>
                            </div>
                            <div>
                                <span class="font_12 one_line_txt" style="color: gray;">20-09-18</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
<script src="${pageContext.request.contextPath}/js/user_main.js"></script>