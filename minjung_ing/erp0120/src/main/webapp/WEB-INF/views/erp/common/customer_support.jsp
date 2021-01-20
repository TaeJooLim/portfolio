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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.2.0/css/all.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/menu/blue_erp.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <header style="height:92px;">
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
    <section class="" style="height: 610px;padding: 0px 320px 0px 320px;">
    	<div class="main_title" style="border-bottom: 1px solid #ccc; padding-bottom: 5px;">
        	<h5 style="font-size:36px;">1:1 문의</h5>
        	<span style="font-size: 18px; line-height: 1.8;">문의사항을 상세히 기입해 주시면 최선을 다하여 상담해 드리겠습니다.</span>
        </div>
    	<div class="main_content m_t10">
	    	<div class="tbl_wrap flex td_100">
		    	<form class="td_50 m_r10" method="post">
		    		<table class="user_table_list td_100">
		    			<tr>
		    				<td>분류</td>
		    				<td class="p_lr3">1:1 문의사항</td>
		    			</tr>
		    			<tr>
		    				<td>작성자</td>
		    				<td class="p_lr3"><input type="text" id="writer" name="writer" class="input_100" maxlength="20" placeholder="이름을 입력해주세요"/></td>
		    			</tr>
		    			<tr>
		    				<td>제목</td>
		    				<td class="p_lr3"><input type="text" id="subject" name="subject" class="input_100" maxlength="300" placeholder="제목을 입력해주세요"/></td>
		    			</tr>
		    			<tr>
		    				<td>문의내용</td>
		    				<td class="p_lr3 p_t5"><textarea class="input_100" style="height:200px;" id="content" name="content" rows="" cols="" placeholder="내용을 입력해주세요">답변 받으실 이메일주소 : </textarea></td>
		    			</tr>
		    		</table>
    			</form>
	    		<div class="support_manual_wrap td_50">
	    			<div class="" style="height:100%;border: 1px solid #ececec;">
	    				<div class="center p_10" style="border-bottom: 1px solid #ececec;">개인정보 수집 및 이용안내</div>
	    				<div class="p_20">
	    					<div class="">
	    						일대일 문의를 위해서는 아래와 같이 개인정보를 수집, 이용합니다. <br /><br />
	    						1. 개인정보 수집 목적 : 회원관리, 고객상담, 고지사항 전달 <br />
	    						2. 개인정보 수집 항목 : 이름, 이메일 <br />
	    						3. 보유 및 이용기간 : 1달
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    	<div class="reg_btn_wrap center m_t10">
                <button class="btn_blue" type="button" id="regSupportBtn" >등록</button>
	    		<button class="btn_red" type="button" id="reset" onClick="window.location.reload()">새로고침</button>
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
<script>
	function regSupportOne() {
		if($("#writer").val() == '') {
			alert("이름을 입력해주세요.");
			$("#writer").focus();
			return false;
		}
		if($("#subject").val() == '') {
			alert("이름을 입력해주세요.");
			$("#subject").focus();
			return false;
		}

		$.ajax({
			url 		: "/erp/regSupportOne",
			type 		: "post",
			data 		: {writer : $("#writer").val(), subject : $("#subject").val(), content : $("#content").val()},
			success 	: function(resData) {
							alert("작성해주신 문의사항이 등록되었습니다.");
							window.location.reload();
			},
			error 		: function() {
							alert("1:1 문의 입력 AJAX장애발생");
			}
		});
	}
	$("#regSupportBtn").click(function() {
		regSupportOne();
	});
</script>
</html>