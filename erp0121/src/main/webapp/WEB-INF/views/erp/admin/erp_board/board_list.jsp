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
<!-- 비공개 권한 처리 -->
<c:if
	test="${sessionScope.empAuth < 10 && bvo.boardOpen == 1}">
	<script>
		alert("현재 게시판은 비공개입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 비공개 권한 처리 -->
<div class="page_wrap bg_white noto font_14">
	<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">게시판관리<i class="fas fa-chevron-right p_lr10"></i>1. 게시글목록</h2>
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
                                <a href="${pageContext.request.contextPath}/admin/board_list?boardNum=${boardNum}" style="color: #3f51b5;">${bvo.boardDepartmentName} ${bvo.boardName} 게시판</a>
                            </div>
                        </div>
                        <div class="flex space_between m_b5">
                            <div class="p_r2 flex p_t5" style="white-space: nowrap;">
	                            <c:if test="${sessionScope.empAuth eq 10}">
	                                <button class="btn_red m_r10" id="deleteAll" onclick="deleteAll('${bvo.boardNum}');" >선택삭제</button>
	                            </c:if>
                                <div class="font_14" style="padding-top: 13px;  color: #4c4c4c;"> 전체 게시물 / <strong>${listCnt}</strong>개 </div>
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
                                            <input type="checkbox" onClick="chkAll();" id="chkAll"/>
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
                                <c:forEach items="${alist}" var="alist" varStatus="status">
                                    <tr>
                                        <td>
                                           <input type="checkbox" name="chk" class="chk"  data-uid="${alist.aId}"/>
                                        </td>
                                        <td>
											${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}
										</td>
                                        <td>
                                        	<c:if test="${alist.division eq 0}">일반</c:if>
                                        	<c:if test="${alist.division eq 1}"><strong style="color: tomato;">공지</strong></c:if>
                                        </td>
                                        <td class="p_l10" style="text-align:left;">
                                            <a href="${pageContext.request.contextPath}/admin/board_view?boardNum=${bvo.boardNum}&aId=${alist.aId}" class="weight_700 m_r5 subject">${alist.subject}</a>
                                            <span style="color: tomato;">[${alist.commentHit}]</span>
                                        	<c:if test="${alist.secret eq '1'}"><i class="fas fa-lock font_14 m_l5" style="color: #4c4c4c;"></i></c:if>
                                        </td>
                                        <td>${alist.empDepartNameFk}<c:if test="${alist.empDepartNameFk eq null }">비소속</c:if></td>
                                        <td>${alist.writer}</td>
                                        <td>${alist.hit}</td>
                                        <td>
                                        	<c:choose>
                                        		<c:when test="${alist.fileUrl eq null}"></c:when>
                                        		<c:otherwise>
                                        			<i class="fas fa-paperclip font_16"></i>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </td>
                                        <td>
											${alist.regdate}
										</td>
                                        <td>
                                        	<c:choose>
	                                        	<c:when test="${sessionScope.empAuth eq 10 || sessionScope.empId eq alist.empIdFk}">
	                                        		<button class="s_btn_blue" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board_modify?boardNum=${bvo.boardNum}&aId=${alist.aId}'">수정</button>
	                                       		</c:when>
	                                       		<c:otherwise>
	                                       			-
	                                       		</c:otherwise>
                                       		</c:choose>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="flex space_between">
                        	<div style="margin:0 auto">
	                            <%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
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
				var curHref = "/erp/admin/board_list";
				function fn_paging(curPage) {
					var searchTXT = "?boardNum=${boardNum}&searchOpt=${searchOpt}&words=${words}&curPage=";
					window.location.href = curHref + searchTXT + curPage;
				};
            </script>
<script>
var flag = false;

function chkAll() {

    var chk = document.getElementsByName("chk");
    if (flag == false) { //선택 x
        flag = true;

        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = true;
        }

    } else {
        flag = false;
        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = false;
        }
    }
}

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