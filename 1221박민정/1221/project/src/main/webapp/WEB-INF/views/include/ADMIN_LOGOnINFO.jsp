<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
    <div class="logo">
        <a href="${pageContext.request.contextPath}/adminhome">
            <i class="fab fa-digg"></i>
            <span class="logo-admin">Adminator</span>
        </a>
    </div>

    <div class="info">
        <div class="userInfo">
            <div class="userPic">
                <img src="${pageContext.request.contextPath}/images/idPhoto.png">
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
                        onclick="location.href='${pageContext.request.contextPath}/userhome'">
                            <i class="fas fa-user-cog"></i>
                            <p>사용자페이지</p>
                        </li>
                    </ul>
                </i>
            </span>
        </div>
    </div>
</header>