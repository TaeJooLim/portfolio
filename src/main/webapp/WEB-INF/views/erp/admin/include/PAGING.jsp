<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="page_grp" class="page_grp center p_b20">
                	<c:if test="${pagingvo.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1);"><span class="page"><i class="fas fa-angle-double-left"></i></span></a> 
                    </c:if>
                	<c:if test="${pagingvo.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagingvo.prevPage}');"><span class="page"><i class="fas fa-angle-left"></i></span></a> 
                    </c:if>
                	<c:forEach var="pageNum" begin="${pagingvo.startPage}" end="${pagingvo.endPage}">
                        <c:choose>
                            <c:when test="${pageNum eq pagingvo.curPage}">
                                <span class="page">${pageNum}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum}');"><span class="page">${pageNum}</span></a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                	<c:if test="${pagingvo.curPage ne pagingvo.pageCnt && pagingvo.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagingvo.nextPage}');"><span class="page"><i class="fas fa-angle-right"></i></span></a> 
                    </c:if>
                    <c:if test="${pagingvo.curRange ne pagingvo.rangeCnt && pagingvo.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagingvo.pageCnt}');"><span class="page"><i class="fas fa-angle-double-right"></i></span></a> 
                    </c:if>
                </div>