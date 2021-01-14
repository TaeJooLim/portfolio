<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>

<div class="page_wrap bg_white noto font_14">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>7. 품질검사</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="input_list">
                <table class="list">
                    <tr>
	                    <td class="bg_gray weight_700 td_10 center">거래처</td>
	                    <td class="p_lr3 td_15 center">${cvo.contClientCompany}</td>
	                    <td class="bg_gray weight_700 td_10 center">발주일</td>
	                    <td class="p_lr3 td_15 center">${cvo.contOrderDate}</td>
	                    <td class="bg_gray weight_700 td_10 center">납기일</td>
	                    <td class="p_lr3 td_15 center">${cvo.contDueDate}</td>
	                    <td class="bg_gray weight_700 td_10 center">담당자</td>
	                    <td class="p_lr3 td_15 center">${cvo.contDepartName} ${cvo.contEmpName} ${cvo.contPositionName}</td>
	                </tr>
                </table>
            </div>
            <div class="m_t10">
                <div class="">
                    <div class="m_b5">
                        <div class="list_comment font_12 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            문서번호 : <strong>${contDocNum}</strong>
                        </div>
                    </div>

                    <table class="list">
                        <thead>
                            <tr>
                                <th class="td_5">번호</th>
                                <th>품명</th>
                                <th>단위</th>
                                <th>수량</th>
                                <th class="td_14" colspan="2">공정1</th>
                                <th class="td_14" colspan="2">공정2</th>
                                <th class="td_14" colspan="2">공정3</th>
                                <th class="td_14" colspan="2">공정4</th>
                                <th class="td_14" colspan="2">공정5</th>
                                <th class="td_5">출고여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${pList}" var="plist" varStatus="status">
                        		<tr>
                        			<td>${status.index + 1}</td>
                        			<td>${plist.prodPName}</td>
                        			<td>${plist.prodPUnit}</td>
                        			<td>${plist.prodPAmount}</td>
                        			<td class="td_7">${plist.prodProcessName1}</td>
                        			<td class="p_lr3">
                        				<c:choose>
                        					<c:when test="${plist.prodProcess1 eq 'N' || plist.prodProcess1 eq 'Y'}">
		                        				<select class="sel_100" id="" name="" onChange="updateQcOne(this.value, 1, ${plist.prodId});" <c:if test="${plist.prodRelease eq 'Y'}">disabled</c:if>>
		                        					<option value="N">FAIL</option>
		                        					<option value="Y" <c:if test="${plist.prodProcess1 eq 'Y'}">selected</c:if>>PASS</option>
		                        				</select>
                        					</c:when>
                        					<c:otherwise></c:otherwise>
                        				</c:choose>
                        			</td>
                        			<td class="td_7">${plist.prodProcessName2}</td>
                        			<td class="p_lr3">
                        				<c:choose>
                        					<c:when test="${plist.prodProcess2 eq 'N' || plist.prodProcess2 eq 'Y'}">
		                        				<select class="sel_100" id="" name="" onChange="updateQcOne(this.value, 2, ${plist.prodId});" <c:if test="${plist.prodRelease eq 'Y'}">disabled</c:if>>
		                        					<option value="N">FAIL</option>
		                        					<option value="Y" <c:if test="${plist.prodProcess2 eq 'Y'}">selected</c:if>>PASS</option>
		                        				</select>
                        					</c:when>
                        					<c:otherwise></c:otherwise>
                        				</c:choose>
                        			</td>
                        			<td class="td_7">${plist.prodProcessName3}</td>
                        			<td class="p_lr3">
                        				<c:choose>
                        					<c:when test="${plist.prodProcess3 eq 'N' || plist.prodProcess3 eq 'Y'}">
		                        				<select class="sel_100" id="" name="" onChange="updateQcOne(this.value, 3, ${plist.prodId});" <c:if test="${plist.prodRelease eq 'Y'}">disabled</c:if>>
		                        					<option value="N">FAIL</option>
		                        					<option value="Y" <c:if test="${plist.prodProcess3 eq 'Y'}">selected</c:if>>PASS</option>
		                        				</select>
                        					</c:when>
                        					<c:otherwise></c:otherwise>
                        				</c:choose>
                        			</td>
                        			<td class="td_7">${plist.prodProcessName4}</td>
                        			<td class="p_lr3">
                        				<c:choose>
                        					<c:when test="${plist.prodProcess4 eq 'N' || plist.prodProcess4 eq 'Y'}">
		                        				<select class="sel_100" id="" name="" onChange="updateQcOne(this.value, 4, ${plist.prodId});" <c:if test="${plist.prodRelease eq 'Y'}">disabled</c:if>>
		                        					<option value="N">FAIL</option>
		                        					<option value="Y" <c:if test="${plist.prodProcess4 eq 'Y'}">selected</c:if>>PASS</option>
		                        				</select>
                        					</c:when>
                        					<c:otherwise></c:otherwise>
                        				</c:choose>
                        			</td>
                        			<td class="td_7">${plist.prodProcessName5}</td>
                        			<td class="p_lr3">
                        				<c:choose>
                        					<c:when test="${plist.prodProcess5 eq 'N' || plist.prodProcess5 eq 'Y'}">
		                        				<select class="sel_100" id="" name="" onChange="updateQcOne(this.value, 5, ${plist.prodId});" <c:if test="${plist.prodRelease eq 'Y'}">disabled</c:if>>
		                        					<option value="N">FAIL</option>
		                        					<option value="Y" <c:if test="${plist.prodProcess5 eq 'Y'}">selected</c:if>>PASS</option>
		                        				</select>
                        					</c:when>
                        					<c:otherwise></c:otherwise>
                        				</c:choose>
                        			</td>
                        			<td>
                        				<c:choose>
                        					<c:when test="${plist.prodRelease eq 'N'}">
                        						<button type="button" class="btn_red">미출고</button>
                        					</c:when>
                        					<c:when test="${plist.prodRelease eq 'Y'}">
                        						<button type="button" class="btn_blue">출고완료</button>
                        					</c:when>
                        					<c:otherwise>
                        					</c:otherwise>
                        				</c:choose>
                        			</td>
                        		</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/js/produce.js"></script>
<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>