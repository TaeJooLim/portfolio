<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<style>
.title{
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: 700;
    color: #3f51b5;
}

.board_list td{
    border: 1px solid #000;
}

.list_title{
	font-weight:700;
	border-bottom:1px solid #000;
	text-align: center;
	background-color: #eee;
	padding : 10px 0px; 
}

.board_name{
	height: 160px;
	padding: 10px 20px;
	line-height: 2;
}

.board_nameOne{
	position: relative;
}

.board_nameOne span{
	position: absolute;
	top: -8%;
	left: 10%;
}

.board_nameOne span i{
	font-size : 12px;
	color: #505050;
}
.boardBtn_wrap{ 
	line-height: 35px;
}
.upBtn{
	margin-right: 5px;
	height: 35px;
	width : 40px;
	font-size: 30px;
	color: #3f51b5;
	cursor: pointer;
	border:1px solid #3f51b5;
	border-radius: 2px;
	text-align: center;
	position: relative;
}
.upBtn i{
	display: inline;
	position: absolute;
	top:3%;
	right: 15%;
}
.downBtn{
	margin-right: 5px;
	height: 35px;
	width : 40px;
	font-size: 30px;
	color: #3f51b5;
	cursor: pointer;
	border:1px solid #3f51b5;
	border-radius: 2px;
	text-align: center;
	position: relative;
}
.downBtn i{
	display: inline;
	position: absolute;
	top: 5%;
	right: 15%;
}
</style>
<div class="page_wrap bg_white noto font_14" >
	<div class="main_right bg_white" style="width: 100%;" >
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">게시판 생성</h2>
                </div>
                <div class="main_right_info " style="padding: 30px 20px;">
                    <div class="">
                        <div class="title">
                            <h3 class="font_18">
                                <i class="fas fa-edit"></i> 게시판관리 > 1. 게시판생성
                            </h3>
                        </div>
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            	각 부서는 <strong>최대 5개</strong>의 게시판을 생성할 수 있습니다.
                        </div>
                        <div class="board_maker">
                            <form method="post" name="boardForm" id="boardForm">
                                <table class="input_list">
                                    <tr class="center">
                                        <td class="bg_gray weight_700 td_10">게시판그룹</td>
                                        <td class="td_15 p_lr3" id="dpartmentOnly">
                                            <select class="boardDepartment sel_100" name="boardDepartment">
                                                <c:forEach items="${dList}" var="dlist">
                                                    <option value="${dlist.empDepartment}" <c:if test="${dlist.empDepartment eq employee.empDepartment}"> selected </c:if>>${dlist.empDepartmentName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">게시판코드</td>
                                        <td class="td_15 p_lr3">
                                            <input onblur="chkBoard();" name="boardCode" id="boardCode" type="text" class="input_100" placeholder="영어로 입력" maxlength="10"/>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">게시판공개</td>
                                        <td class="td_15 p_lr3">
                                            <select class="sel_100" name="boardOpen" id="boardOpen">
                                                <option value="0">공개</option>
                                                <option value="1">비공개</option>
                                            </select>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">게시판 관리자</td>
                                        <td class="td_15 p_lr3">
                                        	<input type="text" class="input_100" name="boardManager" id="boardManager" value="${sessionScope.empName}" maxlength="10" readonly/>
                                        </td>
                                    </tr>
                                    <tr class="center">
                                        <td class="bg_gray weight_700 td_10">게시판제목</td>
                                        <td colspan="5" class="td_90 p_lr3">
                                            <input type="text" name="boardName" id="boardName" required class="input_100" maxlength="20"/>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">게시판타입</td>
                                        <td class="td_90 p_lr3">
                                            <select class="sel_100" name="boardType">
                                                <option value="일반">일반 게시판</option>
                                                <option value="공지사항">공지사항 게시판</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class="center">
                                        <td class="bg_gray weight_700 td_10">읽기권한</td>
                                        <td class="td_15 p_lr3">
                                            <select class="sel_100" name="boardRead">
                                                <option value="0">전체 직원</option>
                                                <option value="1">부원</option>
                                            </select>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">쓰기권한</td>
                                        <td class="td_15 p_lr3">
                                            <select class="sel_100" name="boardWrite">
                                                <option value="0">전체 직원</option>
                                                <option value="1">부원</option>
                                            </select>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">댓글권한</td>
                                        <td class="td_15 p_lr3">
                                            <select class="sel_100" name="boardComment">
                                                <option value="0">전체 직원</option>
                                                <option value="1">부원</option>
                                            </select>
                                        </td>
                                        <td class="bg_gray weight_700 td_10">다운권한</td>
                                        <td class="td_15 p_lr3">
                                            <select class="sel_100" name="boardDown">
                                                <option value="0">전체 직원</option>
                                                <option value="1">부원</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="btn_grp center m_t10">
                                	<button class="btn_blue" type="button" id="boardUpdateBtn">게시판수정</button>
                                    <button class="btn_blue" type="button" id="boardRegbtn">게시판생성</button>
                                    <button class="btn_ivory" type="reset" id="reset">취소하기</button>
                                </div>
                            </form>
                        </div>
                        <div class="title">
                            <h3 class="font_18 m_t20">
                                <i class="fas fa-edit"></i> 게시판관리 > 2. 게시판관리
                            </h3>
                        </div>
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                           	 게시판 수정과 이동은 <strong>하나</strong>의 게시판만 선택이 가능합니다.
                        </div>
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            <strong>게시판 이름</strong>을 선택하시면 해당 게시판으로 이동합니다.
                        </div>
                        <div class="flex space_between m_b10">
                            <div class="boardBtn_wrap flex">
                                <div class="upBtn"><i class="fas fa-chevron-up" onclick="boardMovebtn('up');"></i></div>
                                <div class="downBtn"><i class="fas fa-chevron-down" onclick="boardMovebtn('down');"></i></div>
                            </div>
                            <div class="">
                            	<button class="btn_blue" id="boardUp">선택수정</button>
                                <button class="btn_red" id="deleteAll">선택삭제</button>
                            </div>
                        </div>
                        <div class="m_tb10">
                            <div class="">
                                <table class="board_list">
                                <tr>
                                <c:forEach items="${dList}" var="dlist" varStatus="status">
                                	<c:if test="${status.index %5==0 && status.index >=1}">
                                	</tr><tr>
                                	</c:if>
	                                		<td class="td_20">
		                                		<div class="list_title">${dlist.empDepartmentName} 게시판</div>
		                                		<div class="board_name">
			                                		<c:forEach items="${blist}" var="blist">
				                                    	<c:if test="${blist.boardDepartment eq dlist.empDepartment}">
				                                    		<div class="board_nameOne">
					                                       	<input type="checkbox" name="chk" class="chk" id="chk" value="${blist.boardMove}" data-uid="${blist.boardId}" />
					                                       	<span>
						                                       	<a href="${pageContext.request.contextPath}/admin/board_list?boardNum=${blist.boardNum}">${blist.boardName}</a>
						                                       	<c:if test="${blist.boardOpen eq '0'}"><i class="fas fa-lock-open"></i></c:if>
						                                       	<c:if test="${blist.boardOpen eq '1'}"><i class="fas fa-lock"></i></c:if>
					                                       	</span>
					                                       	</br>
					                                       	</div>
				                                    	</c:if>
			                                    	</c:forEach>
		                                    	</div>
	                                    	</td>
                                	</c:forEach> 
                                	</tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
       </div>	
</div>
<script>
$(function () {
	$("#boardCode").keyup(function () {
		$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
	});

	$("#boardUpdateBtn").hide();
});

$("#boardRegbtn").click(function() {
	boardReg();
});

$("#boardUpdateBtn").click(function() {
	boardUpdateBtn();
});


function boardReg() {
	if( $.trim($("#boardCode").val()) == '' ) {
		alert("게시판 코드를 입력하세요.");
		$("#boardCode").focus();
		return false;
	}
	
	if( $.trim($("#boardName").val()) == '' ) {
		alert("게시판 제목을 입력하세요.");
		$("#boardName").focus();
		return false;
	}
	
	$.ajax({
		url		: "${pageContext.request.contextPath}/admin/board_reg_insert",
		type	: "POST",
		data	: $("#boardForm").serialize(),
		success	: function(resData) {
			if(resData == "failure"){
        		alert("해당 부서의 게시판은 더 이상 생성할 수 없습니다.");
			}else{
			alert( $("#boardName").val() + "게시판 & 댓글게시판이 생성되었습니다.");
			}
			window.location.href = 	"${pageContext.request.contextPath}/admin/board_reg";
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
};

function chkBoard(){
	var formData = {
			boardCode : $("#boardCode").val(),
			boardDepartment : $("select[name=boardDepartment]").val()
		};
	$.ajax({
    	url 	: "${pageContext.request.contextPath}/admin/board_reg_check",
    	type 	: "POST", 	
    	data 	: formData,
    	success	: function (resData) {
    		if( resData == "failure" ) {
        		alert("중복된 게시판 코드입니다.");
        		$("#boardCode").val("");
        		$("#boardCode").focus();
            }
        },
        error 	: function() {
        	alert("선택하신 정보가 없습니다.");
        }
    });
};

function boardUpdateBtn() {
	
	if( $.trim($("#boardName").val()) == '' ) {
		alert("게시판 제목을 입력하세요.");
		$("#boardName").focus();
		return false;
	}
	$.ajax({
		url		: "${pageContext.request.contextPath}/admin/board_reg_update",
		type	: "POST",
		data	: $("#boardForm").serialize(),
		success	: function(resData) {
			 alert($("#boardName").val() + "게시판 & 댓글게시판이 수정되었습니다.");
			 window.location.reload();
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
};

$("#deleteAll").click(function() {
    var str = confirm("선택하신 게시판 삭제하시겠습니까?");
    
    if( str ) {
        var chkArr = new Array();
        $(".chk:checked").each(function () {
        	chkArr.push($(this).attr("data-uid"));
        });
            
        $.ajax({
        	url 	: "${pageContext.request.contextPath}/admin/board_reg_delete",
        	type 	: "POST", 	
        	data 	: { chkArr : chkArr },
        	success	: function (resData) {
        		alert("삭제되었습니다.");
	    		window.location.reload();
            },
            error 	: function() {
            	alert("선택하신 정보가 없습니다.");
            }
        });
    }
});

$("#boardUp").click(function() {
        var chkArr = new Array();
        $(".chk:checked").each(function () {
        	chkArr.push($(this).attr("data-uid"));
        });
        if(chkArr.length > 1){
			alert("한개의 게시판만 선택해주세요.");
			return false;
        };
        
        
        $("#dpartmentOnly input").remove();
        $("#boardCode").attr("readonly",true);
        $(".boardDepartment").remove();
        $("#boardRegbtn").remove();
        $("#reset").remove();
        $("#boardUpdateBtn").show();
        $(".btn_grp").append('<button class="btn_ivory" type="reset" onClick="window.location.reload()">수정취소</button>');
        $(".btn_grp").append('<input type="hidden" id="boardId" name="boardId"/>');
        $(".btn_grp").append('<input type="hidden" id="boardNum" name="boardNum"/>');
        $(".btn_grp").append('<input type="hidden" id="boardMove" name="boardMove"/>');
        $(".btn_grp").append('<input type="hidden" class="boardDepartment" name="boardDepartment"/>');
        $("#dpartmentOnly").append('<input type="text" id="boardDepartmentName" readonly class="input_100" maxlength="20"/>');


        $.ajax({
        	url 	: "${pageContext.request.contextPath}/admin/board_reg_update_view",
        	type 	: "POST", 	
        	data 	: { chkArr : chkArr },
        	success	: function (resData) {
        		$('#boardId').val(resData.boardId);
        		$('.boardDepartment').val(resData.boardDepartment);
        		$('#boardCode').val(resData.boardCode);
        		$('#boardNum').val(resData.boardNum);
        		$('#boardOpen').val(resData.boardOpen);
        		$('#boardManager').val(resData.boardManager);
        		$('#boardName').val(resData.boardName);
        		$('#boardType').val(resData.boardType);
        		$('#boardRead').val(resData.boardRead);
        		$('#boardWrite').val(resData.boardWrite);
        		$('#boardComment').val(resData.boardComment);
        		$('#boardDown').val(resData.boardDown);
        		$('#boardMove').val(resData.boardMove);
        		$('#boardDepartmentName').val(resData.boardDepartmentName);
            },
            error 	: function() {
            	alert("선택하신 정보가 없습니다.");
            }
        });

});

function boardMovebtn(move){
	var boardMove = $("input:checkbox[name='chk']:checked").val();
	var chkArr = new Array();
    $(".chk:checked").each(function () {
    	chkArr.push($(this).attr("data-uid"));
    });
    
    if(chkArr.length > 1){
		alert("한개의 게시판만 선택해주세요.");
		return false;
    };
    if(boardMove.charAt(boardMove.length-1) == 1 && move == 'up'){
		alert("더이상 이동할 수없습니다.");
		window.location.reload();
		return false;
    };
    $.ajax({
    	url 	: "${pageContext.request.contextPath}/admin/board_reg_move",
    	type 	: "POST", 	
    	data 	: { chkArr : chkArr, boardMove : boardMove, move : move},
    	success	: function (resData) {
        	if(resData == "failure"){
        		alert("더이상 이동할 수없습니다.");
            	};
    		window.location.href = 	"${pageContext.request.contextPath}/admin/board_reg";
        },
        error 	: function() {
        	alert("선택하신 정보가 없습니다.");
        }
    });
}
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>