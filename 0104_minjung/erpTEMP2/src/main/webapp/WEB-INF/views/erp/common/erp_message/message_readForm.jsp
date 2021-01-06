<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지 읽기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

    <!-- FontAweSome -->
    <script src="https://kit.fontawesome.com/5990def7eb.js" crossorigin="anonymous"></script>
    <!-- FontAweSome -->

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->

</head>
<style>
    .message_box_wrap {
        width: 500px;
        height: 400px auto;
    }
    .msg_btn {
        cursor: pointer;
        border: 1px solid #ccc;
    }
</style>

<body>
    <div class="message_box_wrap noto p_20" style="border: 1px solid #ccc">
        <div class="msg_title w_100 m_b20">
            <h2 class="font_16">쪽지 읽기</h2>
        </div>
            <div class="msg_form w_100">
                <div class="msg_tbl_wrap m_b10">
	                    <table class="font_14 list" style="border-top: 1px solid #ccc;border-bottom: 1px solid #ccc;">
	                        <tr>
	                            <td class="center bg_gray td_20">
	                            	<c:choose>
	                            		<c:when test="${typeChk == 1}">보낸사람</c:when>
	                            		<c:otherwise>받는사람</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td class="p_lr10 td_80">
	                            	<div class="w_100 left">
	                            		${msgvo.empDepartmentName} ${msgvo.empName} ${msgvo.empPositionName}
		                            </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="center bg_gray">제목</td>
	                            <td class="p_lr10 bg_white">
	                                <div class="w_100 left">${msgvo.msgSubject}</div>
	                            </td>
	                        </tr>
	                    </table>
                </div>
                <div class="msg_content_box_wrap w_100">
                	<div class="p_5 w_100" style="border: 1px solid #ccc;height: 300px">${msgvo.msgContent}</div>
                </div>
            </div>
            <div class="msg_form_btn_wrap font_12 flex flex_hc m_t20">
	            <input type="button" class="msg_btn p_5 bg_white" onClick="window.close();" value="닫기" />
	        </div>
        
    </div>
</body>
<script>
</script>
</html>