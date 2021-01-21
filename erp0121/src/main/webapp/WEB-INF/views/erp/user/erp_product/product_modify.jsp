<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_button_style.css">
</head>
<div class="page_wrap bg_white noto font_14">
	<div class="main_right bg_white">
		<div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
			<h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>4. 상품정보수정</h2>
		</div>
		<div class="main_right_info" style="padding: 30px 20px;">
			<div class="table_wrap_box">
			<form id="" name="" method="POST" action="${pageContext.request.contextPath}/user/product_modify">
				<input type="hidden" name="pId" value="${pvo.pId}" />
				<table class="input_list">
					<tr>
						<td class="bg_gray weight_700 td_10 center">대분류</td>
						<td class="p_lr3">
							<select class="sel_100" name="pType">
								<option value="A">제품</option>
								<option value="B" <c:if test="${pvo.pType eq 'B'}">selected</c:if>>원자재</option>
								<option value="C" <c:if test="${pvo.pType eq 'C'}">selected</c:if>>상품</option>
								<option value="D" <c:if test="${pvo.pType eq 'D'}">selected</c:if>>비품</option>
							</select>
						</td>
						<td class="bg_gray weight_700 td_10 center">소분류</td>
						<td class="p_lr3">
							<select class="sel_100" name="pGroup">
								<option value="01">컴퓨터</option>
								<option value="02" <c:if test="${pvo.pGroup eq '02'}">selected</c:if>>전자기기</option>
								<option value="03" <c:if test="${pvo.pGroup eq '03'}">selected</c:if>>노트북</option>
								<option value="04" <c:if test="${pvo.pGroup eq '04'}">selected</c:if>>사무용품</option>
								<option value="05" <c:if test="${pvo.pGroup eq '05'}">selected</c:if>>비품</option>
							</select>
						</td>
						<td class="bg_gray weight_700 td_10 center">제조사</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="" name="pBrand" maxlength="50" required value="${pvo.pBrand}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">모델번호</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="" name="pModelnum" minlength="5" placeholder="최소 5자이상 입력해주세요." required value="${pvo.pModelnum}" />
						</td>
					</tr>
					<tr>
						<td class="bg_gray weight_700 td_10 center">품명</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="" name="pName" maxlength="100" required value="${pvo.pName}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">기준단위</td>
						<td class="p_lr3">
							<select class="sel_100" name="pUnit">
									<option value="EA">EA</option>
									<option value="KG" <c:if test="${pvo.pUnit eq 'KG'}">selected</c:if>>KG</option>
									<option value="SET" <c:if test="${pvo.pUnit eq 'SET'}">selected</c:if>>SET</option>
							</select>
						</td>
						<td class="bg_gray weight_700 td_10 center">규격</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id=""  name="pSize" maxlength="20" required value="${pvo.pSize}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">통화</td>
						<td class="p_lr3">
							<select class="sel_100" id="" name="pCurrency">
									<option value="1">KRW</option>
									<option value="2" <c:if test="${pvo.pCurrency eq '2'}">selected</c:if>>USD</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="bg_gray weight_700 td_10 center">구매단가</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="pBuy" name="pBuy" maxlength="20" required value="${pvo.pBuy}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">판매단가</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="pSell" name="pSell" maxlength="20" required value="${pvo.pSell}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">부가세적용</td>
						<td class="p_lr3">
							<input type="radio" class="v_middle" id="" name="pTaxuse" value="Y" <c:if test="${pvo.pTaxuse eq 'Y'}">checked</c:if> />
							<label for="Y" class="v_middle m_r10">적용</label>
							<input type="radio" class="v_middle" id="" name="pTaxuse" value="N" <c:if test="${pvo.pTaxuse eq 'N'}">checked</c:if> />
							<label for="N" class="v_middle m_r10">미적용</label>
						</td>
						<td class="bg_gray weight_700 td_10 center">부가세</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="pTax" name="pTax" maxlength="50" required value="${pvo.pTax}" />
						</td>
					</tr>
					<tr>
						<td class="bg_gray weight_700 td_10 center">상품코드</td>
						<td class="p_lr3">
							<input type="text" class="input_100" id="" name="" placeholder="상품코드는 상품등록시 자동생성됩니다." required readonly value="${pvo.pCode}" />
						</td>
						<td class="bg_gray weight_700 td_10 center">거래처명</td>
						<td class="p_lr3">
							<select class="sel_100" id="accountList" name="accountIdFk">
								<c:if test="${cCount == 0}">
									<option value="0">거래처를 등록해주세요</option>
								</c:if>
								<c:forEach items="${cList}" var="clist">
									<option value="${clist.clientId}" <c:if test="${clist.clientId eq pvo.accountIdFk}">selected</c:if>>${clist.clientCompany}</option>
								</c:forEach>
							</select>
						</td>
						<td class="bg_gray weight_700 td_10 center">비고</td>
						<td class="p_lr3" colspan="5">
							<input type="text" class="input_100" id="" name="pNote" maxlength="100" placeholder="비고는 100자 이내로 입력해주세요" value="${pvo.pNote}" />
						</td>
					</tr>
				</table>
				<div class="btn-grp center m_t20">
					<button type="submit" class="btn_blue">정보수정</button>
					<button type="button" class="btn_red" onClick="window.location.href='${pageContext.request.contextPath}/user/product_list'">목록으로</button>
				</div>
			</form>
			<div class="m_t20">
				<div class="list_comment font_14 m_tb10 p_10" style="background-color: #f9f9f9;">
					최근 등록한 <strong>10개</strong>의 상품만 보여집니다.
				</div>
				<div class="w_100 white_s_no overflow_x_auto">
					<table class="user_table_list m_b30">
						<thead>
							<tr>
								<th class="td_3">번호</th>
								<th class="td_15">품명</th>
								<th>상품코드</th>
								<th>제조사</th>
								<th>거래처명</th>
								<th>모델번호</th>
								<th>대분류</th>
								<th>소분류</th>
								<th>기준단위</th>
								<th>규격</th>
								<th class="td_10">구매단가</th>
								<th class="td_10">판매단가</th>
								<th class="td_15">비고</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
	                        <c:if test="${ listCnt == 0 }">
	                        	<tr>
	                        		<td class="weight_700" colspan="14">등록된 상품이 없습니다.</td>
	                        	<tr>
	                        </c:if>
								<c:forEach items="${pList}" var="plist" varStatus="status">
									<tr>
										<td>${10 - status.index}</td>
										<td>${plist.pName}</td>
										<td>${plist.pCode}</td>
										<td>${plist.pBrand}</td>
										<td>${plist.clientCompany}</td>
										<td>${plist.pModelnum}</td>
									<td>
										<c:choose>
											<c:when test="${plist.pType eq 'A'}">제품</c:when>
											<c:when test="${plist.pType eq 'B'}">원자재</c:when>
											<c:when test="${plist.pType eq 'C'}">상품</c:when>
											<c:when test="${plist.pType eq 'D'}">비품</c:when>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${plist.pGroup eq '01'}">컴퓨터</c:when>
											<c:when test="${plist.pGroup eq '02'}">전자기기</c:when>
											<c:when test="${plist.pGroup eq '03'}">스마트폰</c:when>
											<c:when test="${plist.pGroup eq '04'}">사무용품</c:when>
											<c:when test="${plist.pGroup eq '05'}">비품</c:when>
										</c:choose>
									</td>
									<td>${plist.pUnit}</td>
									<td>${plist.pSize}</td>
									<td>
										<fmt:formatNumber value="${plist.pBuy}" pattern="#,###"/>
									</td>
									<td>
										<fmt:formatNumber value="${plist.pSell}" pattern="#,###"/>
									</td>
									<td>${plist.pNote}</td>
									<td>
										<button type="button" class="s_btn_blue" onClick="window.location.href='${pageContext.request.contextPath}/user/product_modify?pId=${plist.pId}'">수정</button>
										<button type="button" class="s_btn_red" onClick="deleteProductOne(${plist.pId});">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>
	</div>
<script src="${pageContext.request.contextPath}/js/product.js"></script>
<script>
	$(function() {
		vatCalculate();
	});
</script>