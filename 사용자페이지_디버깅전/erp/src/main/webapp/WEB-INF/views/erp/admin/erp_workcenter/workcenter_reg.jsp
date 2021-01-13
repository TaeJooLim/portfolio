<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_reg.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contract.css">
<style>
.emp_chk_bg {
    display: none; 
    z-index: 2;
    		position:absolute;
    		top:0;
    		left:0;
    		
    		width:100%;
    		height:100%;
    		background-color:rgba(0, 0, 0, 0.7);
}
    	
.emp_chk_box {
    		background-color:#fff;
            width:700px;
            height: 500px;
            padding: 30px;
    		position:absolute;
    		top:50%;
    		left:50%;
            transform:translate(-50%, -50%);
            overflow-y: scroll;
            position: relative;
}

.pop_close{
	position: absolute;
	top: 2%;
	left:93%;
	cursor: pointer;
	font-size:15px;
}
</style>
<div class="main_right bg_white" style="width: 100%;">
                <div class="emp_chk_bg">
                    <div class="emp_chk_box">
<!--                     <div class="pop_close" id="pop_close">[닫기]</div> -->
                    <form id="emp_chk" name="emp_chk" action="">
                        <div class="search_box center flex flex_vc flex_hc">
                            <input type="text" class="empName input_box m_r5 td_45" id="" name="empName" placeholder="사원명을 입력해주세요" />
                            <div class="flex">
    	                        <button type="button" class="btn_ivory m_r5" id="emp_chk_btn">검색</button>
	                            <button type="button" class="btn_red" id="pop_close">닫기</button>
                            </div>
                        </div>
                        <table class="search_list">
                            <thead>
                                <tr>
                                    <th>사원명</th>
                                    <th>사원번호</th>
                                    <th>부서</th>
                                    <th>직책</th>
                                    <th>선택</th>
                                </tr>
                            </thead>
                            <tbody id="emp_chk_list"></tbody>
                        </table>
                     </form>
                    </div>
                </div>
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">워크센터관리</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="product_reg">
                    <form action="${pageContext.request.contextPath}/admin/workcenter_insert">
                        <table class="input_list">
                            <tr>
                                <td class="bg_gray weight_700 td_10 center">워크센터 이름</td>
                                <td class="p_lr3">
                                    <input type="text" id="wcName" name="wcName" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 td_10 center">용도</td>
                                <td class="p_lr3">
                                    <input type="text" id="wcUsage" name="wcUsage" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 td_10 center">면적</td>
                                <td class="p_lr3">
                                    <input type="text" id="wcArea" name="wcArea" class="input_100" required placeholder="숫자만 입력해주세요"/>
                                </td>
                                <td class="bg_gray weight_700 td_10 center">층 수</td>
                                <td class="p_lr3">
                                    <input type="text" id="wcFloor" name="wcFloor" class="input_100" required placeholder="숫자만 입력해주세요"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg_gray weight_700 center">담당자</td>
                                <td class="p_lr3">
                                    <div class="search_box">
                                        <input type="text" name="empName" maxlength="15" id="empName" class="readonly input_100" required style="caret-color: transparent !important;"/>
                                        <i class="fas fa-search font_18"></i>
                                    </div>
                                </td>
                                <td class="bg_gray weight_700 center">우편번호</td>
                                <td class="p_lr3" onClick="execDaumPostcode();">
                                    <input type="text" name="wcPost" id="empPost" class="input_100" required placeholder="우편번호를 입력해주세요" readonly />
                                </td>
                                <td class="bg_gray weight_700 center">소재지</td>
                                <td class="p_lr3" colspan="3">
                                    <input type="text" id="empAddress" name="wcAddress" class="input_100" required readonly />
                                </td>
                            </tr>
                            <tr>
                                <td class="bg_gray weight_700 center">계약시작일자</td>
                                <td class="p_lr3">
                                    <input type="date" id="wcContractFromDate" name="wcContractFromDate" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 center">계약만료일자</td>
                                <td class="p_lr3">
                                    <input type="date" id="wcContractToDate" name="wcContractToDate" class="input_100" required />
                                </td>
                                <td class="bg_gray weight_700 center">계약서 첨부</td>
                                <td class="p_lr3" colspan="3">
                                    <input type="file" id="wcContract" name="wcContract" class="input_100" placeholder="계약서 파일을 첨부해주세요" />
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" id="empId" name="empIdFk"/>
                        <div class="btn-grp center m_t20">
                            <button type="submit" class="btn_blue">센터등록</button>
                            <button type="reset" class="btn_red">새로고침</button>
                        </div>
                        </form>
                    </div>
                    <div class="product_reg_table m_t20" style="border-top: 1px solid #000;">
                        <div class="list_comment font_12 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            등록된 워크센터 목록입니다.
                        </div>
                        <table class="list">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th class="td_20">워크센터 이름</th>
                                    <th class="td_8">용도</th>
                                    <th class="td_8">면적(m2)</th>
                                    <th class="td_8">층 수</th>
                                    <th>사원번호</th>
                                    <th>담당자</th>
                                    <th>계약시작일자</th>
                                    <th>계약만료일자</th>
                                    <th>관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${count == 0}">
                           		<tr>
                           			<td class="weight_700" colspan="9">등록된 워크센터가 없습니다.</td>
                           		<tr>
                           		</c:if>
                           		<c:forEach var="wc" items="${list}">
                                        <tr>
                                            <td>${wc.wcId}</td>
                                            <td>${wc.wcName}</td>
                                            <td>${wc.wcUsage}</td>
                                            <td>${wc.wcArea}</td>
                                            <td>${wc.wcFloor}</td>
                                            <td>${wc.empNum}</td>
                                            <td>${wc.empDepartmentName} ${wc.empName} ${wc.empPositionName}</td>
                                            <td>${wc.wcContractFromDate}</td>
                                            <td>${wc.wcContractToDate}</td>
                                            <td>
                                            	<button type="button" class="s_btn_red" onclick="wcDel(${wc.wcId})">삭제</button>
                                            </td>
                                        </tr>
                                 </c:forEach>
                                </tbody> 
                        </table>
                    </div>
                </div>
            </div> 
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="${pageContext.request.contextPath}/js/common.js"></script>
			<script src="${pageContext.request.contextPath}/js/workcenter.js"></script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>