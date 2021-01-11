<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="nowDate" class="java.util.Date" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_write.css">
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
                                	 ${bvo.boardDepartmentName} ${bvo.boardName} 게시물 수정
                            </div>
                        </div>
                         <form id="articleForm" name="articleForm" action="${pageContext.request.contextPath}/admin/board_modify_update">
                       		<div class="">
                            <table class="input_list">
                                <tr>
                                    <td class="td_10 center weight_700 bg_gray">게시글 분류</td>
                                    <td class="p_lr3">
                                        <select class="sel_100" id="division" name="division">
                                            <option value="0"<c:if test="${avo.division eq '0'}">selected</c:if>>일반</option>
                                            <option value="1"<c:if test="${avo.division eq '1'}">selected</c:if>>공지사항</option>
                                        </select>
                                    </td>
                                    <td class="td_10 center weight_700 bg_gray">근무부서</td>
                                    <td class="p_lr3 td_25">
                                        <input type="text" name="" id="" class="input_100" readonly value="${sessionScope.empDepartmentName} <c:if test="${sessionScope.empDepartmentName eq null }">비소속</c:if>"/>
                                    </td>
                                    <td class="td-10 center weight_700 bg_gray">수정일</td>
                                    <td class="p_lr3 td_25">
                                        <input type="text" class="input_100" readonly value="<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" />"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-10 center weight_700 bg_gray white_s_no">게시글 작성자</td>
                                    <td colspan="3" class="p_lr3">
                                        <input type="text" name="writer" id="writer" class="input_100" readonly  value="${sessionScope.empName}"/>
                                    </td>
                                    <td class="td-10 center weight_700 bg_gray white_s_no">비밀글</td>
                                    <td class="p_lr3">
                                        <select class="sel_100" id="secret" name="secret">
                                        	<option value="0" <c:if test="${avo.secret eq '0'}">selected</c:if>>공개</option>
                                        	<option value="1" <c:if test="${avo.secret eq '1'}">selected</c:if>>비공개</option>
                                        </select>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="td-10 center weight_700 bg_gray">게시글 제목</td>
                                    <td colspan="5" class="p_lr3">
                                        <input type="text" name="subject" id="subject" class="input_100 noto" autofocus value="${avo.subject}" maxlength="50">
                                    </td>
                                </tr>
                                <tr>
                                    
                                 <td class="td-10 center weight_700 bg_gray">게시글 내용</td>
                                 <td colspan="5" class="td-90 p-lr3" style="padding-top: 2px; padding-bottom: 2px;">
                                 	<textarea name="content" id="editor" style="width: 100%; height: 300px; border: 1px solid #ccc; padding: 10px; border-radius: 2px;" class="noto">${avo.content}</textarea>
									<script>
										CKEDITOR.replace('editor', {
											width : '100%'
										});
										CKEDITOR.config.height = 300;
										
									</script>
								</td>
                             </tr>
                             <tr>
                                 <td class="td-10 center weight_700 bg_gray">첨부파일</td>
                                 <td colspan="5" class="p_lr5 font_18" >
                                    <input type="file" name="fileName" id="fileName" class="input_100" value="${avo.fileName}"/>
                                 </td>
                             </tr>
                            </table>
                        </div>
                        <input type="hidden" id="aId" name="aId" value="${avo.aId}" />
                        <input type="hidden" id="boardNum" name="boardNum" value="${boardNum}" />
                        <input type="hidden" id="empIdFk" name="empIdFk"  value="${sessionScope.empId}"/>
                        <div class="flex space_between m_t10">
                            <div class="">
                                <button class="btn_write" type="button" onClick="location.href='${pageContext.request.contextPath}/admin/board_list?boardNum=${boardNum}'">목록</button>
                            </div>
                            <div class="">
                                <button class="btn_red" type="reset" id="reset">새로고침</button>
                                <button class="btn_blue" type="submit" id="articleModifyBtn" >수정</button>
                            </div>
                        </div>
                         </form>
                    </div>
                </div>
            </div>
</div>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>