<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/js/table.js"></script>
<style>
    tr:first-child {
        background-color: #005AA7;
        color: #fff;
    }
    .tr-even {
        background-color:#eff3f9;
    }
</style>

<body>
    <%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
    	<%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
        <div class="mainContent">
            <div class="contentHead">
                <h3 class="font18">사용자 관리 > 사용자 신청 목록</h3>
            </div>
            <div class="btn-wrap flex flex-justify">
                <div class="btns">
                    <button class="btn-on" id="approveAll">선택승인</button>
                    <button class="btn-off" id="rejectAll">선택거부</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" 
                    action="${pageContext.request.contextPath}/member/memberApplicant">
                        <select name="searchOpt" class="sel">
                            <option value="mem_id" <c:if test="${searchOpt eq 'mem_id'}">selected</c:if> >아이디</option>
                            <option value="mem_name" <c:if test="${searchOpt eq 'mem_name'}">selected</c:if> >신청자명</option>
                            <option value="mem_num" <c:if test="${searchOpt eq 'mem_num'}">selected</c:if> >사원번호</option>
                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체검색</option>
                        </select>
                        <input value="${words}" type="text" name="words" class="input p-lr5" maxlength="20" tabindex="1" />
                        <button type="submit" class="search-btn" tabindex="2">검색</button>
                    </form>
                </div>
            </div>
            <div>승인 대기 회원 수 : ${count} 명 ( ${curPage} of ${totalPage} pages)</div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox" onClick="chkAll();" id="chkAll" data-uid="${mem.num}"/></td>
                        <td class="td-3">번호</td>
                        <td class="td-10">신청일</td>
                        <td class="td-12">신청 아이디</td>
                        <td class="td-10">신청자</td>
                        <td class="td-10">사번</td>
                        <td class="td-8">부서</td>
                        <td class="td-8">직급</td>
                        <td class="td-10">입사일</td>
                        <td class="td-15">관리</td>
                    </tr>
                    <c:if test="${count == 0}">
						<tr id="noCss">
							<td colspan="10" style="height:200px;" class="center weight700">승인 대기 회원이 없습니다.</td>
						</tr>
					</c:if>
                    <c:forEach items="${list}" var="mem" varStatus="status">
	                    <tr class="center trHover">
	                        <td><input type="checkbox" name="chk" class="chk" value="${mem.num}" data-uid="${mem.num}"></td>
	                        <td>${(count - status.index) - ( (curPage - 1) * end )}</td>
	                        <td>${mem.memRegdate}</td>
	                        <td>${mem.memID}</td>
	                        <td>${mem.memName}</td>
	                        <td>${mem.memNum}</td>
	                        <td>${mem.memBuseoName}</td>
	                        <td>${mem.memGradeName}</td>
	                        <td>${mem.memEntdate}</td>
	                        <td>
	                            <button onClick="approveConfirm('${mem.num}');" type="button" class="s-btn-on">승인</button>
	                            <button onClick="disapproveConfirm('${mem.num}');" type="button" class="s-btn-off">거부</button>
	                        </td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
			<!-- 페이징 UI 시작 -->
			<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/member/memberApplicant?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
							<a href="${pageContext.request.contextPath}/member/memberApplicant?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
							<a href="${pageContext.request.contextPath}/member/memberApplicant?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									${num}
								</span>
							</a>
						</c:if>	
					</c:forEach>
					
					<c:choose>
						<c:when test="${curPage >= 1}">
							<a href="${pageContext.request.contextPath}/member/memberApplicant?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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
					
					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/member/memberApplicant?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
					
				</div>
			</c:if>
			<!-- 페이징 UI 끝-->
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

	function approveConfirm(num){
	    var msg = "선택하신 회원의 승인여부를 변경합니다.\n변경하시겠습니까?";
	    if( confirm(msg) ){
	        var formData = {
	            num         :   num
	        }
	
	        $.ajax({
	            url     : "${pageContext.request.contextPath}/member/approveConfirm",
	            type    : "POST",
	            data    :  formData,
	            success :   function(resData){
	                if(resData == "success"){
	                    alert("승인이 처리되었습니다.");
	                }
	            },
	            error   : function(){
	                alert("승인처리에 실패했습니다.");
	            },
	            complete : function(){
	            	window.location.reload();
	            }
	        });
	    }
	}

	function disapproveConfirm(num){
	    var msg = "해당 회원의 승인을 거부합니다.\n거부 시 해당 회원의 정보는 영구삭제됩니다.\n거부하시겠습니까?";
	    if( confirm(msg) ){
	        var formData = {
	            num         :   num
	        }
	
	        $.ajax({
	            url     : "${pageContext.request.contextPath}/member/disapproveConfirm",
	            type    : "POST",
	            data    :  formData,
	            success :   function(resData){
	                if(resData == "success"){
	                    alert("해당 회원의 정보가 성공적으로 삭제되었습니다.");
	                }
	            },
	            error   : function(){
	                alert("승인거부처리에 실패했습니다.");
	            },
	            complete : function(){
	            	window.location.reload();
	            }
	        });
	    }
	}

	$(function(){
		$("#approveAll").click(function(){
			var msg = "선택하신 회원을 승인하시겠습니까?";
			if(confirm(msg)){
				var chkArray = new Array();
				$(".chk:checked").each(function(){
					chkArray.push($(this).attr("data-uid"));
				});
				
				$.ajax({
					url		: "${pageContext.request.contextPath}/member/approveAll",
					type	: "POST",
					data	: {chkArr : chkArray},
					success	: function(resData){
						alert("성공적으로 승인하였습니다.");
						window.location.reload();
					},
					error	: function(){
						alert("시스템 에러");
					},
					complete : function(){
					}
				});
			}
		});
	});

	$(function(){
		$("#rejectAll").click(function(){
			var msg = "선택하신 회원을 승인거부하시겠습니까?\n승인거부 후 재승인은 불가합니다.";
			if(confirm(msg)){
				var chkArray = new Array();
				$(".chk:checked").each(function(){
					chkArray.push($(this).attr("data-uid"));
				});
				
				$.ajax({
					url		: "${pageContext.request.contextPath}/member/rejectAll",
					type	: "POST",
					data	: {chkArr : chkArray},
					success	: function(resData){
						alert("성공적으로 승인거부하였습니다.");
						window.location.reload();
					},
					error	: function(){
						alert("시스템 에러");
					},
					complete : function(){
					}
				});
			}
		});
	});
</script>
</html>