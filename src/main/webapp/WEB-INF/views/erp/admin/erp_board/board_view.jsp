<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_view.css">
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<style>

</style>
<div class="page_wrap bg_white noto font_14">
	<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">사내 게시판</h2>
                </div>
                <div class="main_right_info flex p_10">
                    <div class="board_left">
                        
                        <div class="board_nameList">
                        <c:forEach items="${dList}" var="dlist" varStatus="status">
                       <ul>
	                        	<span class="weight_700 font_16">${dlist.empDepartmentName} 게시판</span>
			                        	<c:set var="title" value="1"></c:set>
	                        	<c:forEach items="${blist}" var="blist">
			                        	<c:if test="${blist.boardDepartment eq dlist.empDepartment}">
			                        	<c:set var="title" value="${title+1}"></c:set>
			                        		<li>&nbsp; <i class="fas fa-edit"></i> &nbsp;<a href="${pageContext.request.contextPath}/admin/board_list?boardNum=${blist.boardNum}">${blist.boardName}</a></li>
			                        	</c:if>
	                            </c:forEach>
	                            <c:if test="${title == 1}">
	                            <li>게시판이 생성되지 않았습니다.</li>
	                            </c:if>
	                        </ul>
                        </c:forEach>
                        </div>
                    </div>
                  	<div class="board_right">
                        <div class="board_right_info">
                            <div class="table_title">
                                <i class="fas fa-chalkboard"></i>
                               		${bvo.boardDepartmentName} ${bvo.boardName} 게시판
                            </div>
                        </div>
                        <div class="flex space_between m_b10">
                            <div class="">
                                
                                <button class="btn_blue">수정</button>
                                <button class="btn_red">삭제</button>
                            </div>
                            <div class="">
                                <button class="btn_write" type="button" onClick="location.href='${pageContext.request.contextPath}/admin/board_list?boardNum=${boardNum}'">목록</button>
                            </div>
                        </div>
                        <div class="">
                            <table class="input_list">
                                <tr>
                                    <td class="td_10 center weight_700 bg_gray">게시글 분류</td>
                                    <td class="p_lr3 td_10">
                                    ${avo.division}
                                    </td>
                                    <td class="td_10 center weight_700 bg_gray">근무부서</td>
                                    <td class="p_lr3 td_30">
                                    ${avo.empDepartNameFk}
                                    </td>
                                    <td class="td-10 center weight_700 bg_gray">작성일</td>
                                    <td class="p_lr3">
                                    ${avo.regdate}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-10 center weight_700 bg_gray">게시글 작성자</td>
                                    <td colspan="3" class="p_lr3" style="text-align:left;">
                                     <strong>${avo.writer}</strong>
                                    </td>
                                    <td class="td-10 center weight_700 bg_gray white_s_no">비밀글</td>
                                    <td class="p_lr3">
                                      <c:if test="${avo.secret eq '0'}">공개</c:if>
                                      <c:if test="${avo.secret eq '1'}">비공개</c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-10 center weight_700 bg_gray">게시글 제목</td>
                                    <td colspan="5" class="p_lr3"style="text-align:left;">
                                     <strong>${avo.subject}</strong>
                                    </td>
                                </tr>
                                <tr>
                                 <td class="td-10 center weight_700 bg_gray">게시글 내용</td>
                                 <td colspan="5" class="content" style="text-align:left;">
                                    	${avo.content}
                                 </td>
                             </tr>
                             <tr>
                                 <td class="td-10 center weight_700 bg_gray">첨부파일</td>
                                 <td colspan="3" class="p_lr5 font_18" >
                                   <c:if test="${!avo.fileName eq ''}"><i class="fas fa-file-powerpoint"></i></c:if>
                                   <c:if test="${avo.fileName eq ''}"> - </c:if>
                                 </td>
                                 <td class="td-10 center weight_700 bg_gray">게시물조회수</td>
                                 <td class="p_lr3">
                                     ${avo.hit}
                                 </td>
                             </tr>
                            </table>
                        </div>
                        <div class="m_t10">
                            <div class="p_b5" style="border-bottom: 1px solid #ccc;">
                                <i class="fas fa-comment-dots"></i>
                                <span> 댓글 <strong>${avo.commentHit}</strong></span>
                            </div>
                            <div class="">
                               	<c:forEach var="clist" items="${clist}">
                               		<div class="comment" id="comment_${clist.cId}">
	                                    <div class="flex space_between">
	                                    	<div class="flex">
	                                    	<c:forEach begin="1" end="${clist.reLevel}"><i class="fas fa-reply-all font_18 m_l10"></i></c:forEach>
		                                        <div class="weight_700 m_r10 p_l10">
		                                            ${clist.comEmpDartName} ${clist.who}
		                                        </div>
		                                        <div class="comment_date">
		                                            ${clist.reRegdate}
		                                        </div>
		                                    </div> 
		                                    <div class="p_r10" >
	                                            <a onClick="reComment('${clist.cId}','${clist.aIdFk}','${clist.comEmpDartName}','${clist.who}','${clist.ref}','${clist.reStep}');" href="#">답글</a> &nbsp; 
	                                            <a onClick="changeComment('${clist.cId}','${clist.who}','${clist.comment}','${clist.aIdFk}');" href="#">수정</a> &nbsp; 
	                                            <a onClick="return commentDel();" href="${pageContext.request.contextPath}/admin/board_comment_delete?boardNum=${boardNum}&aIdFk=${clist.aIdFk}&cId=${clist.cId}">삭제</a>
	                                        </div>   
	                                    </div>
	                                    <div class="p_l10">
	                                    	<span style="white-space: pre-line; ">${clist.comment}</span>
	                                    </div>
	                                    <input type="hidden" id="cId" name="cId" value="${clist.cId}"/>
                                    </div>
                                    <div class="reComment_area_${clist.cId}" id="reComment_area_${clist.cId}"></div>
                             	</c:forEach>
                            </div>
                            <form id="commentForm" name="commentForm" action="">
                            <div class="comment_box" style="height: 180px;">
                                <div class="weight_700 m_b3">${sessionScope.empDepartmentName} ${sessionScope.empName}</div>
                                <div class=""> 
                                    <textarea id="comment" name="comment" style="border: none; width: 100%; height: 100px;"
										placeholder="댓글 내용을 입력하세요." class="p_10 noto font16"></textarea> 
                                    <input id="who" name="who" type="hidden" value="${sessionScope.empName}" />  
                                    <input id="aIdFk" name="aIdFk" type="hidden" value="${avo.aId}" />  
                                    <input id="boardNum" name="boardNum" type="hidden" value="${boardNum}" />  
                                    <input id="reEmpIdFk" name="reEmpIdFk" type="hidden" value="${sessionScope.empId}" />  
                                </div>
                                <div class="float_r">
                                    <button class="btn_write" id="commentRegBtn" type="button">등록</button>
                                </div>
                            </div>
                            </form>
                            <div class="clearfix"></div>   
                        </div>                        
                    </div>
                </div>
            </div>
</div>
<script>
function commentDel(){
	return confirm("삭제하시겠습니까?");
}

$("#commentRegBtn").click(function(){

	if ($("#comment").val() == '') {
		alert("댓글 내용을 입력하세요.");
		$("#comment").focus();
		return false;
	};

	var formData = $("#commentForm").serialize(); 

	$.ajax({
				url : "${pageContext.request.contextPath}/admin/board_comment",
				type : "POST",
				data : formData,
				success : function(resData) {
					alert("댓글이 등록 되었습니다.");
					location.reload();
				},

				error : function() {
					alert("관리자에게 문의하세요.");
				},

				complete : function() {
				}

			});
});

function changeComment(cId,who,comment,aIdFk) {
	
	var a = '';
	a += '<form id="commentUpForm" name="commentUpForm" action="${pageContext.request.contextPath}/admin/board_comment_update">';
	a += '<div class="comment_box" style="height: 180px;">';
	a += '<div class="weight_700 m_b3">${sessionScope.empDepartmentName} ${sessionScope.empName}</div>';
	a += '<div class=""> ';
	a += '    <textarea id="comment" name="comment" style="border: none; width: 100%; height: 80px;"';
	a += '		 class="p_10 noto font16">'+comment+'</textarea> ';
	a += '     <input id="who" name="who" type="hidden" value="'+who+'" />  ';
	a += '     <input id="aIdFk" name="aIdFk" type="hidden" value="'+ aIdFk +'" />  ';
	a += '     <input id="cId" name="cId" type="hidden" value="'+cId+'" />  ';
	a += '     <input id="boardNum" name="boardNum" type="hidden" value="${boardNum}" />  ';
	a += '     <input id="reEmpIdFk" name="reEmpIdFk" type="hidden" value="${sessionScope.empId}" />  ';
	a += ' </div>';
	a += '  <div class="float_r">';
	a += '      <button class="btn_write" id="commenUpdate" type="submit">수정</button>';
	a += '  </div>';
	a += '</div>';
	a += '</form>';
	$("#comment_" + cId).html(a); 

	/* $('html').click(function(e) { 
		if(!$(e.target).hasClass("area")) { 
			alert('영역 밖입니다.'); 
		} 
		}); */
};

function reComment(cId,aIdFk,comEmpDartName,who,ref,reStep) {
	var a = '';
	a += '<form id="" name="" action="${pageContext.request.contextPath}/admin/board_comment_reply">';
	a += '<div class="comment_box" style="height: 160px;">';
	a += '<i class="fas fa-share"></i> <span class=""><strong> TO </strong> '+comEmpDartName+' '+who+'</span>';
	a += '<div class="weight_700 m_b3">${sessionScope.empDepartmentName} ${sessionScope.empName}</div>';
	a += '<div class=""> ';
	a += '    <textarea id="comment" name="comment" style="border: none; width: 100%; height: 60px;"';
	a += '		 class="p_10 noto font16"></textarea> ';
	a += '     <input id="ref" name="ref" type="hidden" value="'+ ref +'" />  ';
	a += '     <input id="who" name="who" type="hidden" value="${sessionScope.empName}" />  ';
	a += '     <input id="reStep" name="reStep" type="hidden" value="'+ reStep +'" />  ';
	a += '     <input id="aIdFk" name="aIdFk" type="hidden" value="'+ aIdFk +'" />  ';
	a += '     <input id="cId" name="cId" type="hidden" value="'+cId+'" />  ';
	a += '     <input id="boardNum" name="boardNum" type="hidden" value="${boardNum}" />  ';
	a += '     <input id="reEmpIdFk" name="reEmpIdFk" type="hidden" value="${sessionScope.empId}" />  ';
	a += ' </div>';
	a += '  <div class="float_r">';
	a += '      <button class="btn_write" id="commentRe" type="submit">답글</button>';
	a += '  </div>';
	a += '</div>';
	a += '</form>';
	$("#reComment_area_" + cId).html(a); 
	
}


</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>