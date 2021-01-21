<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BOMnProcess.css">

<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<!-- 읽기 권한 처리 -->
<c:if
	test="${sessionScope.empAuth ne 10 && sessionScope.empDepartment ne '900'}">
	<script>
		alert("생산과 외의 사용자는 접근할 수 없는 페이지입니다.\n관리자에게 문의하세요.");
		history.go(-1);
	</script>
</c:if>
<!-- 읽기 권한 처리 -->
<div class="page_wrap bg_white noto font_14">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">생산/제조관리<i class="fas fa-chevron-right p_lr10"></i>2. 제품별 소요자재 및 공정관리</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="table_wrap_box">
                        <div class="table_title">
                            <i class="fas fa-edit"></i>
                            제품정보
                        </div>
                        <div class="list_comment font_14 m_b10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            제품정보는 등록된 <strong>제품명</strong>으로 검색이 가능합니다.
                        </div>
                        <table class="user_table_list">
                            <thead>
								<tr class="weight_700">
									<td class="td_20 bg_gray">제품명</td>
									<td class="td_5 bg_gray">제품코드</td>
									<td class="td_10 bg_gray">제조사</td>
									<td class="td_10 bg_gray">모델번호</td>
									<td class="td_5 bg_gray">대분류</td>
									<td class="td_5 bg_gray">소분류</td>
									<td class="td_5 bg_gray">기준단위</td>
									<td class="td_10 bg_gray">규격</td>
									<td class="td_10 bg_gray">구매단가</td>
									<td class="td_10 bg_gray">판매단가</td>
									<td class="td_10 bg_gray">비고</td>
								</tr>
	                        </thead>
	                        <tbody>
								<tr>
									<td id="pName"></td>
									<td id="pCode"></td>
									<td id="pBrand"></td>
									<td id="pModelnum"></td>
									<td id="pType"></td>
									<td id="pGroup"></td>
									<td id="pUnit"></td>
									<td id="pSize"></td>
									<td id="pBuy"></td>
									<td id="pSell"></td>
									<td id="pNote"></td>
								</tr>
	                        </tbody>
                        </table>
                        <div class="search_wrap p_10 " id="search_wrap" style="border:1px solid #ececec;">
                        	<form id="" name="" action="">
				                <div class="search_grp flex m_t10">
				                	<select class="search_sel_box" id="" name="searchOpt">
				                    	<option value="p_name">제품명</option>
				                    	<option value="p_code">제품코드</option>
				                    	<option value="p_brand">제조사</option>
				                    	<option value="all">전체검색</option>
				                	</select>
				                	<input type="text" class="m_lr5 p_l5" id="words" name="words" value="" />
				                    <button type="submit" class="search_btn"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
				                </div>
			                </form>
                            <div class="m_t10 w_100">
                                <table class="user_table_list">
                                    <thead>
                                        <tr>
											<th class="td_20">제품명</th>
											<th class="td_5">제품코드</th>
											<th class="td_10">제조사</th>
											<th class="td_10">모델번호</th>
											<th class="td_5">대분류</th>
											<th class="td_5">소분류</th>
											<th class="td_5">기준단위</th>
											<th class="td_10">규격</th>
											<th class="td_10">구매단가</th>
											<th class="td_10">판매단가</th>
											<th class="td_10">선택</th>
										</tr>
                                    </thead>
                                    <tbody>
                                   		<c:if test="${empty pList}">
                                    		<tr>
                                    			<td colspan="11">등록된 제품이 없습니다.</td>
                                    		</tr>
                                    	</c:if>
                                    	<c:forEach items="${pList}" var="plist">
	                                        <tr>
	                                            <td>${plist.pName}</td>
	                                            <td>${plist.pCode}</td>
	                                            <td>${plist.pBrand}</td>
	                                            <td>${plist.pModelnum}</td>
	                                            <td>${plist.pType}</td>
	                                            <td>${plist.pGroup}</td>
	                                            <td>${plist.pUnit}</td>
	                                            <td>${plist.pSize}</td>
	                                            <td>
	                                            	<fmt:formatNumber value="${plist.pBuy}" pattern="#,###,###"/>
	                                            <td>
	                                            	<fmt:formatNumber value="${plist.pSell}" pattern="#,###,###"/>
	                                            <td>
	                                                <button type="button" id="" class="proc_sel_btn s_btn_gray" onClick="selProductOne('${plist.pId}', '${plist.pName}','${plist.pCode}', '${plist.pBrand}', '${plist.pModelnum}', '${plist.pType}', '${plist.pGroup}', '${plist.pUnit}', '${plist.pSize}', '${plist.pBuy}', '${plist.pSell}', '${plist.pNote}')">선택</button>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="table_title m_t10">
                            <i class="fas fa-edit"></i>
                            소요자재입력
                        </div>
                        <div class="flex space_between">
                            <div class="w_100 list_comment font_14 m_b10 flex" style="padding: 10px 20px; background-color: #f9f9f9;">
                                <span>제품생산에 필요한 <strong>원자재</strong>의 <strong>정보</strong>와 <strong>수량</strong>을 입력해주세요.</span>

                            </div>
                            <div class="">
                                <button type="button" id="BOMInsertBtn" class="btn_blue m_l3 m_t3">자재추가</button>
                            </div>
                        </div>
                        <form class="flex" method="post" id="BOMInsert" name="" action="">
                            <table class="m_b10 user_table_list">
                                <tr class="weight_700">
                                    <td class="bg_gray">원자재명</td>
                                    <td class="td_10 bg_gray">원자재코드</td>
                                    <td class="td_10 bg_gray">제조사</td>
                                    <td class="td_10 bg_gray">모델번호</td>
                                    <td class="td_5 bg_gray">단위</td>
                                    <td class="td_10 bg_gray">규격</td>
                                    <td class="td_10 bg_gray">수량</td>
                                    <td class="td_10 bg_gray">구매단가</td>
                                    <td class="td_15 bg_gray">비고</td>
                                </tr>
                                <tr>
                                	<td class="bg_white p_lr3">
                                		<select class="sel_100" id="selBOM" name="pmIdFk">
                                			<c:forEach items="${bList}" var="blist">
                                				<option value="${blist.pId}">${blist.pName}</option>
                                			</c:forEach>
                                		</select>
                                	</td>
                                	<td class="bg_white" id="bCode"></td>
                                	<td class="bg_white" id="bBrand"></td>
                                	<td class="bg_white" id="bModelnum"></td>
                                	<td class="bg_white" id="bUnit"></td>
                                	<td class="bg_white" id="bSize"></td>
                                	<td class="bg_white p_lr3" id="">
                                		<input type="text" class="input_100" id="bAmount" name="pmAmount" value="" placeholder="수량을 입력해주세요" />
                                	</td>
                                	<td class="bg_white" id="bBuy"></td>
                                	<td class="bg_white" id="bNote"></td>
                                </tr>
                            </table>
                            <input type="hidden" class="pId" id="pIdFk" name="pIdFk" value="" />
                        </form>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="user_table_list">
                                <thead>
                                    <tr>
                                        <th class="td_2">번호</th>
                                        <th class="td_18">제품명</th>
                                        <th class="td_10">제품코드</th>
                                        <th>원자재명</th>
                                        <th class="td_10">원자재코드</th>
                                        <th class="td_5">단위</th>
                                        <th class="td_10">규격</th>
                                        <th class="td_10">수량</th>
                                        <th class="td_10">구매단가</th>
                                        <th class="td_10">금액</th>
                                        <th class="td_5">관리</th>
                                    </tr>
                                </thead>
                                <tbody id="bodList">
                                	<tr>
                                		<td colspan="10">입력된 소요자재가 없습니다.<td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="table_title m_t10">
                            <i class="fas fa-edit"></i>
                            공정입력
                        </div>
                        <div class="flex space_between">
                            <div class="w_100 list_comment font_14 m_b10 flex" style="padding: 10px 20px; background-color: #f9f9f9;">
                                <span>제품 생산에 필요한 공정을 입력해주세요.</span>

                            </div>
                            <div class="">
                                <button type="button" class="btn_blue m_l3 m_t3" id="setProcessBtn" name="" onClick="setProcessOne();">공정추가</button>
                            </div>
                        </div>
                        	<form id="setProcessOneFrm" name="" method="post" action="">
		                        <table class="m_b10 input_list">
		                            <tr>
		                                <td class="bg_gray weight_700 center td_7">워크센터</td>
		                                <td class="p_lr3 td_10">
		                                    <select class="sel_100" id="wcId" name="wcId">
		                                    	<c:forEach items="${wcList}" var="wclist">
		                                    		<option value="${wclist.wcId}">${wclist.wcName}</option>
		                                    	</c:forEach>
		                                    </select>
		                                </td>
		                                <td class="bg_gray weight_700 center td_7">공정순서</td>
		                                <td class="p_lr3 td_10">
		                                    <select class="sel_100" id="procSeq">
		                                        <option value="1">1</option>
		                                        <option value="2">2</option>
		                                        <option value="3">3</option>
		                                        <option value="4">4</option>
		                                        <option value="5">5</option>
		                                    </select>
		                                </td>
		                                <td class="bg_gray weight_700 center td_7">공정이름</td>
		                                <td class="p_lr3">
		                                    <input type="text" name="procName" maxlength="15" id="procName" class="input_100" placeholder="공정이름을 입력해주세요" required />
		                                </td>
		                                
		                                <td class="bg_gray weight_700 center td_7">작업인원수</td>
		                                <td class="p_lr3">
		                                    <input type="text" name="procWorkers" maxlength="15" id="procWorkers" class="input_100" placeholder="작업인원을 입력해주세요" required />
		                                </td>
		                                <td class="bg_gray weight_700 center td_7">작업시간(시간)</td>
		                                <td class="p_lr3">
		                                    <input type="text" name="procWorkingTime" maxlength="15" id="procWorkingTime" class="input_100" placeholder="작업시간을 입력해주세요" required />
		                                </td>
		                                <td class="bg_gray weight_700 center td_7">담당자</td>
		                                <td class="p_lr3">
		                                    <input type="text" name="" maxlength="" id="" class="input_100" value="${sessionScope.empName} ${sessionScope.empPositionName}" required readonly />
		                                    <input type="hidden" name="empIdFk" maxlength="" id="empIdFk" class="input_100" value="${sessionScope.empId}" />
		                                </td>
		                            </tr>
		                        </table>
                        	</form>
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="user_table_list m_b30">
                                <thead>
                                    <tr>
                                        <th class="td_2">번호</th>
                                        <th class="td_18">제품명</th>
                                        <th class="td_10">제품코드</th>
                                        <th class="td_7">공정순서</th>
                                        <th>공정</th>
                                        <th>워크센터</th>
                                        <th>작업인원수</th>
                                        <th>작업시간(H)</th>
                                        <th>담당부서</th>
                                        <th>담당자</th>
                                        <th>담당자연락처</th>
                                        <th class="td_5 center">삭제</th>
                                    </tr>
                                </thead>
                                <tbody id="processList">
                                	<tr>
                                		<td colspan="11">입력된 공정이 없습니다.<td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
       	<div>
       		<%@ include file="/WEB-INF/views/erp/user/include/USER_FOOTER.jsp"%>
       	</div>
<script src="${pageContext.request.contextPath}/js/product.js"></script>
<script>
	function selProductOne(pId, pName, pCode, pBrand, pModelnum, pType, pGroup, pUnit, pSize, pBuy, pSell, pNote) {
		$("#pName").html(pName);
		$("#pCode").html(pCode);
		$("#pBrand").html(pBrand);
		$("#pModelnum").html(pModelnum);
		$("#pType").html(pType);
		$("#pGroup").html(pGroup);
		$("#pUnit").html(pUnit);
		$("#pSize").html(pSize);
		$("#pBuy").html(pBuy);
		$("#pSell").html(pSell);
		$("#pNote").html(pNote);
		$(".pId").val(pId);
		getBOMList();
		getProcessList();
	}

    $(function() {
    	$("#bAmount, #procWorkers, #procWorkingTime").keyup(function () {
            //정규표현식 = 숫자만 사용가능
            $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
        });
        $(".proc_sel_btn").click(function() {
            $("#search_wrap").hide();
        });
        $("#selBOM").click(function() {
			getBtypeList();
        });
        $("#BOMInsertBtn").click(function() {
			BOMInsert();
        });
    });
</script>
