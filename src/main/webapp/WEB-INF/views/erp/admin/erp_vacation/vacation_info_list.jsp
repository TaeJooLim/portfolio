<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<!-- 여기안에 내용을 복사하시면 됩니다! -->
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">

        <div class="main_right bg_white" style="width: 100%;">
            <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                <h2 class="font_18">연차사용이력조회</h2>
            </div>
        </div>
        <div class="main_right_info" style="padding: 30px 20px;">
            <form>
                <div class="input_list">
                    <table>
                        <tr>
                            <td class="bg_gray weight_700 td_10 center">사용일자</td>
                            <td class="p_lr3">
                                <input type="date" name="" maxlength="20" id="" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">휴가종류</td>
                            <td class="p_lr3">
                                <input type="text" name="" maxlength="20" id="" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">사원번호</td>
                            <td class="p_lr3">
                                <input type="date" name="" id="" class="input_100" required />
                            </td>
                            <td class="bg_gray weight_700 td_10 center">사원명</td>
                            <td class="p_lr3">
                                <input type="text" name="" maxlength="20" id="" class="input_100" required />
                            </td>
                        </tr>
                    </table>
                    <div class="btn-grp center m_t10">
                        <button type="submit" class="btn_blue">검색하기</button>
                        <button type="reset" class="btn_red">새로고침</button>
                    </div>
                </div>
            </form>

            <div class="m_t20" style="border-top: 1px solid #000;">
                <div class="w_100 white_s_no overflow_x_auto">
                    <div class="list_title">
                        <h2 class="font_18">연차사용이력조회</h2>
                    </div>
                    <div class="m_b5">
                        <div class="btn_wrap float_l m_b5">
                            <button class="btn_red">선택삭제</button>
                        </div>
                        <div class="tbl_wrap">
                            <table class="list clearfix">
                                <thead>
                                    <th rowspan="2">
                                        <input type="checkbox" />
                                    </th>
                                    <th>사용일자</th>
                                    <th>휴가분류</th>
                                    <th>사원번호</th>
                                    <th>사원명</th>
                                    <th>소속</th>
                                    <th>직위</th>
                                    <th>사용일수</th>
                                    <th>잔여일수</th>
                                    <th>결재여부</th>
                                    <th>신청일자</th>
                                </thead>
                                <tr>
                                    <td><input type="checkbox" /></td>
                                    <td>2020-01-05</td>
                                    <td>연차</td>
                                    <td>20201234</td>
                                    <td>임태주</td>
                                    <td>인사팀</td>
                                    <td>사원</td>
                                    <td>1일</td>
                                    <td>14일</td>
                                    <td>결재완료</td>
                                    <td>2020.01.01</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" /></td>
                                    <td>2020-01-05</td>
                                    <td>연차</td>
                                    <td>20201234</td>
                                    <td>임태주</td>
                                    <td>인사팀</td>
                                    <td>사원</td>
                                    <td>1일</td>
                                    <td>14일</td>
                                    <td>결재완료</td>
                                    <td>2020.01.01</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" /></td>
                                    <td>2020-01-05</td>
                                    <td>연차</td>
                                    <td>20201234</td>
                                    <td>임태주</td>
                                    <td>인사팀</td>
                                    <td>사원</td>
                                    <td>1일</td>
                                    <td>14일</td>
                                    <td>결재완료</td>
                                    <td>2020.01.01</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>