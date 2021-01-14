<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_list.css">
<style>
.subject:hover {
	text-decoration: underline;
}
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
                        <div class="flex space_between m_b5">
                            <div class="p_r2 flex p_t5" style="white-space: nowrap;">
                                <button class="btn_red m_r10" id="deleteAll" onclick="deleteAll('${bvo.boardNum}');" >선택삭제</button>
                                <div class="font_14" style="padding-top: 13px;  color: #4c4c4c;"> 전체 게시물 / <strong>${count}</strong>개 </div>
                            </div>
                        <form method="post" action="${pageContext.request.contextPath}/admin/board_list?boardNum=${bvo.boardNum}">
			                <div class="search_grp flex m_t10">
			                	<select class="search_sel_box" name="searchOpt">
				              		<option value="subject" <c:if test="${searchOpt eq 'subject'}"></c:if>>제목</option>
				                	<option value="writer" <c:if test="${searchOpt eq 'writer'}"></c:if>>작성자</option>
				           		</select>
			                	<input type="text" class="m_lr5 p_l5" id="" name="words" value="${words}" required />
			                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
	                	</form>
                        </div>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list_table m_b10">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" />
                                        </th>
                                        <th class="td_5">번호</th>
                                        <th>구분</th>
                                        <th class="weight_700 td_40">제목</th>
                                        <th>근무부서</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                        <th>첨부파일</th>
                                        <th class="td_15">작성일</th>
                                        <th class="td_5">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${empty alist}">
	                           		<tr>
	                           			<td class="weight_700" colspan="10">등록된 게시글이 없습니다.</td>
	                           		<tr>
                           		</c:if>
                                <c:forEach items="${alist}" var="alist">
                                    <tr>
                                        <td>
                                           <input type="checkbox" name="chk" class="chk"  data-uid="${alist.aId}"/>
                                        </td>
                                        <td>${alist.aId}</td>
                                        <td>
                                        	<c:if test="${alist.division eq 0}">일반</c:if>
                                        	<c:if test="${alist.division eq 1}"><strong style="color: tomato;">공지</strong></c:if>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/board_view?boardNum=${bvo.boardNum}&aId=${alist.aId}" class="weight_700 m_r5 subject">${alist.subject}</a>
                                            <span style="color: tomato;">[${alist.commentHit}]</span>
                                        	<c:if test="${alist.secret eq '1'}"><i class="fas fa-lock font_14 m_l5" style="color: #4c4c4c;"></i></c:if>
                                        </td>
                                        <td>${alist.empDepartNameFk}<c:if test="${alist.empDepartNameFk eq null }">비소속</c:if></td>
                                        <td>${alist.writer}</td>
                                        <td>${alist.hit}</td>
                                        <td><i class="fas fa-paperclip font_16"></i>${alist.fileUrl}</td>
                                        <td>
                                        	<fmt:formatDate value="${alist.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm"/>
                                        </td>
                                        <td>
                                        	<button class="s_btn_blue" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board_modify?boardNum=${bvo.boardNum}&aId=${alist.aId}'">수정</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="flex space_between">
                            <div class="page_grp center white_s_no">
                                <a href="">
                                    <span class="page"><i class="fas fa-angle-double-left"></i></span>
                                </a>
                                <a href="">
                                    <span class="page"><i class="fas fa-angle-left"></i></span>
                                </a>
                                <a href="">
                                    <span class="page">1</span>
                                </a>
                                <a href="">
                                    <span class="page">2</span>
                                </a>
                                <a href="">
                                    <span class="page">3</span>
                                </a>
                                <a href="">
                                    <span class="page">4</span>
                                </a>
                                <a href="">
                                    <span class="page">5</span>
                                </a>
                                <a href="">
                                    <span class="page"><i class="fas fa-angle-right"></i></span>
                                </a>
                                <a href="">
                                    <span class="page"><i class="fas fa-angle-double-right"></i></span>
                                </a>
                            </div>
                            <div class="">
                                <button class="btn_write white_s_no" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board_write?boardNum=${bvo.boardNum}'" >글쓰기</button>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
</div>
<script>

function deleteAll(boardNum){
	var boardNum = boardNum;
	 var str = confirm("선택하신 정보를 삭제하시겠습니까?");
	    
	    if( str ) {
	        var chkArr = new Array();
	        $(".chk:checked").each(function () {
	        	chkArr.push($(this).attr("data-uid"));
	        });
	                
	        $.ajax({
	        	url 	: "${pageContext.request.contextPath}/admin/board_article_delete",
	        	type 	: "POST", 	
	        	data 	: { chkArr : chkArr, boardNum : boardNum},
	        	success	: function (resData) {
	        		alert("삭제되었습니다.");
		    		window.location.reload();
	            },
	            error 	: function() {
	            	alert("선택하신 정보가 없습니다.");
	            }
	        });
	    }
	
};

</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>