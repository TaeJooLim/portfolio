<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<!DOCTYPE html>
	<div class="page_wrap bg_white noto font_14">
		 <div class="w_100 h_100 bg_gray">
        <div class="main flex">
            <div class="main_wrap">
                <div class="admin_main_right p_20 noto">
                    <div class="static_grp flex space_between m_b20">
                        <div class="box_32x300 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="font_16 weight_700">받은 쪽지함</h3>
                            </div>
                            <div class="box_content p_5 font_14" style="height:250px;overflow-y: auto;">
                                <div class="tbl_wrap">
                                    <table>
                                        <tr class="bg_blue_4 center">
                                            <td class="td_40">제목</td>
                                            <td class="td_20">보낸이</td>
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">날짜</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">
                                                <span class="one_line_txt">글자수 제한 스크립트 필요</span>
                                            </td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">
                                                <span class="one_line_txt">반복시작</span>
                                            </td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">반복시작</td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">반복시작</td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">반복시작</td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>
                                        <tr>
                                            <td class="p_l5">반복시작</td>
                                            <td class="center">임태주 사원</td>
                                            <td class="center">인사1팀</td>
                                            <td class="center">2020-12-11</td>
                                        </tr>   
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="box_32x300 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="font_16 weight_700">출퇴근 미처리 인원 조회</h3>
                            </div>
                            <div class="box_content p_5 font_14" style="height:250px;overflow-y: auto;">
                                <div class="tbl_wrap">
                                    <table class="center">
                                        <tr class="bg_blue_4">
                                            <td class="td_20">일자</td>
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">사원명</td>
                                            <td class="td_10">출근</td>
                                            <td class="td_10">퇴근</td>
                                            <td class="td_20">상태</td>
                                        </tr>
                                        <tr>
                                            <td>2020-12-11</td>
                                            <td>경영2팀</td>
                                            <td>김진희</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>처리필요</td>
                                        </tr>
                                        <tr>
                                            <td>2020-12-11</td>
                                            <td>총무1팀</td>
                                            <td>박민정</td>
                                            <td>09:00</td>
                                            <td>-</td>
                                            <td>처리필요</td>
                                        </tr>
                                        <tr>
                                            <td>2020-12-11</td>
                                            <td>재무1팀</td>
                                            <td>윤가희</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>처리필요</td>
                                        </tr>
                                        <tr>
                                            <td>2020-12-11</td>
                                            <td>인사1팀</td>
                                            <td>임태주</td>
                                            <td>09:30</td>
                                            <td>18:00</td>
                                            <td>지각</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="box_34x300 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16">가입승인 대기인원 조회</h3>
                            </div>
                            <div class="box_content p_5 font_14" style="height:250px;overflow-y:auto;">
                                <div class="tbl_wrap">
                                    <table class="center">
                                        <tr class="bg_blue_4">
                                            <td class="td_20">부서명</td>
                                            <td class="td_20">사원명</td>
                                            <td class="td_10">직급</td>
                                            <td class="td_20">입사일</td>
                                            <td class="td_20">가입일</td>
                                            <td class="td_10">관리</td>
                                        </tr>
                                        <c:forEach items="${confirmList}" var="clist">
                                        	<c:if test="${clist.empConfirm eq 'N'}">
		                                        <tr>
		                                            <td>${clist.empDepartmentName}</td>
		                                            <td>${clist.empName}</td>
		                                            <td>${clist.empPositionName}</td>
		                                            <td>${clist.empEnter}</td>
		                                            <td>${clist.empRegdate}</td>
		                                            <td>
		                                                <button class="s_btn_blue white_s_no">승인</button>
		                                            </td>
		                                        </tr>
	                                        </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="static_grp flex space_between">
                        <div class="box_32x500 bg_white">
                            <div class="box_title bd_b1 center bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="font_16">시스템 공지사항</h3>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:450px;overflow-y: auto;">
                                <div class="one_line bd_b1 space_between p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left w_90 flex flex_col" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [분류]
                                            </div>
                                            <div class="two_line_title under">
                                                img의 src속성을 DB에 저장된 이미지 경로로 대체할 예정입니다. 
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt" style="width:50%;">부서명 사원명 직급</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;flex-direction: column;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [공지]
                                            </div>
                                            <div class="two_line_title under">
                                                밑줄 친 제목을 눌러서 해당 게시글로 이동하는 기능을 넣을 예정입니다.
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [공지]
                                            </div>
                                            <div class="two_line_title under">
                                                제목이 한줄에 정해진 글자수만큼만 표시되도록 하는 기능이 필요합니다.
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [공지]
                                            </div>
                                            <div class="two_line_title under">
                                                2020년 10월 정보보안의 날 행사안내
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [공지]
                                            </div>
                                            <div class="two_line_title under">
                                                2020년 09월 정보보안의 날 행사안내
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box_32x500 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16">사내 공지사항</h3>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:450px;overflow-y: auto;">
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/woman.jpg" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [분류]
                                            </div>
                                            <div class="two_line_title under">
                                                사진을 등록하지 않을 경우, 기본이미지를 default로 지정하는 sql이 필요
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/man.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [경조사]
                                            </div>
                                            <div class="two_line_title under">
                                                축 결혼 인사팀 임태주 사원
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/man.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [대외행사]
                                            </div>
                                            <div class="two_line_title under">
                                                2020년 ㅇㅇ그룹 합창경연대회 일정안내
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/man.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [대외행사]
                                            </div>
                                            <div class="two_line_title under">
                                                2020년 ㅇㅇ그룹 합창경연대회 참가팀 소개
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box_34x500 bg_white">
                            <div class="box_title bd_b1 bg_blue_3 flex flex_vc flex_hc" style="height:50px;">
                                <h3 class="noto font_16">문의사항</h3>
                            </div>
                            <div class="box_content p_lr10 font_14" style="height:450px;overflow-y:auto;">
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/sir.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [분류]
                                            </div>
                                            <div class="two_line_title under">
                                                문의사항(또는 자유게시판)의 글목록을 출력합니다.
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">관리자</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/sir.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [문의]
                                            </div>
                                            <div class="two_line_title under">
                                                휴가신청은 어떻게 하면 되나요?
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">총무팀 사원 박동동</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="one_line bd_b1 p_10">
                                    <div class="picNcontent flex">
                                        <div class="one_line_pic m_r10 w_10">
                                            <img src="../../images/people/sir.png" alt="" />
                                        </div>
                                        <div class="line_content_wrap left flex flex_col w_90" style="line-height: 20px;">
                                            <div class="one_line_type blue font_14 weight_700">
                                                [버그신고]
                                            </div>
                                            <div class="two_line_title under">
                                                계약서가 작성되지 않습니다.
                                            </div>
                                            <div class="one_line_writer flex space_between w_100">
                                                <div class="one_line_txt">영업1팀 대리 최우루</div>
                                                <div class="one_line_txt gray">2020-12-11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/js/admin_main.js"></script>
<script src="${pageContext.request.contextPath}/js/time_show.js"></script>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>