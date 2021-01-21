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
                        	<c:choose>
                        		<c:when test="${sessionScope.empPhoto eq null}">
                        			<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="">
                        		</c:when>
                        		<c:otherwise>
                        			<img src="${pageContext.request.contextPath}/imgUpload/${sessionScope.empPhoto}" alt="">
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="userinfo-content m_t20">
                            <span class="blue weight_700">${sessionScope.empDepartmentName} ${sessionScope.empName} ${sessionScope.empPositionName}</span>
                            <span>님 환영합니다.</span>
                        </div>
                        <p>${comName.comName}</p>
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
			            		<div class="one_line bd_b1 p_10">
			     					<div class="picNcontent flex">
										<div class="one_line_pic m_r10 w_10">
											<c:choose>
			      								<c:when test="${clist.empPhotoFk eq null}">
			             							<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="">
								          		</c:when>
									        	<c:otherwise>
										       		<!-- (있으면)사진파일 -->
							                      	<img src="${pageContext.request.contextPath}/imgUpload/${clist.empPhotoFk}" alt="" id=""/>
										         </c:otherwise>
			           						</c:choose>
			                      		</div>
			                         	<div class="line_content_wrap left flex flex_col w_90 p_lr20" style="line-height: 20px;flex-direction: column;">
			                            	<div class="one_line_type blue font_14 weight_700">
			                                	<c:choose>
			                                    	<c:when test="${clist.division eq 0}">[일반]</c:when>
													<c:otherwise><strong style="color: tomato;">[공지]</strong></c:otherwise>
			                                   	</c:choose>
			                            	</div>
			                            	<div class="two_line_title noto font_14 weight_700">
			                                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${comBoardNum}&aId=${clist.aId}">${clist.subject}</a>
			                               	</div>
			                             	<div class="one_line_writer flex w_100">
			                              		<div class="one_line_txt m_r10">${clist.regdate}</div>
			                                   	<div class="one_line_txt">${clist.writer}</div>
			                               	</div>
			                           	</div>
			                          	<div class="w_50 flex flex_vc" style="width: 50px;">
						                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${comBoardNum}&aId=${clist.aId}">
						                    	<span style="font-size: 24px; color: #555;"><i class="fas fa-angle-right"></i></span>
					                      	</a>
						              	</div>
			                     	</div>
			                 	</div>
		               		</c:forEach>
                        	<p class="weight_700 p_10 p_r30 flex space_between">
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
                        <div class="system_content p_lr20" style="height:440px; overflow-y:auto;">
                        	<c:if test="${empty systemBoard}">
                        		<div class="w_100 flex" style="height:440px;justify-content:center;align-items:center;">
                   					<p class="weight_700">등록된 게시글이 없습니다.</p>
                   				</div>
                       		</c:if>
                            <c:forEach items="${systemBoard}" var="slist" begin="0" end="9">
			            		<div class="one_line bd_b1 p_10">
			     					<div class="picNcontent flex">
										<div class="one_line_pic m_r10 w_10">
											<c:choose>
			      								<c:when test="${slist.empPhotoFk eq null}">
			             							<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="">
								          		</c:when>
									        	<c:otherwise>
										       		<!-- (있으면)사진파일 -->
							                      	<img src="${pageContext.request.contextPath}/imgUpload/${slist.empPhotoFk}" alt="" id=""/>
										         </c:otherwise>
			           						</c:choose>
			                      		</div>
			                         	<div class="line_content_wrap left flex flex_col w_90 p_lr20" style="line-height: 20px;flex-direction: column;">
			                            	<div class="one_line_type blue font_14 weight_700">
			                                	<c:choose>
			                                    	<c:when test="${slist.division eq 0}">[일반]</c:when>
													<c:otherwise><strong style="color: tomato;">[공지]</strong></c:otherwise>
			                                   	</c:choose>
			                            	</div>
			                            	<div class="two_line_title noto font_14 weight_700">
			                                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${sysBoardNum}&aId=${slist.aId}">${slist.subject}</a>
			                               	</div>
			                             	<div class="one_line_writer flex w_100">
			                              		<div class="one_line_txt m_r10">${slist.regdate}</div>
			                                   	<div class="one_line_txt">${slist.writer}</div>
			                               	</div>
			                           	</div>
			                          	<div class="w_50 flex flex_vc" style="width: 50px;">
						                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${sysBoardNum}&aId=${slist.aId}">
						                    	<span style="font-size: 24px; color: #555;"><i class="fas fa-angle-right"></i></span>
					                      	</a>
						              	</div>
			                     	</div>
			                 	</div>
		               		</c:forEach>
                            <c:if test="${not empty systemBoard}">
	                       		<p class="weight_700 p_10 p_r30 flex space_between">
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
                                        <span class="weight_700 p_lr5 font_16">${mUnreadCnt} 건</span>
                                    </td>
                                </tr>
                            </table>
                            <div style="height:120px; overflow-y:auto;">
                                <table class="font_14">
                                
                                    <tr>
                                        <td class="white_s_no p_lr3"
                                            style="background-color: #e7e7e7;border-right: 1px solid #fff;">
                                            보낸사람
                                        </td>
                                        <td class="p_lr3" style="background-color: #e7e7e7;width:80%;">제목
                                        </td>
                                    </tr>
                                    
                                    <c:if test="${mUnreadCnt == 0}">
                                		<tr>
                                			<td colspan="2">읽지않은 쪽지가 없습니다.</td>
                                		</tr>
                                	</c:if>
                                	
                                	<c:forEach items="${mUnreadList}" var="mlist">
	                                    <input type="hidden" value="${mlist.msgId}" />
	                                    <tr>
	                                        <td class="" style="background-color: transparent;">
	                                        	<p class="one_line_txt">${mlist.empName}</p>
	                                        </td>
	                                        <td class="left" style="background-color: transparent;">
	                                        	<a target="_blank" href="${pageContext.request.contextPath}/user/message_read?msgId=${mlist.msgId}&typeChk=1" class="one_line_txt p_l5 <c:if test="${mlist.msgConfirm eq 'N'}">weight_700</c:if>">
	                                        		${mlist.msgSubject}
	                                        	</a>
	                                            
	                                        </td>
	                                    </tr>
                                  	</c:forEach>
                                  	
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
                        <a href="${pageContext.request.contextPath}/user/corp_car_log">
                        	<i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                      	</a>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                        <c:if test="${empty carList}">
                        	<div class="w_100 flex" style="height:200px;justify-content:center;align-items:center;">
               					<p class="weight_700">등록된 법인차량 사용일지가 없습니다.</p>
               				</div>
                        </c:if>
                        <c:forEach items="${carList}" var="carlist">
	                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
	                            <div class="one_line_txt">
	                                <span class="blue weight_700 m_r5">[${carlist.carNum}]</span>
	                                <span class="">법인차량 사용일지</span>
	                            </div>
	                            <div>
	                                <span class="font_12 one_line_txt" style="color: gray;">${carlist.carDriveDate}</span>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                    </div>
                </div>

                <div class="box_42x300 bg_white">
                    <div class="box_title p_15 center bd_b1" style="height:50px;">
                        <h3 class="noto font_16">
	                        <c:choose>
	                        	<c:when test="${sessionScope.empId eq '1'}">문의사항</c:when>
	                        	<c:otherwise>${sessionScope.empDepartmentName} 공지사항</c:otherwise>
	                        </c:choose>
                        </h3>
                        <a href="${pageContext.request.contextPath}/user/board_list?boardNum=${myBoardNum}">
                        	<i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                        </a>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                    	<c:if test="${empty myBoard}">
                    		<div class="w_100 flex" style="height:200px;justify-content:center;align-items:center;">
               					<p class="weight_700">등록된 게시글이 없습니다.</p>
               				</div>
                   		</c:if>
                    	<c:forEach items="${myBoard}" var="myBoard" begin="0" end="9">
                    		<input type="hidden" value="${myBoard.aId}"/>
	                        <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
	                            <div class="one_line_txt">
	                            	<c:if test="${myBoard.division eq 0}">[일반] </c:if>
                                   	<c:if test="${myBoard.division eq 1}"><strong style="color: tomato;">[공지] </strong></c:if> 
	                                <span class="">
	                                	<a href="${pageContext.request.contextPath}/user/board_view?boardNum=${myBoardNum}&aId=${myBoard.aId}">
	                                	${myBoard.subject}
                                		</a>
                                	</span>
	                            </div>
	                            <div>
	                                <span class="font_12 one_line_txt" style="color: gray;">${myBoard.regdate} ${myBoard.writer}</span>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                    </div>
                </div>

                <div class="box_42x300 bg_white">
                    <div class="box_title p_15 bd_b1">
                        <h3 class="noto center font_16">결재대기문서</h3>
                        <a href="${pageContext.request.contextPath}/user/appWaiting?appType=V&empId=${sessionScope.empId}">
                        	<i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                        </a>
                    </div>
                    <div class="p_tb10" style="height:250px; overflow-y: auto;">
                    
                    	<!-- 데이터가 없을경우 예외처리 -->
                    	<c:choose>
	                    	<c:when test="${empty approvalList}">
	                    		<div class="w_100 flex" style="height:200px;justify-content:center;align-items:center;">
	               					<p class="weight_700">결재대기중인 문서가 없습니다.</p>
	               				</div>
	                   		</c:when>
	                   		<c:otherwise>
	                   			<div class="approvalTbl_wrap font_14 m_lr10">
		                   			<table class="font_14">
		                   				<tr class="weight_700 bd_b1" style="height:40px;">
		                   					<td class="p_l10" style="border:none;">기안일</td>
		                   					<td class="p_l10" style="border:none;">문서번호</td>
		                   					<td class="p_l10" style="border:none;">문서제목</td>
		                   					<td class="p_l10" style="border:none;">작성자</td>
		                   				</tr>
		                   				<c:forEach items="${approvalList}" var="alist">
		                        			<tr class="" style="height:30px;">
		                        				<td class="p_l10" style="border:none;">${alist.orderDate}</td>
		                        				<td class="p_l10" style="border:none;">${alist.orderDocNum}</td>
		                        				<td class="p_l10" style="border:none;">${approvalType}</td>
		                        				<td class="p_l10" style="border:none;">${alist.empDepartmentName} ${alist.orderEmpName} ${alist.empPositionName}</td>
		                        			</tr>
	                      			  	</c:forEach>
		                   			</table>
	                   			</div>
	                   		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp" %>
    </div>
<script src="${pageContext.request.contextPath}/js/user_main.js"></script>