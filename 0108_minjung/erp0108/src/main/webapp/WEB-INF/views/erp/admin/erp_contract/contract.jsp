<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contract.css">
<style>
.search_box {
    position: relative;
}

.search_box input {
    background-color: #eff3f9;
}

.search_box i {
    cursor: pointer;
    position: absolute;
    top: 50%;
    right: 7px;
    transform: translateY(-50%);
    color: #959595;
}

.search_wrap {
    display: none;
    height: 300px;
    border: 1px solid #ccc;
    border-top: none;
    overflow-y: scroll;
}

.search_list {
    padding: 5px;
    text-align: center;
    width: 70%;
    margin: 0 auto;
}

.search_list th,
td {
    border-bottom: 1px solid #ccc;
}
</style>
<div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">계약서 입력</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="">
                        <div class="flex space_between m_b10">
                            <div class="table_title">
                                <i class="fas fa-edit"></i>
                                계약서 기초정보 입력
                            </div>
                            <div>
                                <div class="">
                                    <button type="button" class="btn_write"  onClick="location.href='${pageContext.request.contextPath}/admin/contract_list'">계약서 목록</button>
                                </div>
                            </div>    
                        </div>
                        <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            계약서 기초정보를 입력하면 <strong>문서 번호</strong>가 자동으로 생성됩니다.
                        </div>
                        <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            문서번호가 생성되면 <strong>계약서 목록</strong>에서 <strong>삭제 / 수정</strong>이 가능합니다.
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/contract_insert" name="frm" id="frm" method="post" >                         
                        <table class="input_list">
                            <tr>
                                <td class="bg_gray weight_700 td_7 center">회사명</td>
                                <td class="p_lr3">
                                <input type="text" name="contComName" maxlength="50" id="contComName" class="input_100" value="${companyVO.comName}" readonly required />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">사업장</td>
                                <td class="p_lr3 ">
                                    <select class="sel_100" name="contEmpCompany" id="contEmpCompany">
                                        <option value="본사">본사</option>
                                        <option value="지사">지사</option>
                                    </select>
                                </td>    
                                <td class="bg_gray weight_700 td_7 center">담당자 부서</td>
                                <td class="p_lr3">
                                    <input type="text" name="contDepartName" maxlength="50" id="contDepartName" class="input_100" value="${sessionScope.empDepartmentName}" required />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">담당자 직급</td>
                                <td class="p_lr3">
                                    <input type="text" name="contPositionName" maxlength="50" id="contPositionName" class="input_100" value="${sessionScope.empPositionName}" required />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">담당자 이름</td>
                                <td class="p_lr3">
                                    <input type="text" name="contEmpName" maxlength="50" id="contEmpName" class="input_100" value="${sessionScope.empName}" required />
                                </td>
                            </tr>
                            <tr>
                                <td class="bg_gray weight_700 td_7 center">거래처</td>
                                <td class="p_lr3">
                                <select name="" id="contClientCompany" class="sel_100">
                                	<c:forEach var="clist" items="${clist}">
                                		<option value="${clist.clientId}">${clist.clientCompany}</option>
                                	</c:forEach>
                                </select>
                                <input type="hidden" id="clientCompany" name="contClientCompany" value="${cOne.clientCompany}" />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">거래처 대표자</td>
                                <td class="p_lr3">
                                    <input type="text" name="contClientCeoName" maxlength="50" id="clientCeoName" class="readonly input_100" required value="${cOne.clientCeoName}" style="caret-color: transparent !important;" placeholder="거래처를 선택해주세요."/>
                                </td>
                                <td class="bg_gray weight_700 td_7 center">거래처 담당자</td>
                                <td class="p_lr3">
                                    <input type="text" name="contClientResponsibility" maxlength="30" id="clientResponsibility" class="readonly input_100" required placeholder="거래처를 선택해주세요." style="caret-color: transparent !important;"/>
                                </td>
                                <td class="bg_gray weight_700 td_7 center">거래처 연락처</td>
                                <td class="p_lr3">
                                    <input type="text" name="contClientResCp" maxlength="30" id="clientCompanyPhone" class="readonly input_100" required placeholder="거래처를 선택해주세요." style="caret-color: transparent !important;"/>
                                </td>
                                <td class="bg_gray weight_700 td_7 center">거래처 이메일</td>
                                <td class="p_lr3">
                                    <input type="text" name="contClientResEmail" maxlength="30" id="clientResEmail" class="readonly input_100" required placeholder="거래처를 선택해주세요." style="caret-color: transparent !important;"/>
                                    <input type="hidden" name="contClientCode" maxlength="30" id="clientCode"/>
                                </td>
                            </tr>
                            <tr>
                            	<td class="bg_gray weight_700 td_8 center">거래처 사업장번호</td>
                                <td class="p_lr3">
                                    <input type="text" name="clientLicenseNumFk" maxlength="20" id="clientLicenseNum" class="readonly input_100" required placeholder="거래처를 선택해주세요." style="caret-color: transparent !important;"/>
                                </td>
                                <td class="bg_gray weight_700 td_7 center">발주일</td>
                                <td class="p_lr3">
                                    <input type="date" name="contOrderDate" maxlength="20" id="contOrderDate" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">납기일</td>
                                <td class="p_lr3">
                                    <input type="date" name="contDueDate" maxlength="20" id="contDueDate" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 td_7 center">비고</td>
                                <td class="p_lr3" colspan="3">
                                    <input type="text" name="contNote" maxlength="50" id="contNote" class="input_100" />
                                </td>                                
                            </tr>                            
                        </table>
                    
                        <div class="m_t10" style="position: relative; width: 100%; height: 35px">
                            <div class="regBtn" style="position: absolute; left: 50%; transform: translate(-50%,0)">
                                <button type="submit" name="conRegBtn" id= "conRegBtn" class="btn_blue" style="width:85px;">문서번호생성</button>
                                <button type="reset" class="btn_red">새로고침</button>
                            </div>
                            <div class="" style="position: absolute; right:0;">
                                <span class="weight_700" style="line-height: 50Zpx;">문서번호</span>
                                <input type="text" value="${contDocNum}" class="num_auto center" style ="color:#f00;" maxlength="20" readonly placeholder="계약서번호 자동 생성"/>
                            </div>
                        </div>
                            </form>
                    </div>
                    <div class="m_t10">
                        <div class="table_title">
                            <i class="fas fa-edit"></i>
                            계약서 상세 품목 등록
                        </div>
                        <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                           <strong>${contDocNum}</strong> 계약서에 <strong>품목</strong>을 등록합니다.
                        </div>
                         <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                           <strong>품목명</strong>을  검색하면<strong> 등록된 상품</strong>의 정보를 불러옵니다.
                        </div>
                        <form action="" id="contDReg" name="contDReg">
                        <div class="flex" >
                            <table class="input_list">
                                <tr>
                                    <td class="bg_gray weight_700 td_7 center">품목명</td>
                                    <td class="p_lr3">
                                    <div class="search_box">
                                        <input type="text" name="" id="prod_name" maxlength="20" class=" prod_name input_100" disabled required value="${cvo.contDpName}"/>
                                        <input type="hidden" id="" name="pIdFk" value="${cvo.pIdFk}">
                                        <i class="fas fa-search font_18" style="color: #959595;" id="search"></i>
                                    </div>
                                </td>
                                    <td class="bg_gray weight_700 td_7 center" >단위</td>
                                    <td class="p_lr3">
                                    	<input type="text" name="contDpUnit" maxlength="50" id="contDpUnit" class="input_100" readonly value="${cvo.contDpUnit}" style="background-color: #eff3f9;"/>
                                    </td>
                                    <td class="bg_gray weight_700 td_7 center">수량</td>
                                    <td class="p_lr3">
                                        <input type="text" name="contDpAmount" maxlength="50" id="contDpAmount" class="input_100" required placeholder="숫자만 입력해주세요"/>
                                    </td>
                                    <td class="bg_gray weight_700 td_7 center">단가</td>
                                    <td class="p_lr3">
                                        <input type="text" style="background-color: #eff3f9;" name="contDpSell" maxlength="50" id="pBuy" class="input_100" readonly value="${cvo.contDpSell}"/>
                                    </td>
                                    <td class="bg_gray weight_700 td_7 center">부가세</td>
                                    <td class="p_lr3 td_10">
                                        <select class="sel_100" name="contDVat" id="contDVat">
                                            <option value="포함">포함</option>
                                            <option value="미포함">미포함</option>
                                        </select>
                                    </td>
                                    <td class="bg_gray weight_700 td_7 center" >공급가액</td>
                                    <td class="p_lr3">
                                        <input type="text" name="" maxlength="50" style="background-color: #eff3f9;" id="pTotalPrice" class="input_100" value="" readonly />
                                    </td>
                                </tr>                     
                            </table>
                           			 <input type="hidden" value="${contID}" id="contID" name="contID"/>
                                    <input type="hidden" value="${contDocNum}" id="contDocNum" name="contDocNum"/>
                                    <input type="hidden" value="${cvo.contDpName}" id="contDpName" name="contDpName"/>
                                <button type="button" id="prodRegBtn" name="prodRegBtn" class="btn_blue" style="height: 40px;">등록</button>
                        </div>
                         </form>
                         <form id="searchfrm" name="searchfrm" method="post" action="${pageContext.request.contextPath}/admin/contract_detail_prod">
                         <input type="hidden" value="${contID}" id="contID" name="contID"/>
                         <input type="hidden" value="${contDocNum}" id="contDocNum" name="contDocNum"/>
                        <div class="search_wrap p_10 " id="search_wrap">
                            <div class="search_box center">
                                <select class="sel_box sel_100 td_7" name="searchOpt">
	                                <option value="p_name" <c:if test="${searchOpt eq 'p_name'}">selected</c:if>>품명</option>
                                </select>
                                <input value="${words}" type="text" class="input_box" name="words" id="words" style="width: 35%;">
                                <button type="button" class="btn_ivory" id="prod_srh">검색</button>
                            </div>
                            <div class="m_t10">
                                <table class="search_list">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>품명</th>
                                            <th>상품코드</th>
                                            <th>제품번호</th>
                                            <th>제조사</th>
                                            <th>선택</th>
                                        </tr>
                                    </thead>
                                    <tbody class="plist">
                                    <c:forEach var="p" items="${pList}">
                                        <tr>
                                            <td>${p.pId}</td>
                                            <td>${p.pName}</td>
                                            <td>${p.pCode}</td>
                                            <td>${p.pModelnum}</td>
                                            <td>${p.pBrand}</td>
                                            <td> <button type="button" id="" class="proc_sel_btn s_btn_gray" onclick="location.href='${pageContext.request.contextPath}/admin/contract_detail_list?contID=${contID}&contDpName=${p.pName}'">선택</button> </td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                    <tbody id="plist"></tbody>
                                </table>
                            </div>
                        </div>
                        </form>
                        <table class="list_table m_t20">
                            <thead>
                                <tr>
                                    <th class="td_5">번호</th>
                                    <th>문서번호</th>
                                    <th>품목명</th>
                                    <th>품목코드</th>
                                    <th>수량</th>
                                    <th>단위</th>
                                    <th>규격</th>
                                    <th>단가</th>
                                    <th>부가세</th>
                                    <th>공급가액</th>
                                    <th class="td_3 center">
                                        비고
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty list}">
                           		<tr>
                           			<td class="weight_700" colspan="11">등록된 품목이 없습니다.</td>
                           		<tr>
                           	</c:if>
                            	<c:forEach var="contd" items="${list}">
                                <tr>
                                    <td>${contd.contDID}</td>
                                    <td>${contd.contDdocNumFk}</td>
                                    <td>${contd.contDpName}</td>
                                    <td>${contd.pCode}</td>
                                    <td>
                                    	<fmt:formatNumber value="${contd.contDpAmount}" pattern="#,###"/>
                                    </td>
                                    <td>${contd.contDpUnit}</td>
                                    <td>${contd.pSize}</td>
                                    <td>
                                    	<fmt:formatNumber value="${contd.pBuy}" pattern="#,###"/>
                                    </td>
                                    <td>${contd.contDVat}</td>
                                    <td>
                                    	<fmt:formatNumber value="${contd.pBuy * contd.contDpAmount}" pattern="#,###"/>
                                    </td>
                                    <td>
                                        <button class="s_btn_red white_s_no" type="button" onClick="contDDel(${contd.contDID})">삭제</button>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<script src="${pageContext.request.contextPath}/js/contract.js"></script>
<script>

$("#prod_srh").click(function() {
	searchfrm();
});

$("#prodRegBtn").click(function(){
	contDReg();
});
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>