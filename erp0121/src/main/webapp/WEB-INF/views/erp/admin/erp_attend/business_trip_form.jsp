<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->
    
	<title>출장/외근 신청서 작성</title>
</head>
<body>
    <div class="page_wrap noto">
    	<div class="print_btn_grp flex flex_fe">
			<button type="button" id="print_btn" class="btn_blue m_b5" style="outline:none" onClick='window.print();'>인쇄</button>
		</div>
        <div class="subpage_wrap">
            <div class="main_right" style="width: 100%;">
                <div class="main_right_title p_10 w_100 m_b20">
                    <h1 class="center">출장/외근 신청서</h1>
                </div>
            </div>
            <div class="main_right_info w_100">
                <div class="table_grp flex space_between">
                    <table class="form_tbl">
                        <tr>
                            <td class="bg_gray">작성일</td>
                            <td>
                                <span class="">${now}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성부서</td>
                            <td>
                                <span class="">${sessionScope.empDepartmentName} ${sessionScope.empTeam}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray">작성자</td>
                            <td>
                                <span class="">${sessionScope.empName} ${sessionScope.empPositionName}</span>
                            </td>
                        </tr>
                    </table>
                    <table class="form_tbl td_20">
                        <tr>
                            <td class="bg_gray" rowspan="4">결<br />재</td>
                            <td>
                                <span class="">부서장</span>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                            
                            </td>
                        </tr>
                        <tr></tr>
                    </table>
                </div>
                <div class="form_title w_100 m_tb20">
                    <table class="form_tbl w_100">
                        <tr>
                            <td class="bg_gray td_15">출장/외근 명</td>
                            <td class="left" colspan="3">
                                <input type="text" class="font_12 w_100" placeholder="출장 및 외근 명을 입력해주세요." />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray td_15">출장/외근기간</td>
                            <td class="left" colspan="3">
                                <input type="text" class="font_12 w_100" placeholder="출장 및 외근 기간을 입력해주세요." />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray td_15">출장/외근인원</td>
                            <td class="left" colspan="3">
                                <input type="text" class="font_12 w_100" placeholder="출장 및 외근 인원명을 입력해주세요." />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray td_15">출장/외근장소</td>
                            <td class="left" colspan="3">
                                <input type="text" class="font_12 w_100" placeholder="출장 및 외근 장소를 입력해주세요." />
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray" colspan="4">일정</td>
                        </tr>
                        <tr class="bg_gray center">
                            <td class="td_20">일 시</td>
                            <td class="td_20">위 치</td>
                            <td class="td_40">내 용</td>
                            <td class="td_20">비 고</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                            <td>
                                <input type="text" class="font_12 w_100" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="form_txt_wrap center m_tb20">
                    상기와 같이 출장/외근을 신청합니다.
                </div>
                <div class="form_footer_wrap">
                    <div id="" class="" style="overflow:hidden;">...................................................................................................................................................................................................................</div>
                    <div id="p_l10" class="m_b10" style="line-height: 150%;">
                        ※ 출장/외근 신청서 작성 시 의무사항 : 복무규정에 근거<br />
                        <span class="p_l15">· 부서장에게 신청서를 결재를 받은 후, 출장/외근 당일 전날까지 제출해야한다.</span><br />
                        <span class="p_l15">· 도내 출장의 경우, 출장지가 제주도 또는 대중교통편이 없는 지역으로의 출장비만 지급한다.</span><br />
                        <span class="p_l15">· 신청서에는 신청자 전원 기재할 것</span><br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>