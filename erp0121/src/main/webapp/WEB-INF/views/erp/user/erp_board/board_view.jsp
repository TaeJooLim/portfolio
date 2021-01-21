<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_view.css">
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empAuth < 10 && bvo.boardRead eq 1 && sessionScope.empDepartment ne bvo.boardDepartment}">
	<script>
		alert("해당 부원만 접근 가능합니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
<!-- 공개/비공개 처리 -->
<c:if
   test="${sessionScope.empAuth < 10 && avo.secret eq 1 && sessionScope.empId ne avo.empIdFk}">
   <script>
      alert("이 게시글은 비공개입니다.");
      history.go(-1);
   </script>
</c:if>
<!-- 공개/비공개 처리 -->
<!-- 댓글, 다운 권한  처리-->
<input type="hidden" id="chkAuth" value="${sessionScope.empAuth}"/>
<input type="hidden" id="chkDepart" value="${sessionScope.empDepartment}"/>
<input type="hidden" id="chkBdepart" value="${bvo.boardDepartment}"/>
<input type="hidden" id="chkComment" value="${bvo.boardComment}"/>
<input type="hidden" id="chkDown" value="${bvo.boardDown}"/>
<!-- 댓글, 다운 권한  처리-->
<div class="page_wrap bg_white noto font_14">
	<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">게시판관리<i class="fas fa-chevron-right p_lr10"></i>3. 게시글보기</h2>
                </div>
                <div class="main_right_info flex">
                    <div class="board_left p_20">
                        <div class="table_wrap_box">
                        <div class="board_nameList m_b30">
                        <c:forEach items="${dList}" var="dlist" varStatus="status">
                       		<ul>
	                        	<span class="weight_700 font_16">${dlist.empDepartmentName} 게시판</span>
			                    <c:set var="title" value="1"></c:set>
	                        	<c:forEach items="${blist}" var="blist">
			                        	<c:if test="${blist.boardDepartment eq dlist.empDepartment}">
			                        	<c:set var="title" value="${title+1}"></c:set>
			                        		<li>&nbsp; <i class="fas fa-edit"></i> &nbsp;<a href="${pageContext.request.contextPath}/user/board_list?boardNum=${blist.boardNum}">${blist.boardName}</a></li>
			                        	</c:if>
	                            </c:forEach>
	                            <c:if test="${title == 1}">
	                            	<li>게시판이 생성되지 않았습니다.</li>
	                            </c:if>
	                        </ul>
                        </c:forEach>
                        </div>
                    </div>
                    </div>
                  	<div class="board_right p_20">
                        <div class="table_wrap_box">
                        <div class="board_right_info">
                            <div class="table_title">
                                <i class="fas fa-chalkboard"></i>
                                <a href="${pageContext.request.contextPath}/user/board_list?boardNum=${boardNum}" style="color: #3f51b5;">${bvo.boardDepartmentName} ${bvo.boardName} 게시판</a>
                            </div>
                        </div>
                        <div class="flex space_between m_b10">
                            <div class="">
	                            <c:if test="${sessionScope.empAuth eq 10 || sessionScope.empId eq avo.empIdFk}">
	                                <button class="btn_blue" onclick="location.href='${pageContext.request.contextPath}/user/board_modify?boardNum=${bvo.boardNum}&aId=${avo.aId}'">수정</button>
	                                <button class="btn_red" id="articleOneDelBtn" onclick="articleOneDelBtn('${bvo.boardNum}','${avo.aId}');">삭제</button>
	                            </c:if>
                            </div>
                            <div class="">
                                <button class="btn_write" type="button" onClick="location.href='${pageContext.request.contextPath}/user/board_list?boardNum=${boardNum}'">목록</button>
                            </div>
                        </div>
                        <div class="">
                            <table class="input_list">
                                <tr>
                                    <td class="td_10 center weight_700 bg_gray">게시글 분류</td>
                                    <td class="p_lr3 td_10">
                                    <c:if test="${avo.division eq 0}">일반</c:if>
                                    <c:if test="${avo.division eq 1}"><strong style="color: tomato;">공지</strong></c:if>
                                    </td>
                                    <td class="td_10 center weight_700 bg_gray">근무부서</td>
                                    <td class="p_lr3 td_30">
                                    ${avo.empDepartNameFk}<c:if test="${avo.empDepartNameFk eq null }">비소속</c:if>
                                    </td>
                                    <td class="td-10 center weight_700 bg_gray">작성일</td>
                                    <td class="p_lr3">
                                   	 ${avo.regdate}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-10 center weight_700 bg_gray">게시글 작성자</td>
                                    <td colspan="3" class="p_r3 p_l15" style="text-align:left;">
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
                                    <td colspan="5" class="p_r3 p_l15"style="text-align:left;">
                                     <strong>${avo.subject}</strong>
                                    </td>
                                </tr>
                                <tr>
                                 <td class="td-10 center weight_700 bg_gray">게시글 내용</td>
                                 <td colspan="5" class="content p_l10" style="text-align:left; white-space:normal;">
                                 ${avo.content}
                                 </td>
                             </tr>
                             <tr>
                                 <td class="td-10 center weight_700 bg_gray">첨부파일</td>
                                 <td colspan="3" class="p_lr15" style="text-align:left;">
                                   <c:if test="${avo.fileName ne null}">
                                   		<a href="${pageContext.request.contextPath}/admin/article_download?aId=${avo.aId}&boardNum=${bvo.boardNum}">
                                   			<span class="font_14">${avo.fileOriName}</span>
	                                   		<i class="fas fa-file-powerpoint font_18"></i>
                                   		</a>
                                   </c:if>
                                   <c:if test="${avo.fileName eq null}"> 첨부파일이 없습니다. </c:if>
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
                            <div class="comment_wrap">
                               	<c:forEach var="clist" items="${clist}">
                               		<div class="comment" id="comment_${clist.cId}">
	                                    <div class="flex space_between">
	                                    	<div class="flex">
	                                    	<c:if test="${clist.reCId ne 0}">
	                                    	<i class="fas fa-reply-all font_18 m_l10"></i>
		                                    	<div class="flex" style="color: #505050;">
			                                    	<c:if test="${clist.reCIdName ne NULL }">
			                                    		<i class="fas fa-at font_14 m_l10 m_r3" style="margin-top:8px;"></i>
			                                    	</c:if>
			                                    	<div class="flex" >
			                                    	 ${clist.reCIdDepart} ${clist.reCIdName}
			                                    	</div>
	                                    	 	</div>
	                                    	</c:if>
		                                        <div class="weight_700 m_r10 p_l10">
		                                            ${clist.comEmpDartName} ${clist.who}
		                                        </div>
		                                        <div class="comment_date">
		                                            ${clist.reRegdate}
		                                        </div>
		                                    </div> 
		                                    <div class="p_r10">
                                          		<c:if test="${clist.who ne ' '}">
                                          			<c:if test="${sessionScope.empAuth eq 10 || sessionScope.empId eq clist.reEmpIdFk}">
                                                 		<a onClick="changeComment('${clist.cId}','${clist.who}','${clist.comment}','${clist.aIdFk}');" href="#" id="changeComment">수정</a> &nbsp; 
                                                  		<a onClick="return commentDel();" href="${pageContext.request.contextPath}/admin/board_comment_delete?boardNum=${boardNum}&aIdFk=${clist.aIdFk}&cId=${clist.cId}">삭제</a> &nbsp; 
                                           			</c:if>
                                                	<a onClick="reComment('${clist.cId}','${clist.aIdFk}','${clist.comEmpDartName}','${clist.who}','${clist.ref}');" href="#">댓글</a>
                                               	</c:if>
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
										placeholder="댓글 내용을 입력하세요." class="p_10 noto font16" maxlength="200"></textarea> 
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
                            <div class="clearfix m_b30"></div>   
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>
</div>
<script>
history.scrollRestoration = "manual"


document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

$(document).ready(function(){
	$("#reCommentForm").submit(function() {
		if($("#chkAuth").val() < 10 && $("#chkComment").val() == 1 && $("#chkDepart").val() != $("#chkBdepart").val() ){
			alert("해당 부원만 댓글을 등록할 수 있습니다.");
			return false;
		};
	});
});

function commentDel(){
	return confirm("삭제하시겠습니까?");
}

function articleOneDelBtn(boardNum,aId){
	var chk = confirm("삭제하시겠습니까?");
	if(chk == true){
		window.location.href="${pageContext.request.contextPath}/user/board_article_delete_one?boardNum=" + boardNum + "&aId="+ aId;
	}else{
		 return false;
	};
}; 

$("#commentRegBtn").click(function(){

	if($("#chkAuth").val() < 10 && $("#chkComment").val() == 1 && $("#chkDepart").val() != $("#chkBdepart").val() ){
		alert("해당 부원만 댓글을 등록할 수 있습니다.");
		return false;
	};

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
					location.reload(true);
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
	
		a += '<div class="addComment">';
		a += '<form id="commentUpForm" name="commentUpForm" action="${pageContext.request.contextPath}/user/board_comment_update">';
		a += '<div class="comment_box" style="height: 150px;">';
		a += '<div class="weight_700 m_b3">${sessionScope.empDepartmentName} ${sessionScope.empName}</div>';
		a += '<div class=""> ';
		a += '    <textarea id="comment" name="comment" style="border: none; width: 100%; height: 60px;"';
		a += '		 class="p_10 noto font16" autofocus>'+comment+'</textarea> ';
		a += '     <input id="who" name="who" type="hidden" value="'+who+'" />  ';
		a += '     <input id="aIdFk" name="aIdFk" type="hidden" value="'+ aIdFk +'" />  ';
		a += '     <input id="cId" name="cId" type="hidden" value="'+cId+'" />  ';
		a += '     <input id="boardNum" name="boardNum" type="hidden" value="${boardNum}" />  ';
		a += '     <input id="reEmpIdFk" name="reEmpIdFk" type="hidden" value="${sessionScope.empId}" />  ';
		a += ' </div>';
		a += '  <div class="float_r">';
		a += '      <button class="s_btn_gray" id="" type="button" onClick="window.location.reload()">취소</button>';
		a += '      <button class="s_btn_blue" id="commenUpdate" type="submit">수정</button>';
		a += '  </div>';
		a += '</div>';
		a += '</form>';
		a += '</div>';
		$("#comment_" + cId).html(a); 

};


function reComment(cId,aIdFk,comEmpDartName,who,ref) {
	var a = '';
	a += '<div class="addReComment">';
	a += '<form id="reCommentForm" name="reCommentForm" action="${pageContext.request.contextPath}/user/board_comment_reply">';
	a += '<div class="comment_box" style="height: 145px;">';
	a += '<i class="fas fa-share"></i> <span class=""><strong> TO </strong> '+comEmpDartName+' '+who+'</span>';
	a += '<div class="weight_700 m_b3">${sessionScope.empDepartmentName} ${sessionScope.empName}</div>';
	a += '<div class=""> ';
	a += '    <textarea id="comment" name="comment" style="border: none; width: 100%; height: 50px;"';
	a += '		 class="p_10 noto font16" placeholder="댓글 내용을 입력하세요." autofocus></textarea> ';
	a += '     <input id="ref" name="ref" type="hidden" value="'+ ref +'" />  ';
	a += '     <input id="who" name="who" type="hidden" value="${sessionScope.empName}" />  ';
	a += '     <input id="aIdFk" name="aIdFk" type="hidden" value="'+ aIdFk +'" />  ';
	a += '     <input id="cId" name="cId" type="hidden" value="'+cId+'" />  ';
	a += '     <input id="reCIdDepart" name="reCIdDepart" type="hidden" value="'+comEmpDartName+'" />  ';
	a += '     <input id="reCIdName" name="reCIdName" type="hidden" value="'+who+'" />  ';
	a += '     <input id="boardNum" name="boardNum" type="hidden" value="${boardNum}" />  ';
	a += '     <input id="reEmpIdFk" name="reEmpIdFk" type="hidden" value="${sessionScope.empId}" />  ';
	a += ' </div>';
	a += '  <div class="float_r">';
	a += '      <button class="s_btn_gray" id="" type="button" onClick="window.location.reload()">취소</button>';
	a += '      <button class="s_btn_blue" id="commentRe" type="submit">댓글</button>';
	a += '  </div>';
	a += '</div>';
	a += '</form>';
	a += '</div>';
	$("#reComment_area_" + cId).html(a); 


	
}


</script>