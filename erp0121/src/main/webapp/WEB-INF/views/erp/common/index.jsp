<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BLUE ERP SYSTEM</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_page.css">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.2.0/css/all.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/menu/blue_erp.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <header>
        <div class="header_container">
            <div class="header_wrap content_wrap flex page_start">
                <div class="logo">
                  <a href="${pageContext.request.contextPath}">
                      <img src="${pageContext.request.contextPath}/images/main/blue_erp_logo.png">
                  </a>
                </div>
                <div class="navBar">
                	<div id="navi"></div>
	                <ul>
	                	<c:forTokens items="${comWebMenu}" delims=";" var="menu" varStatus="status1">
		                 	<c:forTokens items="${comWebMenuUrl}" delims=";" var="url" varStatus="status2">
		                  		<c:if test="${status1.index eq status2.index}">
		                  			<a href="${pageContext.request.contextPath}/${url}"><li>${menu}</li></a>
		                  		</c:if>
		                	</c:forTokens>
	                	</c:forTokens>
	                </ul>                  	
                </div>
                <div class="loginAndIcons">
                  <a href="${pageContext.request.contextPath}/login">
                  	<div class="loginBtn">ERP SYSTEM 로그인</div>
                  </a>
                </div>
            </div>
        </div>
        
    </header>
    <section class="main">
    	<div class="bg">
	    	<div class="main_text_wrap content_wrap">
	        	<div class="main_text">
		            <div class="top">
		                <h1>${comWebTop}</h1>
		            </div>
		            <div class="bottom">
		                <h3>${comWebBottom}</h3>
		            </div>
		        </div>
	        </div>
	      <div class="main_info ">
	           <div class="content_wrap flex" style="justify-content: space-between">
	            <div class="box">
	              <div class="title">
	                <span>소개</span>
	                    <a href="#"><div class="btn"><i class="fas fa-chevron-right"></i></div></a>
	              </div>
	
	              <div class="subTitle">
	                <div class="textAndPic">
	                  <ul class="" style="width:100%;">
	                  	<c:forTokens items="${comWebMenu}" delims=";" var="menu" varStatus="status1">
				          	<c:forTokens items="${comWebMenuUrl}" delims=";" var="url" varStatus="status2">
				              	<c:if test="${status1.index eq status2.index && status1.index < 2}">
				                	<a href="${pageContext.request.contextPath}/${url}"><li>${menu}</li></a>
				            	</c:if>
				        	</c:forTokens>
			          	</c:forTokens>
	                  </ul>
	                </div>
	              </div>
	            </div>
	
	            <div class="box">
	              <div class="title">
	                <span>링크</span>
	                <a href="#"><div class="btn"><i class="fas fa-chevron-right"></i></div></a>
	              </div>
	              <div class="subTitle">
	                <div class="textAndPic">
	                  <ul class="" style="width:100%;">
	                  	<c:forTokens items="${comWebMenu}" delims=";" var="menu" varStatus="status1">
				          	<c:forTokens items="${comWebMenuUrl}" delims=";" var="url" varStatus="status2">
				              	<c:if test="${status1.index eq status2.index && status1.index > 1 && status1.index < 4}">
				                	<a href="${pageContext.request.contextPath}/${url}"><li>${menu}</li></a>
				            	</c:if>
				        	</c:forTokens>
			          	</c:forTokens>
	                  </ul>
	                </div>
	              </div>
	            </div>
	            <div class="box">
	              <div class="title">
	                <span>고객센터</span>
	                 <a href="#"><div class="btn"><i class="fas fa-chevron-right"></i></div></a>
	              </div>
	
	              <div class="subTitle">
	                <div class="textAndPic">
	                  <ul style="width:100%;">
	                  	<c:forTokens items="${comWebMenu}" delims=";" var="menu" varStatus="status1">
		                 	<c:forTokens items="${comWebMenuUrl}" delims=";" var="url" varStatus="status2">
		                  		<c:if test="${status1.index eq status2.index && status1.index > 3}">
		                  			<a href="${pageContext.request.contextPath}/${url}"><li>${menu}</li></a>
		                  		</c:if>
		                	</c:forTokens>
	                	</c:forTokens>
	                  </ul>
	                </div>
	              </div>
	            </div>
	        </div>
	      </div>
	  </div>
    </section>
    <footer>
      <div class="footer content_wrap flex">
        <div class="com_logo">
          <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/images/main/blue_erp_logo.png"></a>
        </div>
        <div class="com_info" style="line-height: 1.8">
          <span class="address">${comAddress} | TEL. ${comTel} | FAX. ${comFax} </span>
          <ul >  
            <li>사업자등록번호: ${comNum} | 대표자: ${comCeo} </li>
            <li>${comWebCopyright}</li>
          </ul>
        </div>
      </div>
    </footer>
</body>
</html>