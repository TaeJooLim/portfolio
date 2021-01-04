<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<style>
    td {
        border: 1px solid #d6dce7;
    }
    .list th {
        border: 1px solid #60718b;
        background-color: #6f809a;
        color: #fff;
        padding: 8px 5px;
    }

    .list tr:nth-child(2n) {
        background-color: #eff3f9;
    }

    .list td {
        border: 1px solid #d6dce7;
        padding: 8px 5px;
    }
</style>
<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">출퇴근현황</h2>
            </div>
        </div>

        <div class="main_right_info" style="padding: 30px 20px;">
            <form class="y">
                <table>
                    <tr>
                        <td class="td_8 center bg_gray">기간</td>
                        <td class="p_lr3">
                            <input type="date"> ~ <input type="date">
                        </td>
                        <td class="td_8 center bg_gray">부서</td>
                        <td class="p_lr3">
                            <select class="sel_100">
                                <option value="all">전체</option>
                                <option value="000">중앙부서</option>
                                <option value="100">인사과</option>
                                <option value="200">경영과</option>
                                <option value="300">기획과</option>
                                <option value="400">총무과</option>
                                <option value="500">전산과</option>
                                <option value="600">지원과</option>
                                <option value="700">영업과</option>
                                <option value="800">마케팅과</option>
                                <option value="900">생산과</option>
                            </select>
                        </td>
                        <td class="td_8 center bg_gray">사원명</td>
                        <td class="p_lr3" colspan="2">
                            <input type="text" class="input_100" />
                        </td>
                        <td class="td_8 center bg_gray white_s_no">초과근무/지각</td>
                        <td class="p_lr3" >
                            <select name="" id="" class="sel_100">
                                <option value="">전체</option>
                                <option value="">초과근무</option>
                                <option value="">지각</option>
                            </select>
                        </td>
                        <td class="td_8 center bg_gray">상태</td>
                        <td class="p_lr3" >
                            <select name="" id="" class="sel_100">
                                <option value="">전체</option>
                                <option value="">정상출근</option>
                                <option value="">처리필요</option>
                                <option value="">휴가</option>
                                <option value="">결근</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="center m_t10">
                    <button type="submit" class="btn_blue" id="btn">검색</button>
                    <button type="reset" class="btn_ivory">새로고침</button>
                </div>
            </form>

            <div class="m_tb20" style="border-top: 1px solid #000;">
                <div class="">
                    <div class="list_title center p_tb10">
                        <h2>출퇴근현황</h2>
                    </div>
                    <div class="w_100 white_s_no overflow_x_auto">
                        <table class="list center">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" />
                                    </th>
                                    <th>일자</th>
                                    <th>부서</th>
                                    <th>사원명</th>
                                    <th>출근시간</th>
                                    <th>퇴근시간</th>
                                    <th>소정근무시간</th>
                                    <th>초과근무시간</th>
                                    <th>총근무시간</th>
                                    <th>외근여부</th>
                                    <th>지각여부</th>
                                    <th>상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                    </td>
                                    <td>2020/12/02</td>
                                    <td>인사부</td>
                                    <td>김대리</td>
                                    <td>08:32</td>
                                    <td>18:01</td>
                                    <td>10:00</td>
                                    <td>00:31</td>
                                    <td>10:00</td>
                                    <td>N</td>
                                    <td>N</td>
                                    <td>
                                        <select name="" id="" class="s_sel_100">
                                            <option value="">정상출근</option>
                                            <option value="">처리필요</option>
                                            <option value="">휴가</option>
                                            <option value="">결근</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="s_btn_blue">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                    </td>
                                    <td>2020/12/02</td>
                                    <td>영업부</td>
                                    <td>최무무</td>
                                    <td>09:02</td>
                                    <td>18:05</td>
                                    <td>10:00</td>
                                    <td>00:00</td>
                                    <td>10:00</td>
                                    <td>N</td>
                                    <td>N</td>
                                    <td>
                                        <select name="" id="" class="s_sel_100">
                                            <option value="">정상출근</option>
                                            <option value="">처리필요</option>
                                            <option value="">휴가</option>
                                            <option value="">결근</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="s_btn_blue">수정</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
<script src="${pageContext.request.contextPath}/js/admin_main.js"></script>
<script>
    $("#btn").click(function () {
        var start = $("#start_date").val();
        var end = $("#end_date").val();

        if (start > end) {
            alert("기간 검색의 범위가 잘못되었습니다.");
            window.location.reload();
        }
    });
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>