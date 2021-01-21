<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
<style>
    td {
        border: 1px solid #e7e7e7;
    }
</style>
<body>
	<div class="page_wrap bg_white noto font_14">
	    
	    <div class="page_main flex space_between">
	        <div class="main_right bg_white" style="width: 100%;">
	            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
	                <h2 class="font_18">영업관리<i class="fas fa-chevron-right p_lr10"></i>4. 거래처입력</h2>
	            </div>
	            <div class="main_right_info" style="padding: 30px 20px;">
	                <form id="frm" method="POST" action="${pageContext.request.contextPath}/admin/client_reg">
	                    <div class="table_grp flex space_between">
	                        <div class="left_tbl_grp m_r10" style="width: 25%;">
	                            <table>
	                                <tr>
	                                    <td class="bg_gray weight_700 td_40 center">거래처코드</td>
	                                    <td class="p_lr3">
	                                        <input type="text" id="clientCode" name="clientCode" maxlength="10" id="" class="input_100" placeholder="자동생성" readonly />
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="p_lr3 center bg_gray" colspan="2">
	                                    	<span>거래처 코드는 입력완료시, 자동으로 생성됩니다.</span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="bg_gray weight_700 center">거래처 거래여부</td>
	                                    <td class="p_lr3">
	                                        <select id="clientUseState" name="clientUseState" class="input_100">
	                                            <option value="Y">Y</option>
	                                            <option value="N">N</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                            </table>
	                            <table style="background-color: #eff3f9;">
	                                <tr class="weight_700 center">
	                                    <td colspan="2">전자세금계산서</td>
	                                </tr>
	                                <tr class="weight_700 center">
	                                    <td class="td_40">수신메일주소</td>
	                                    <td class="p_lr3">
	                                        <input type="text" name="clientTaxEmail" id="clientTaxEmail" class="input_100" tabindex="20" maxlength="50" />
	                                    </td>
	                                </tr>
	                                <tr class="weight_700 center">
	                                    <td>담당자명</td>
	                                    <td class="p_lr3">
	                                        <input type="text" name="clientTaxResponsibility" id="clientTaxResponsibility" class="input_100" tabindex="21" maxlength="15" />
	                                    </td>
	                                </tr>
	                                <tr class="weight_700 center">
	                                    <td>전화번호</td>
	                                    <td class="p_lr3">
	                                        <input type="text" name="clientTaxCompanyPhone" id="clientTaxCompanyPhone" class="input_100" tabindex="22" maxlength="12" />
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                        <table>
	                            <tr>
	                                <td class="bg_gray weight_700 td_15 center">거래처명</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompany" id="clientCompany" class="input_100" required tabindex="1" maxlength="30" />
	                                </td>
	                                <td class="bg_gray weight_700 td_15 center">사업자번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientLicenseNum" id="clientLicenseNum" class="input_100" placeholder="" required tabindex="2" maxlength="12" />
	                                </td>
	                                <td class="bg_gray weight_700 td_15 center">대표자명</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCeoName" id="clientCeoName" class="input_100" required tabindex="3" maxlength="15" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">업태</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientBusinessCondition" id="clientBusinessCondition" class="input_100" required tabindex="4" maxlength="30" />
	                                </td>
	                                <td class="bg_gray weight_700 center">종목</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientBusinessType" id="clientBusinessType" class="input_100" required tabindex="5" maxlength="50" />
	                                </td>
	                                <td class="bg_gray weight_700 center">등록일자</td>
	                                <td class="p_lr3">
	                                    <input type="date" max="9999-12-31" name="clientRegdate" id="clientRegdate" class="input_100" required tabindex="6" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">전화번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyPhone" id="clientCompanyPhone" class="input_100" required tabindex="7" maxlength="12" />
	                                </td>
	                                <td class="bg_gray weight_700 center">팩스번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyFax" id="clientCompanyFax" class="input_100" tabindex="8" maxlength="12" />
	                                </td>
	                                <td class="bg_gray weight_700 center">홈페이지</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyPage" id="clientCompanyPage" class="input_100" tabindex="9" maxlength="100" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">우편번호</td>
	                                <td class="p_lr3" onClick="execDaumPostcode();">
	                                    <input type="text" name="clientPost" id="empPost" class="input_100" required tabindex="10" maxlength="5" placeholder="우편번호를 입력해주세요" readonly/>
	                                </td>
	                                <td class="bg_gray weight_700 center">주소</td>
	                                <td class="p_lr3" colspan="3">
	                                    <input type="text" name="clientAddress" id="empAddress" maxlength="20"class="input_100" required tabindex="11" maxlength="100" readonly />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">실거주지 국내/외 여부</td>
	                                <td class="p_lr3">
	                                    <select class="input_100" name="clientNation" id="clientNation" tabindex="12">
	                                        <option value="0">국내</option>
	                                        <option value="1">국외</option>
	                                    </select>
	                                </td>
	                                <td class="bg_gray weight_700 center">상세주소</td>
	                                <td class="p_lr3" colspan="3">
	                                    <input type="text" name="clientDetailAddress" id="clientDetailAddress" class="input_100" required tabindex="13" maxlength="100" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">거래담당자</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResponsibility" id="clientResponsibility" class="input_100" required tabindex="14" maxlength="15" />
	                                </td>
	                                <td class="bg_gray weight_700 center">담당자 전화번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResCp" id="clientResCp" class="input_100" required tabindex="15" maxlength="13" />
	                                </td>
	                                <td class="bg_gray weight_700 center">담당자 이메일</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResEmail" id="clientResEmail" class="input_100" required tabindex="16" maxlength="50" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">결제방법</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientPaymentType" id="clientPaymentType" class="input_100" tabindex="17" maxlength="20" />
	                                </td>
	                                <td class="bg_gray weight_700 center">취급품목</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientHandling" id="clientHandling" class="input_100" required tabindex="18" maxlength="50" />
	                                </td>
	                                <td class="bg_gray weight_700 center">비고</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientNote" id="clientNote" class="input_100" tabindex="19" maxlength="100" />
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="btn-grp center m_t30">
	                        <button type="submit" class="btn_blue" tabindex="23">거래처등록</button>
	                        <button type="reset" class="btn_red" tabindex="24">새로고침</button>
	                        <button type="button" onClick="location.href='${pageContext.request.contextPath}/admin/client_list'" class="btn_ivory">목록으로</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
	$(function(){
		$("#frm").submit(function(){
			alert("거래처 등록을 완료했습니다.");
		});
	});
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>