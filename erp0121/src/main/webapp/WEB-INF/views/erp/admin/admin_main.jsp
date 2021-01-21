<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<!DOCTYPE html>
	<div class="page_wrap bg_white noto font_14">
		 <div class="w_100 h_100 bg_gray">
        <div class="main flex">
            <div class="main_wrap">
                <div class="admin_main_right p_20 noto">
                    <div class="static_grp flex space_between m_b20">
                    	<!-- 받은쪽지함 -->
                        <div class="box_32x500 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="font_16 weight_700 display_in">받은 쪽지함</h3>
                                <a href="${pageContext.request.contextPath}/common/message_fromList?empId=${sessionScope.empId}">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_5 font_14" style="height:450px;overflow-y: auto;">
                                <div class="tbl_wrap">
                                    <table>
                                        <tr class="bg_blue_4 center">
                                            <td class="td_40">제목</td>
                                            <td class="td_20">보낸이</td>
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">날짜</td>
                                        </tr>
                                        <c:choose>
	                                        <c:when test="${empty msgList}">
		                                		<tr><td class="center" colspan="4">보관하고 있는 쪽지가 없습니다.</td></tr>
		                                	</c:when>
	                                        <c:otherwise>
		                                        <c:forEach items="${msgList}" var="mlist">
			                                        <tr>
			                                            <td class="left p_l10">
				                                            <a target="_blank" href="${pageContext.request.contextPath}/common/message_read?msgId=${mlist.msgId}&typeChk=1" <c:if test="${mlist.msgConfirm eq 'N'}">class="weight_700"</c:if>>
				                                            	${mlist.msgSubject}
				                                            </a>
				                                        </td>
			                                            <td class="center">${mlist.empName} ${mlist.empPositionName}</td>
			                                            <td class="center">${mlist.empDepartmentName}</td>
			                                            <td class="center">${mlist.regDateFormat}</td>
			                                        </tr>
			                                    </c:forEach>
	                                        </c:otherwise>
                                        </c:choose>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 출퇴근 미처리 인원 조회 -->
                        <div class="box_32x500 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="font_16 weight_700 display_in">출퇴근 미처리 인원 조회</h3>
                                <a href="${pageContext.request.contextPath}/admin/attend_list">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_5 font_14" style="height:450px;overflow-y: auto;">
                                <div class="tbl_wrap">
                                    <table class="center">
                                        <tr class="bg_blue_4">
                                            <td class="td_20">일자</td>
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">사원명</td>
                                            <td class="td_10">출근</td>
                                            <td class="td_10">퇴근</td>
                                            <td class="td_20">상태</td>
                                        </tr>
                                        <c:choose>
                                        	<c:when test="${empty attendList}">
                                        		<tr><td colspan="6">출퇴근 처리가 필요한 인원이 없습니다.</td></tr>
                                        	</c:when>
	                                        <c:otherwise>
		                                        <c:forEach items="${attendList}" var="alist">
			                            	    	<tr>
			                        	            	<td>${alist.attendWorkdate}</td>
			                    	                 	<td>${alist.departName}</td>
			                	                       	<td>${alist.empName}</td>
			            	                          	<td>
			            	                          		<fmt:formatDate value="${alist.attendStarttime}" type="time" pattern="HH:mm" />
			            	                          	</td>
			        	                              	<td>
			        	                              		<c:if test="${alist.attendEndtime eq NULL}">-</c:if>
			        	                              		<fmt:formatDate value="${alist.attendEndtime}" type="time" pattern="HH:mm" />
			        	                              	</td>
			    	                                  	<td>처리필요</td>
				                                   	</tr>
		                                        </c:forEach>
	                                        </c:otherwise>
                                        </c:choose>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 가입승인 대기인원 조회 -->
                        <div class="box_34x500 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16 display_in">가입승인 대기인원 조회</h3>
                                <a href="${pageContext.request.contextPath}/admin/employee_list.html">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_5 font_14" style="height:450px;overflow-y:auto;">
                                <div class="tbl_wrap">
                                    <table class="center">
                                        <tr class="bg_blue_4">
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">사원명</td>
                                            <td class="td_10">직급</td>
                                            <td class="td_20">입사일</td>
                                            <td class="td_20">가입일</td>
                                            <td class="td_10">관리</td>
                                        </tr>
                                        <c:choose>
                                        	<c:when test="${empty regList}">
                                        		<tr><td class="center" colspan="6">가입승인 대기중인 인원이 없습니다.</td></tr>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach items="${regList}" var="rlist" varStatus="status">
		                                        	<tr>
							                          	<td>${rlist.empDepartmentName}</td>
							                           	<td>${rlist.empName}</td>
							                           	<td>${rlist.empPositionName}</td>
							                         	<td>${rlist.empEnter}</td>
							                           	<td>
							                             	<fmt:formatDate value="${rlist.empRegdate}" type="date" pattern="yyyy-MM-dd" />
							                           	</td>
							                 			<td>
							                          		<button class="s_btn_blue white_s_no" onClick="confirmChange('N', '${rlist.empNum}');">승인</button>
							                           	</td>
						                        	</tr>
		                                        </c:forEach>
                                        	</c:otherwise>
                                        </c:choose>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="static_grp flex space_between">
                        <div class="box_32x300 bg_white">
                            <div class="box_title bd_b1 center bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16 display_in">시스템 공지사항</h3>
                                <a href="${pageContext.request.contextPath}/admin/board_list?boardNum=999sys">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:230px;overflow-y: auto;">
                                <c:choose>
                                	<c:when test="${empty sysNoticeList}">
                                		<div class="w_100 center m_t10 font_14">작성된 글이 없습니다.</div>
                                	</c:when>
                                	<c:otherwise>
		                                <c:forEach items="${sysNoticeList}" var="syslist">
			                                <div class="one_line bd_b1 p_10">
			                                    <div class="picNcontent flex">
			                                        <div class="one_line_pic m_r10 w_10">
			                                        	<c:choose>
			                                        		<c:when test="${syslist.empPhotoFk eq null}">
			                                        			<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="empPhotoImg">
			                                        		</c:when>
			                                        		<c:otherwise>
			                                        			<!-- (있으면)사진파일 -->
                                        						<img src="${pageContext.request.contextPath}/imgUpload/${syslist.empPhotoFk}" alt="" id="empPhotoImg"/>
			                                        		</c:otherwise>
			                                        	</c:choose>
			                                        </div>
			                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;flex-direction: column;">
			                                            <div class="one_line_type blue font_14 weight_700">
			                                                <c:choose>
			                                                	<c:when test="${syslist.division eq 0}">[일반]</c:when>
																<c:otherwise><span class="red">[공지]</span></c:otherwise>
			                                                </c:choose>
			                                            </div>
			                                            <div class="two_line_title under">
			                                                <a href="${pageContext.request.contextPath}/admin/board_view?boardNum=999sys&aId=${syslist.aId}" class="weight_700 m_r5 subject">${syslist.subject}</a>
			                                            </div>
			                                            <div class="one_line_writer flex space_between w_100">
			                                                <div class="one_line_txt">${syslist.writer}</div>
			                                                <div class="one_line_txt gray">${syslist.regdate}</div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="box_32x300 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16 display_in">사내 공지사항</h3>
                                <a href="${pageContext.request.contextPath}/admin/board_list?boardNum=999com">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:230px;overflow-y: auto;">
                                <c:choose>
                                	<c:when test="${empty comNoticeList}">
                                		<div class="w_100 center m_t10 font_14">작성된 글이 없습니다.</div>
                                	</c:when>
                                	<c:otherwise>
		                                <c:forEach items="${comNoticeList}" var="comlist">
			                                <div class="one_line bd_b1 p_10">
			                                    <div class="picNcontent flex">
			                                        <div class="one_line_pic m_r10 w_10">
			                                        	<c:choose>
			                                        		<c:when test="${comlist.empPhotoFk eq null}">
			                                        			<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="empPhotoImg">
			                                        		</c:when>
			                                        		<c:otherwise>
			                                        			<!-- (있으면)사진파일 -->
                                        						<img src="${pageContext.request.contextPath}/imgUpload/${comlist.empPhotoFk}" alt="" id="empPhotoImg"/>
			                                        		</c:otherwise>
			                                        	</c:choose>
			                                        </div>
			                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;flex-direction: column;">
			                                            <div class="one_line_type blue font_14 weight_700">
			                                                <c:choose>
			                                                	<c:when test="${comlist.division eq 0}">[일반]</c:when>
																<c:otherwise><span class="red">[공지]</span></c:otherwise>
			                                                </c:choose>
			                                            </div>
			                                            <div class="two_line_title under">
			                                                <a href="${pageContext.request.contextPath}/admin/board_view?boardNum=999sys&aId=${comlist.aId}" class="weight_700 m_r5 subject">${comlist.subject}</a>
			                                            </div>
			                                            <div class="one_line_writer flex space_between w_100">
			                                                <div class="one_line_txt">${comlist.writer}</div>
			                                                <div class="one_line_txt gray">${comlist.regdate}</div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="box_34x300 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16 display_in">문의사항</h3>
                                <a href="${pageContext.request.contextPath}/admin/board_list?boardNum=999QnA">
	                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </a>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:230px;overflow-y:auto;">
                                <c:choose>
                                	<c:when test="${empty QnAList}">
                                		<div class="w_100 center m_t10 font_14">작성된 글이 없습니다.</div>
                                	</c:when>
                                	<c:otherwise>
		                                <c:forEach items="${QnAList}" var="qnalist">
			                                <div class="one_line bd_b1 p_10">
			                                    <div class="picNcontent flex">
			                                        <div class="one_line_pic m_r10 w_10">
			                                        	<c:choose>
			                                        		<c:when test="${qnalist.empPhotoFk eq null}">
			                                        			<img src="${pageContext.request.contextPath}/images/people/user_img_default.jpg" alt="" id="empPhotoImg">
			                                        		</c:when>
			                                        		<c:otherwise>
			                                        			<!-- (있으면)사진파일 -->
                                        						<img src="${pageContext.request.contextPath}/imgUpload/${qnalist.empPhotoFk}" alt="" id="empPhotoImg"/>
			                                        		</c:otherwise>
			                                        	</c:choose>
			                                        </div>
			                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;flex-direction: column;">
			                                            <div class="one_line_type blue font_14 weight_700">
			                                                <c:choose>
			                                                	<c:when test="${qnalist.division eq 0}">[일반]</c:when>
																<c:otherwise><span class="red">[공지]</span></c:otherwise>
			                                                </c:choose>
			                                            </div>
			                                            <div class="two_line_title under">
			                                                <a href="${pageContext.request.contextPath}/admin/board_view?boardNum=999sys&aId=${qnalist.aId}" class="weight_700 m_r5 subject">${qnalist.subject}</a>
			                                            </div>
			                                            <div class="one_line_writer flex space_between w_100">
			                                                <div class="one_line_txt">${qnalist.writer}</div>
			                                                <div class="one_line_txt gray">${qnalist.regdate}</div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="${pageContext.request.contextPath}/js/employee_list.js"></script>
	<script src="${pageContext.request.contextPath}/js/admin_main.js"></script>

	<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>