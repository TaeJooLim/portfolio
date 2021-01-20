<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지 보내기</title>
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
            <h2 class="font_16">쪽지 보내기</h2>
        </div>
            <div class="msg_form w_100">
                <div class="msg_tbl_wrap m_b10">
	                    <table class="font_14 list" style="border-top: 1px solid #ccc;border-bottom: 1px solid #ccc;">
	                        <tr>
	                            <td class="center bg_gray td_20">받는사람</td>
	                            <td class="p_lr10 td_80">
		                           	<div class="search_btn_grp w_100">                    	
		        						<form class="flex space_between flex_vc w_100" method="post" name="" action="${pageContext.request.contextPath}/common/empNameSearch">
			    	                        <input type="text" class="m_r5 p_lr5 input_100" id="words" name="words" value="" placeholder="받는사람의 이름을 입력하시고 검색버튼을 눌러주세요" />
			    	                       	<c:choose>
			    	                       		<c:when test="${empty eList}"></c:when>
				                           		<c:otherwise>
				                           			<select class="sel_100 m_r5" id="msgSendId" name="msgSendId" style="width:200px">
				                           				<option value="0">받는사람을 선택해주세요</option>
				    	                       			<c:forEach items="${eList}" var="elist">
				    	                       				<option value="${elist.empId}">${elist.empDepartmentName} ${elist.empName} ${elist.empPositionName}</option>
				    	                       			</c:forEach>
					                           		</select>
				                           		</c:otherwise>
			                            	</c:choose>
					                        <input type="hidden" id="msgFromId" name="msgFromId" value="${sessionScope.empId}" />
			                            	<div class="td_10">
					                           	<button type="submit" id="serach_btn" class="search_btn td_15"><i class="fas fa-search font_18" style="color: #959595;line-height: 35px;"></i></button>
			                            	</div>
		        						</form>
			                        </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="center bg_gray">제목</td>
	                            <td class="p_lr10 bg_white">
	                                <input type="text" id="msgSubject" class="p_lr5 w_100 input_100" style="border: 1px solid #ccc;" />
	                            </td>
	                        </tr>
	                    </table>
                </div>
                <div class="msg_content_box_wrap w_100">
                    <textarea class="w_100 font_12 p_5" id="msgContent" style="border: 1px solid #ccc;border-collapse: collapse;outline: none; height: 300px;"></textarea>
                </div>
            </div>
            <div class="msg_form_btn_wrap font_14 flex flex_hc m_t15">
	        	<button type="button" id="sendAdminBtn" class="msg_btn p_5 weight_700 m_r5 bg_white">
	                관리자에게 보내기
	            </button>
	        	<button type="button" id="sendMsgBtn" class="msg_btn p_5 weight_700 m_r5 bg_white">
	                쪽지 보내기
	            </button>
	            <input type="button" class="msg_btn p_5 bg_white" onClick="window.close();" value="닫기" />
	        </div>
        
    </div>
</body>
<script>
	function msgSend() {
		var formData = {
			msgSendId : $("#msgSendId option:selected").val(),
			msgFromId : $("#msgFromId").val(),
			msgSubject : $("#msgSubject").val(),
			msgContent : $("#msgContent").val()
		}
		if ($("#msgSendId option:selected").val() == 0) {
			alert("받는사람을 선택해주세요.");
			return false;
		}
		
		if ($("#msgSubject").val().trim() == '') {
			alert("쪽지 제목을 입력해주세요.");
			$("#msgSubject").val('');
			$("#msgSubject").focus();
			return false;
		}
		if ($("#msgContent").val().trim() == '') {
			alert("쪽지 내용을 입력해주세요.");
			$("#msgContent").val('');
			$("#msgContent").focus();
			return false;
		}
		
		$.ajax({
			url		: "${pageContext.request.contextPath}/common/setMessage",
			type	: "post",
			data	: formData,
			success : function(resData) {
						alert("성공적으로 쪽지를 전달했습니다.");
						opener.document.location.href="${pageContext.request.contextPath}/common/message_sendList?empId=${sessionScope.empId}";
						self.close();
			},
			error 	: function() {
						alert("쪽지 보내기 AJAX 장애발생\n관리자에게 문의해주세요.");
			}
		});	
	};

	function msgAdminSend() {
		var formData = {
			msgSendId : "1",
			msgFromId : $("#msgFromId").val(),
			msgSubject : $("#msgSubject").val(),
			msgContent : $("#msgContent").val()
		}

		if ($("#msgSubject").val() == '') {
			alert("쪽지 제목을 입력해주세요.");
			$("#msgSubject").focus();
			return false;
		}
		if ($("#msgContent").val() == '') {
			alert("쪽지 내용을 입력해주세요.");
			$("#msgContent").focus();
			return false;
		}
		
		$.ajax({
			url		: "${pageContext.request.contextPath}/common/setMessage",
			type	: "post",
			data	: formData,
			success : function(resData) {
						alert("성공적으로 쪽지를 전달했습니다.");
						opener.document.location.href="${pageContext.request.contextPath}/common/message_sendList?empId=${sessionScope.empId}";
						self.close();
			},
			error 	: function() {
						alert("쪽지 보내기 AJAX 장애발생\n관리자에게 문의해주세요.");
			}
		});	
	};
	
	$(function() {
		$("#msgSendId").click(function() {
			$("#words").val($("#msgSendId option:selected").html());
		});
		$("#sendMsgBtn").click(function() {
			msgSend();
		});
		$("#sendAdminBtn").click(function() {
			msgAdminSend();
		});
	});
</script>
</html>