<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<body>
	<%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
        <%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
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
                                        <img src="${pageContext.request.contextPath}/images/idPhoto.png" alt="">
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
                                        <img src="${pageContext.request.contextPath}/images/idPhoto.png" alt="">
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
                            <a href="${pageContext.request.contextPath}/attendStatus">
                                <h3 class="title">근태 관리</h3>
                            </a>    
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
                        <a href="${pageContext.request.contextPath}/approval_main" target="_blank">
                            <h3 class="title">결재 대기 문서</h3>
                        </a>
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
        </div>
    </main>
</body>
</html>