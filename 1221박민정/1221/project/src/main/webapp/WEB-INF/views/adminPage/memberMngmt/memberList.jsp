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
                <h3 class="font18">사용자 관리 > 사용자 목록</h3>                
            </div>
            <div class="btn-wrap flex flex-justify">
                <div class="btns">
                    <button class="btn-on" onClick="location.href='${pageContext.request.contextPath}/member/memberInsert'">사용자추가</button>
                    <button class="btn-off" id="deleteAll">선택삭제</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" 
                    action="${pageContext.request.contextPath}/member/memberList">
                        <select name="searchOpt" class="sel">
                            <option value="mem_id" <c:if test="${searchOpt eq 'mem_id'}">selected</c:if> >아이디</option>
                            <option value="mem_name" <c:if test="${searchOpt eq 'mem_name'}">selected</c:if> >사원명</option>
                            <option value="mem_num" <c:if test="${searchOpt eq 'mem_num'}">selected</c:if> >사원번호</option>
                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체검색</option>
                        </select>
                        <input value="${words}" type="text" name="words" class="input p-lr5" maxlength="20" tabindex="1" />
                        <button type="submit" class="search-btn" tabindex="2">검색</button>
                    </form>
                </div>
            </div>
            <div>전체 회원 수 : ${count} 명 ( ${curPage} of ${totalPage} pages )</div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox" onClick="chkAll();" id="chkAll" data-uid="${mem.num}" /></td>
                        <td class="td-5">번호</td>
                        <td class="td-8">부서명</td>
                        <td class="td-8">직급명</td>
                        <td class="td-8">사원번호</td>
                        <td class="td-8">사원명</td>
                        <td class="td-8">아이디</td>
                        <td class="td-8">성별</td>
                        <td class="td-8">입사일</td>
                        <td class="td-8">가입일</td>
                        <td class="td-8">권한</td>
                        <td class="td-8">승인</td>
                        <td class="td-10">관리</td>
                    </tr>
                    <c:if test="${count == 0}">
						<tr id="noCss">
							<td colspan="13" style="height:200px;" class="center weight700">승인 대기 회원이 없습니다.</td>
						</tr>
					</c:if>
                    <c:forEach items="${list}" var="mem" varStatus="status">
	                    <tr class="center trHover">
	                        <td><input type="checkbox" name="chk" class="chk" data-uid="${mem.num}" /></td>
	                        <td>${(count - status.index) - ( (curPage - 1) * end )}</td>
	                        <td>${mem.memBuseoName}</td>
	                        <td>${mem.memGradeName}</td>
	                        <td>${mem.memNum}</td>
	                        <td>${mem.memName}</td>
	                        <td>${mem.memID}</td>
	                        <td>
	                        	<select onChange="changeGender(this.value,'${mem.num}');" class="sel-100">
									<option value="M" <c:if test="${mem.memGender eq 'M'}">selected</c:if> >남자</option>
									<option value="F" <c:if test="${mem.memGender eq 'F'}">selected</c:if> >여자</option>
								</select>
	                        </td>
	                        <td>${mem.memEntdate}</td>
	                        <td>${mem.memRegdate}</td>
	                        <td>
	                        	<select onChange="changeLevel(this.value,'${mem.num}');" class="sel-100">
									<option value="1" <c:if test="${mem.memLevel eq '1'}">selected</c:if> >협력업체</option>
									<option value="2" <c:if test="${mem.memLevel eq '2'}">selected</c:if> >사원</option>
									<option value="3" <c:if test="${mem.memLevel eq '3'}">selected</c:if>>부서장</option>
									<option value="4" <c:if test="${mem.memLevel eq '4'}">selected</c:if>>임원</option>
									<option value="5" <c:if test="${mem.memLevel eq '5'}">selected</c:if>>관리자</option>
								</select>
							</td>
	                        <td >
	                        	<select onChange="changeConfirm(this.value, '${mem.num}');" class="sel-100">
									<option value="N" <c:if test="${mem.memConfirm eq 'N'}">selected</c:if> >미승인</option>
									<option value="Y" <c:if test="${mem.memConfirm eq 'Y'}">selected</c:if> >승인</option>
								</select>
	                        </td>
	                        <td>
	                            <button type="button" class="s-btn-on">수정</button>
	                            <button onClick="deleteOne('${mem.num}');" type="button" class="s-btn-off">삭제</button>
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
							<a href="${pageContext.request.contextPath}/member/memberList?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
							<a href="${pageContext.request.contextPath}/member/memberList?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
							<a href="${pageContext.request.contextPath}/member/memberList?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									${num}
								</span>
							</a>
						</c:if>	
					</c:forEach>
					
					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/member/memberList?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
							<a href="${pageContext.request.contextPath}/member/memberList?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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

	function changeGender(memGender, num){
        var msg = "선택하신 사원의 성별을 변경합니다.\n변경하시겠습니까?";
        if( confirm(msg) ){

            var formData = {
            	memGender : memGender,
                num : num
            };

            $.ajax({
                url : "${pageContext.request.contextPath}/member/changeGender",
                type : "POST",
                data : formData,
                success : function(resData){
                    if( resData == "success" ){
						alert("성별 설정이 성공적으로 변경되었습니다.");
                    }                    
                },
                error : function(){
                    alert("성별 설정 변경에 실패하였습니다.");
                },
                complete : function(){
                    window.location.reload();
                }
            });
        }
    }

	function changeLevel(memLevel, num){
        var msg = "선택하신 회원의 권한수준을 변경합니다.\n변경하시겠습니까? ";
        if(confirm(msg)){
            var formData = {
                memLevel    : memLevel,
                num         : num
            }

            $.ajax({
                url     : "${pageContext.request.contextPath}/member/changeLevel",
                type    : "POST",
                data    : formData,
                success : function(resData){
                    if( resData == "success" ){
                        alert("권한수준이 변경되었습니다.");
                    }
                },
                error   : function(){
                    alert("권한수준 변경에 실패하였습니다.");
                },
                complete    : function(){
                    window.location.reload();
                }
            });
        }
    }

	function changeConfirm(memConfirm, num){
        var msg = "선택하신 회원의 승인여부를 변경합니다.\n변경하시겠습니까? ";
        if(confirm(msg)){
            var formData = {
            	memConfirm    : memConfirm,
                num         : num
            }

            $.ajax({
                url     : "${pageContext.request.contextPath}/member/changeConfirm",
                type    : "POST",
                data    : formData,
                success : function(resData){
                    if( resData == "success" ){
                        alert("승인여부가 변경되었습니다.");
                    }
                },
                error   : function(){
                    alert("승인여부 변경에 실패하였습니다.");
                },
                complete    : function(){
                    window.location.reload();
                }
            });
        }
    }

	function deleteOne(num){
		
		var msg = "선택하신 정보의 모든 내용이 삭제됩니다.\n삭제하시겠습니까?";
		
		//확인창을 실행한다면..
		if( confirm(msg) ){
			$.ajax({
				url	: "${pageContext.request.contextPath}/member/deleteOne",
				type	: "POST",
				data	: {num : num},
				success	: function(resData){
					if( resData == "success" ){
						alert("선택하신 정보가 삭제되었습니다. ");
					}
				},
				error	: function(){
					alert("선택하신 정보를 삭제할 수 없습니다.");
				},
				complete: function(){
					window.location.reload();
				}
			});
		}
	}

	$(function(){
		$("#deleteAll").click(function(){
			var msg = "선택하신 정보의 모든 내용이 삭제됩니다. \n삭제하시겠습니까?";
			if(confirm(msg)){
				var chkArray = new Array();
				$(".chk:checked").each(function(){
					chkArray.push($(this).attr("data-uid"));
				});

				$.ajax({
					url		: "${pageContext.request.contextPath}/member/deleteMemAll",
					type	: "POST",
					data	: {chkArr : chkArray},
					// controller <- chkArr
					success	: function(resData){
						alert("선택하신 정보가 삭제되었습니다.");
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