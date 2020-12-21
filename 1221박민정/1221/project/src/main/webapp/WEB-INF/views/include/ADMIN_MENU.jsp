<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="menu-wrap">
    <ul>
        <li class="menu">사용자 관리
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/member/memberList">사용자 목록</a></li>
                <li><a href="${pageContext.request.contextPath}/member/memberInsert">사용자 등록</a></li>
                <li><a href="${pageContext.request.contextPath}/member/memberApplicant">사용자 신청 목록</a></li>
                <li><a href="${pageContext.request.contextPath}/member/orgChart_manage">조직도 관리</a></li>
                <li><a href="${pageContext.request.contextPath}/member/orgChart">조직도</a></li>
            </ul>
        </li>
        <li class="menu">전자결재
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/approval_main" target="_blank">전자결재시스템</a></li>
            </ul>
        </li>
        <li class="menu">게시판
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/board/boardList">게시판목록</a></li>
            </ul>
        </li>
        <li class="menu">일정관리
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/calendar">일정목록</a></li>
            </ul>
        </li>
        <li class="menu">근태관리
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/attendStatus">내 근태현황</a></li>
            </ul>
        </li>
        <li class="menu">설문조사
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/surveyOpen">진행중인 설문</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/surveyClose">종료된 설문</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/surveyMine">내가 만든 설문</a></li>
            </ul>
        </li>
        
        <li class="menu">자료실
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/fileList">문서양식</a></li>
            </ul>
        </li>

        <li class="menu">회사정보
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/companyInfo">회사기본정보</a></li>
            </ul>
        </li>

        <li class="menu">환경설정
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/adminList">관리자 목록</a></li>
                <li><a href="${pageContext.request.contextPath}/menuSetting">메뉴 설정</a></li>
            </ul>
        </li>
    </ul>
</div>