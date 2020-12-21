<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headNmenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<script src="${pageContext.request.contextPath}/js/menu.js"></script>
<c:if test="${sessionScope.memID == null}">
	<script>
		alert("등록된 사용자가 아닙니다.\n관리자에게 문의하세요");
		window.location.href="${pageContext.request.contextPath}/login";
	</script>
</c:if>
<c:if test="${sessionScope.memConfirm == N}">
	<script>
		alert("승인되지 않은 사용자입니다.\n관리자에게 문의하세요.");
		location.href="${pageContext.request.contextPath}/login";
	</script>
</c:if>
<body>
    <header>
        <div class="logo">
            <a href="${pageContext.request.contextPath}/userhome">
                <i class="fab fa-digg"></i>
            </a>
        </div>

        <div class="info">
            <div class="userInfo">
                <div class="userPic">
                    <img src="images/idPhoto.png">
                </div>
            </div>
            <div class="userInfo_detail">
            	<div class="flex" style="flex-direction:column;">
            		<div>
	                	<span class="memBuseoName">${sessionScope.memBuseoName}</span>
	                	<span class="memGradeName">${sessionScope.memGradeName}</span>
	                </div>
	                <div>
	                	<span class="memNum">${sessionScope.memNum}</span>
		                <span class="memName">${sessionScope.memName}</span>
		            </div>
	            </div>
                <span class="detail-btn">
                    <i class="fas fa-caret-down">
                        <ul class="changeStatus">
                            <li class="logout font14" style="border-bottom:1px solid #ccc;" 
                            onclick="location.href='${pageContext.request.contextPath}/logout'">
                                <i class="fas fa-power-off"></i>
                                <p style="display: inline-block;">로그아웃</p>
                            </li>
                            <li class="changePage font14" 
                            onclick="location.href='${pageContext.request.contextPath}/adminhome'">
                                <i class="fas fa-user-cog"></i>
                                <p>관리자페이지</p>
                            </li>
                        </ul>
                    </i>
                </span>
            </div>
        </div>
    </header>

    <main>
        <div class="menu-wrap">
            <ul>
                <li class="menu">임시메뉴
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/adminhome">관리자페이지로</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="mainContent">
            <div class="h-dashboard">
                <div class="h-dash-top flex flex-justify m-b10">
                    <div class="h-dash-t-left">
                        <div class="h-dash-deptNotice p10 bg-white">
                            <h3 class="title">최근 부서내&전사 공지사항</h3>
                            <div class="h-dash-content flex flex-justify p-tb10" style="border-bottom:1px solid #eee;">
                                <div class="h-dash-content-top">
                                    <div class="dept-icon">
                                        <img src="images/idPhoto.png" alt="">
                                    </div>
                                    <div class="dept-notice" style="display: inline-block;">
                                        <p class="font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.</p>
                                        <p class="font14">09-15 09:53 김그린 과장</p>
                                    </div>
                                </div>
                                <div class="content-right" style="width:50px;">
                                    <span style="font-size:24px; color:#555;"><i class="fas fa-angle-right"></i></span>
                                </div>
                            </div>

                            <div class="h-dash-content flex flex-justify p-tb10" style="border-bottom:1px solid #eee;">
                                <div class="h-dash-content-top">
                                    <div class="dept-icon">
                                        <img src="images/idPhoto.png" alt="">
                                    </div>
                                    <div class="dept-notice" style="display: inline-block;">
                                        <p class="font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.</p>
                                        <p class="font14">09-15 09:53 김그린 과장</p>
                                    </div>
                                </div>
                                <div class="content-right" style="width:50px;">
                                    <span style="font-size:24px; color:#555;"><i class="fas fa-angle-right"></i></span>
                                </div>
                            </div>

                            <div class="h-dash-content flex flex-justify p-tb10" style="border-bottom:1px solid #eee;">
                                <div class="h-dash-content-top">
                                    <div class="dept-icon">
                                        <img src="images/idPhoto.png" alt="">
                                    </div>
                                    <div class="dept-notice" style="display: inline-block;">
                                        <p class="font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.</p>
                                        <p class="font14">09-15 09:53 김그린 과장</p>
                                    </div>
                                </div>
                                <div class="content-right" style="width:50px;">
                                    <span style="font-size:24px; color:#555;"><i class="fas fa-angle-right"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="h-dash-t-right" style="height:100%;"> 
                        <div class="h-dash-attend p10 bg-white m-b10">
                            <h3 class="title">근태 관리</h3>
                            <div class="h-dash-content">
                                <p class="p-b10">2020년 9월 15일</p>
                                <div class="attend flex flex-justify font14 weight700 m-t20">
                                    <span>출근시간</span>
                                    <span>AM 08:55</span>
                                </div>
                                <div class="attend flex flex-justify font14 weight700 m-t10">
                                    <span>퇴근시간</span>
                                    <span>PM 18:03</span>
                                </div>
                                <div class="attend flex flex-justify font14 weight700 m-t10">
                                    <span>현재상태</span>
                                    <span>
                                        <select class="sel-attend">
                                            <option value="">업무중</option>
                                            <option value="">외근중</option>
                                            <option value="">퇴근</option>
                                        </select>
                                    </span>
                                </div>
                                <div class="attend flex flex-justify noto font14 weight700 m-t10">
                                    <button class="font14 weight700 attend-btn-on">출근하기</button>
                                    <button class="font14 weight700 attend-btn-off">퇴근하기</button>
                                </div>
                            </div>
                        </div>
                        <div class="h-dash-mail p10 bg-white">
                            <h3 class="title">메일 관리</h3>
                            <div class="h-dash-content">
                                <div class="mail-list flex flex-justify weight700 font14" style="border-bottom:1px solid #e7e7e7; padding-bottom: 10px;">
                                    <div class="mail-sender" style="width:15%;">보낸사람</div>
                                    <div class="mail-subject center" style="width:70%;">제목</div>
                                    <div class="mail-date" style="width:15%;">날짜</div>
                                </div>
                                <!-- <div class="center p-tb10">
                                    <span class="font14 weight700">메일함이 비어있습니다.</span>
                                </div> -->
                                <table>
                                    <tr>
                                        <td style="width:15%;">인사팀</td>
                                        <td style="width:70%;" style="overflow: hidden;">[요청]금일16시 이전까지 증명서 제출바랍니다.</td>
                                        <td style="width:15%;">2020.09.14</td>
                                    </tr>
                                    <tr>
                                        <td>사람인</td>
                                        <td>[마감임박]최근 김대리님의 활동 분석으로 (주)삼삼소프트 채용 공고가 매칭되었습니다.</td>
                                        <td>2020.09.02</td>
                                    </tr>
                                    <tr>
                                        <td>인사팀</td>
                                        <td>[설문]현재 진행중인 '구내식당 업체선정'설문이 오늘 마감입니다.</td>
                                        <td>2020.08.28</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div> 
                </div>
                <div class="h-dash-bottom flex flex-justify">
                    <div class="h-dash-app p10 bg-white">
                        <h3 class="title">결재 대기 문서</h3>
                        <div class="h-dash-content">
                            <div class="app-list flex flex-justify weight700 font14" style="border-bottom:1px solid #e7e7e7; padding-bottom: 10px;">
                                <div class="app-date" style="width:10%;">기안일</div>
                                <div class="app-form" style="width:10%;">문서양식</div>
                                <div class="app-subject center" style="width:70%;">결재문서제목</div>
                                <div class="app-file" style="width:10%;">첨부</div>
                            </div>
                            <div class="center p-tb10">
                                <span class="font14 weight700">결재할 문서가 없습니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="h-dash-alarm p10 bg-white">
                        <h3 class="title">변경사항 알림</h3>
                        <div class="h-dash-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="alarm center p20" style="width:49%;">
                                <i class="fas fa-user-plus" style="font-size:40px"></i>
                                <p style="font-size:12px;">사용자 승인 요청</p>                                
                            </div>
                            <div class="alarm center p20" style="width:49%;">
                                <i class="fas fa-tools" style="font-size:40px"></i>
                                <p style="font-size:12px;">작업 요청</p>                                
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </main>
</body>
</html>