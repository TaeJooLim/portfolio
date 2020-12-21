<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css"> 
</head>

<style>
    .board-list tr:first-child {
        background-color: #005AA7;
        color: #fff;
    }
    .tr-even {
        background-color:#eff3f9;
    }
    td {
        border: 1px solid #d6dce7;
    }
</style>
<body>
    <main>
	    <%@ include file="/WEB-INF/views/adminPage/board/BOARD_MENU.jsp" %>
        <div class="mainContent bg-gray p10">
            <div class="page-main-wrap bg-white p10">
                <div class="contentHead p-b10 flex flex-justify">
                    <h2 style="color:#A7005A;">${boardTitle}</h2>
                </div>
                <div class="btn-wrap flex flex-justify">
                    <div class="btns">
                        <button type="button" class="btn-on" onclick="location.href='memberInsert.html'" style="background-color:${boardColor};">게시글작성</button>
                        <button type="button" class="btn-off">선택삭제</button>
                    </div>
                    <div class="search-box">
                        <form name="search-frm" class="search-frm" method="post" action="search.do">
                            <select class="sel">
                                <option value="">제목</option>
                                <option value="">작성자</option>
                                <option value="">모두</option>
                            </select>
                            <input name="search" type="search" class="input" maxlength="20" tabindex="1" />
                            <button type="submit" class="search-btn" style="background-color:${boardColor};">검색</button>
                        </form>
                    </div>
                </div>
                <span>게시글 수 : n 개</span>
                <div class="board-list">
                	<form method="post" action="${pageContext.request.contextPath}/article/article_list">
	                    <table>
	                        <tr class="center font14" style="background-color:${boardColor};">
	                            <td class="td-5"><input type="checkbox" onClick="chkAll();" id="chkAll" /></td>
	                            <td class="td-5">번호</td>
	                            <td class="td-8">분류</td>
	                            <td style="width:53%;">게시물 제목</td>
	                            <td class="td-8">작성자</td>
	                            <td class="td-5">조회</td>
	                            <td class="td-8">날짜</td>
	                            <td class="td-8">관리</td>
	                        </tr>
	                        <tr class="center font14">
	                            <td>
	                                <input type="checkbox" name="chk" class="chk" />
	                            </td>
	                            <td>멍</td>
	                            <td>
	                                <a href="board_list.html" target="_blank" class="under">멍</a>
	                            </td>
	                            <td class="left p-lr5">
	                            	<span class="one_line_txt" style="width:100%;">멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍</span>
	                            </td>
	                            <td>
	                                <a href="board_list.html" target="_blank" class="under">멍</a>
	                            </td>
	                            <td>멍</td>
	                            <td>멍</td>
	                            <td>
	                                <span class="s-btn-on" style="background-color:${boardColor};">수정</span>
	                                <span class="s-btn-off">삭제</span>
	                            </td>
	                        </tr>
	                    </table>
                 	</form>
                    
                </div>
                <!-- 페이징 UI 시작 -->
			<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=1&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-double-left"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-double-left"></i>
							</span>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-left"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-left"></i>
							</span>
						</c:otherwise>
					</c:choose>
				
					<!-- 페이지 번호 출력 -->
					<c:forEach begin = "${blockBegin}" end="${blockEnd}" var="num">
						<c:if test="${ selected == num }">
							<span class="page active">
								<a href="#" style="color:#fff;">${num}</a>
							</span>
						</c:if>
						
						<c:if test="${ selected != num }">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									${num}
								</span>
							</a>
						</c:if>	
					</c:forEach>
					
					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-right"></i>
							</span>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${curPage >= 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-double-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-double-right"></i>
							</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
			<!-- 페이징 UI 끝-->
            </div>
        </div>
    </main>
</body>
<script>
	var flag = false; 
	function chkAll() {
		var chk = document.getElementsByName("chk");
		if( flag == false) {
			flag = true;
			for(var i = 0; i < chk.length; i++) {
				chk[i].checked = true;
			}
			
		}else{
			flag = false;
			for(var i = 0; i < chk.length; i++) {
				chk[i].checked = false;
			}
		}
		
	}
</script>
</html>