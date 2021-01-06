<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">계약서 목록</h2>
            </div>
        </div>
        <div class="main_right_info">
        
            <div class="p_20">

                <div class="font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                    <strong>생산등록</strong>을 누르면 해당 계약서의 생산계획 페이지로 이동합니다.<br/>
                    <strong>품질관리</strong>을 누르면 해당 계약서의 품질관리 현황을 볼 수 있는 페이지로 이동합니다.
                    <strong></strong>
                </div>
				
				<form method="post" action="${pageContext.request.contextPath}/admin/contract_list">
                        <div class="search_grp flex float_r m_b5">
		                            <select class="search_sel_box" name="searchOpt" style="height: 25px;">
		                            	<option value="cont_doc_num" <c:if test="${searchOpt eq 'cont_doc_num'}">selected</c:if>>문서번호</option>
		                                <option value="cont_emp_name" <c:if test="${searchOpt eq 'cont_emp_name'}">selected</c:if>>담당자</option>
		                                <option value="cont_client_company" <c:if test="${searchOpt eq 'cont_client_company'}">selected</c:if>>거래처</option>      
		                            </select>
		                            <input value="${words}" type="text" class="m_lr5" name="words" required style="height: 25px;" />		                            
		                            <button type="submit" class="s_btn_gray" style="margin-left:-2px;">검색</button>                         
                        </div>
                   </form>

                <div class="w_100 white_s_no overflow_x_auto">
                    <table class="list">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>문서번호</th>
                                <th>담당자</th>
                                <th>거래처</th>
                                <th>거래처 담당자</th>
                                <th>발주일</th>
                                <th>납기일</th>
                                <th>생산관리</th>
                                <th>문서관리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${count == 0}">
                           		<tr>
                           			<td class="weight_700" colspan="9">등록된 계약서 없습니다.</td>
                           		<tr>
                           	</c:if>
                        	<c:forEach var="cont" items="${list}">
                            <tr>
                                <td>${cont.contID}</td>
                                <td>${cont.contDocNum}</td>
                                <td>${cont.contEmpName}</td>
                                <td>${cont.contClientCompany}</td>
                                <td>${cont.contClientResponsibility}</td>
                                <td>${cont.contOrderDate}</td>
                                <td>${cont.contDueDate}</td>
                                <td>
                                    <button type="button" class="s_btn_blue"  onClick="location.href=''">생산등록</button>
                                    <button type="button" class="s_btn_gray" onClick="location.href=''">품질검사</button>
                                </td>
                                <td>
                                    <button type="button" class="s_btn_blue" onClick="location.href='${pageContext.request.contextPath}/admin/contract_modify?contDocNum=${cont.contDocNum}'">수정</button>
                                    <button type="button" class="s_btn_gray" onClick="location.href=''">출력</button>
                                    <button type="button" class="s_btn_red" onClick="contDel(${cont.contID})">삭제</button>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="page_grp center">
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
        </div>
    </div>
</body>
<script>
	function contDel(contID){
		if( confirm("계약서를 삭제하시겠습니까?") ) {
		$.ajax({
			url		: "${pageContext.request.contextPath}/admin/contract_list_delete",
			type	: "POST",
			data	: {contID : contID},
			success	: function(resData) {
				alert( "계약서가 삭제되었습니다.");
				window.location.reload();
				
			},
			error	:function() {
				alert("시스템 에러");			
			}
		});
		}else{
			window.location.reload();
			}
	}
	
</script>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>