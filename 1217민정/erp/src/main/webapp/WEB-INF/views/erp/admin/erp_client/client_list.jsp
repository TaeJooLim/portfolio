<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<style>
    .list th {
        border: 1px solid #60718b;
        background-color: #6f809a;
        color: #fff;
        padding: 8px 5px;
        text-align: center;
    }

    .list tr:nth-child(2n) {
        background-color: #eff3f9;
    }

    .list td {
        border: 1px solid #d6dce7;
        padding: 8px 5px;
        text-align: center;
    }

    .product_list td {
        border: 1px solid #d6dce7;
    }

    .input_100 {
        padding: 5px;
        border-radius: 2px;
        border: 1px solid #d5d5d5;
        width: 100%;
        height: 35px;
        font-size: 12px;
    }
    
    .sel_100{
    	width: 100%;
	}

    .p_lr3 {
        padding: 0 3px;
    }
    
    .list_title {
        width: 100%;
        text-align: center;
        padding: 10px 0;
    }
    
    .r_btn {
        width: 16px;
        text-align: center;
        margin-left: 20px;
    }
    .r_btn:first-child {
        margin: 0;
    }
</style>
<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">거래처 목록</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <div class="product_list">
                <table>
                    <tr>
                        <td class="bg_gray weight_700 td_10 center">거래처명</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                        <td class="bg_gray weight_700 td_10 center">업태</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                        <td class="bg_gray weight_700 td_10 center">대표자</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="bg_gray weight_700 td_10 center">주소</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                        <td class="bg_gray weight_700 td_10 center">종목</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                        <td class="bg_gray weight_700 td_10 center">전화번호</td>
                        <td class="p_lr3">
                            <input type="text" name="" maxlength="20" id="" class="input_100" required />
                        </td>
                    </tr>
                    <tr>
                        <td class="bg_gray weight_700 td_10 center" >사업자구분</td>
                        <td colspan="5" style="line-height: 34px; padding: 0 3px" >
                        <input type="radio" name="gubun" class="r_btn" value=""> <span>사업자번호</span>
                        <input type="radio" name="gubun" class="r_btn" value=""> <span>주민번호</span>
                        <input type="radio" name="gubun" class="r_btn" value=""> <span>전체</span>
                        </td>
                    </tr>
                </table>
                <div class="btn-grp center m_t10">
                    <button type="submit" class="btn_blue">조회</button>
                    <button type="reset" class="btn_red">새로고침</button>
                </div>
            </div>
            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="">
                    <div class="list_title">
                        <h2>거래처 목록</h2>
                    </div>
                    <div class="w_100 white_s_no overflow_x_auto">
                        <table class="list">
                            <thead>
                                <tr>
                                	<th>번호</th>
                                    <th>사업자등록번호</th>
                                    <th>거래처명</th>
                                    <th>대표자명</th>
                                    <th>전화번호</th>
                                    <th>팩스번호</th>
                                    <th>업태</th>
                                    <th>종목</th>
                                    <th>비고</th>
                                </tr>
                           	</thead>
                           	<c:forEach items="${list}" var="list" varStatus="status">
                                <tbody>
                                    <tr>
	                                    <td>5</td>
	                                    <td>${list.clientLicenseNum}</td>
	                                    <td>${list.clientCompany}</td>
	                                    <td>${list.clientCeoName}</td>
	                                    <td>${list.clientCompanyPhone}</td>
	                                    <td>${list.clientCompanyFax}</td>
	                                    <td>${list.clientBusinessCondition}</td>
	                                    <td>${list.clientBusinessType}</td>
	                                    <td>${list.clientNote}</td>
                                    </tr>
                                </tbody> 
                           	</c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <div class="page_grp center m_t10">
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

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>
