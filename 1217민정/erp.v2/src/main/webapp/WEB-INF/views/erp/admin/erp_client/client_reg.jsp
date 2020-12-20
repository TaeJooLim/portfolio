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
	<div class="page_wrap bg_white noto font_14" style="height: 100vh;">
	    
	    <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
	        <div class="main_right bg_white" style="width: 100%;">
	            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
	                <h2 class="font_18">거래처등록</h2>
	            </div>
	            <div class="main_right_info" style="padding: 30px 20px;">
	                <form method="POST" action="${pageContext.request.contextPath}/admin/client_reg">
	                    <div class="table_grp flex space_between">
	                        <div class="left_tbl_grp m_r10" style="width: 25%;">
	                            <table>
	                                <tr>
	                                    <td class="bg_gray weight_700 td_40 center">거래처코드</td>
	                                    <td class="p_lr3">
	                                        <input type="text" id="clientCode" name="clientCode" maxlength="20" id="" class="input_100" placeholder="임의생성불가" readonly />
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="p_lr3" colspan="2">
	                                    	<span>거래처 코드는 임의로 작성하실 수 없습니다.</span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="bg_gray weight_700 center">사용여부</td>
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
	                                        <input type="text" name="clientTaxEmail" id="clientTaxEmail" class="input_100" />
	                                    </td>
	                                </tr>
	                                <tr class="weight_700 center">
	                                    <td>담당자명</td>
	                                    <td class="p_lr3">
	                                        <input type="text" name="clientTaxResponsibility" id="clientTaxResponsibility" class="input_100" />
	                                    </td>
	                                </tr>
	                                <tr class="weight_700 center">
	                                    <td>전화번호</td>
	                                    <td class="p_lr3">
	                                        <input type="text" name="clientTaxCompanyPhone" id="clientTaxCompanyPhone" class="input_100" />
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                        <table>
	                            <tr>
	                                <td class="bg_gray weight_700 td_15 center">거래처명</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompany" id="clientCompany" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 td_15 center">사업자번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientLicenseNum" id="clientLicenseNum" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 td_15 center">대표자명</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCeoName" id="clientCeoName" class="input_100" required />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">업태</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientBusinessCondition" id="clientBusinessCondition" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">종목</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientBusinessType" id="clientBusinessType" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">등록일자</td>
	                                <td class="p_lr3">
	                                    <input type="date" name="clientRegdate" id="clientRegdate" class="input_100" required />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">전화번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyPhone" id="clientCompanyPhone" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">팩스번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyFax" id="clientCompanyFax" class="input_100" />
	                                </td>
	                                <td class="bg_gray weight_700 center">홈페이지</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientCompanyPage" id="clientCompanyPage" class="input_100" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">우편번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientPost" id="clientPost" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">주소</td>
	                                <td class="p_lr3" colspan="3">
	                                    <input type="text" name="clientAddress" id="clientAddress" maxlength="20"class="input_100" required />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">실거주지 국내/외 여부</td>
	                                <td class="p_lr3">
	                                    <select class="input_100" name="clientNation" id="clientNation">
	                                        <option value="0">국내</option>
	                                        <option value="1">국외</option>
	                                    </select>
	                                </td>
	                                <td class="bg_gray weight_700 center">상세주소</td>
	                                <td class="p_lr3" colspan="3">
	                                    <input type="text" name="clientDetailAddress" id="clientDetailAddress" class="input_100" required />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">거래담당자</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResponsibility" id="clientResponsibility" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">담당자 전화번호</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResCp" id="clientResCp" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">담당자 이메일</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientResEmail" id="clientResEmail" class="input_100" required />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="bg_gray weight_700 center">결제방법</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientPaymentType" id="clientPaymentType" class="input_100" />
	                                </td>
	                                <td class="bg_gray weight_700 center">취급품목</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientHandling" id="clientHandling" class="input_100" required />
	                                </td>
	                                <td class="bg_gray weight_700 center">비고</td>
	                                <td class="p_lr3">
	                                    <input type="text" name="clientNote" id="clientNote" class="input_100" />
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="btn-grp center m_t30">
	                        <button type="submit" class="btn_blue">거래처등록</button>
	                        <button type="reset" class="btn_red">새로고침</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>