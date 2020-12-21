<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<style>
    .member_left {
        /*사진*/
        width: 11%;
        max-width: 192px;
    }

    .photo_area {
        width: 100%;
    }

    .photo_area img {
        width: 100%;
        height: 240px;
        display: inline-block;
    }

    .member_right {
        /*내용*/
        width: 88.7%;
        max-width: 1728px;
    }

    td {
        border: 1px solid #d6dce7;
    }

    .req::after {
        content: '*';
        color: tomato;
    }

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

    /* modal css */
    .flex_wrap {
        flex-wrap: wrap;
	}
    .modal_wrapper {
        background-color: rgba(0, 0, 0, 0.3);
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        visibility: hidden;
        /* 눌렀을 때 나와야 하니깐 = visibility */
        transition: 0.3s;
    }
    .modal_wrapper.open {
        visibility: visible;
        opacity: 1;
        transition: 0.3s;
    }	
    .modal_wrapper.open .modal {
        opacity: 1;
    }	
    .modal {	
        width: 400px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        opacity: 0;
        border-radius: 5px;
        padding: 20px;
        box-shadow: -60px 0px 100px -90px #000,
            60px 0px 100px -90px #000;
    }
    /* modal css */
</style>
<body>
    <!-- 모달 시작-->
	<div class="modal_wrapper">
        <div class="modal flex space_between flex_wrap" style="align-content: flex-start;">
            <div>
                <h3 class="font_18">비밀번호 변경</h3>
            </div>
            <a href="" class="popup font_20">
                <i class="fas fa-window-close"> 창닫기</i>
            </a>
            <div class="m_t20 w_100 flex" style="flex-wrap: nowrap; overflow-y: auto;">
            	<div class="font_12 m_b10 w_100 p_10" style="background-color: #f9f9f9;">
                    비밀번호는 <strong>영문+숫자</strong>를 사용하여 8~20자를 입력해주세요.
                </div>
            </div>
            <div class="w_100 center">
                <form action="">
                    <table>
                        <tr>
                            <td class="bg_gray weight700">비밀번호</td>
                            <td class="p_lr3">
                                <input class="input_100" type="text" placeholder="비밀번호 입력">
                            </td>
                        </tr>
                        <tr>
                            <td class="bg_gray weight700">비밀번호 재입력</td>
                            <td class="p_lr3">
                                <input class="input_100" type="text" placeholder="비밀번호 재입력">
                            </td>
                        </tr>
                    </table>
                    <button class="btn_blue m_t10">저장</button>
                </form>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10 flex space_between" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">내정보 관리</h2>
                    <span class="p_r10">
                        <button class="popup font_16 btn_write">비밀번호 변경</button>
                    </span>
                </div>
                <div class="main_right_info p_20">
                    <div class="font_12 m_b10 w_100 p_10" style="background-color: #f9f9f9;">
                        <strong>소속, 부서명, 팀명, 입사년월일, 가입년월일, 사번, 사원명, 성별, 직급, 직책</strong>은 사용자 임의로 변경할 수 <strong>없습니다.</strong>
                        관리자에게 문의하여 주십시오.
                    </div>
                    <div class="info_table">
                        <div class="page_content ">
                            <form action="" name="" method="">
                              <!-- 해당 사원 정보 받아오기 -->
                               <input type="hidden" name="" id="" value=""/>
                                <div class="member_info flex space_between">
                                    <div class="member_left">
                                        <div class="photo_area">
                                            <img src="${pageContext.request.contextPath}/images/people1.jpg" alt="">
                                        </div>
                                        <div class="phoyo_btn center">
                                            <input type="file" class="td_100">
                                        </div>
                                    </div>
                                    <div class="member_right">
                                        <table>
                                            <tr>
                                                <td class="td_8 center bg_gray"><span class="req"></span>소속</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                                                        <option value="" selected>본사</option>
                                                        <option value="">지사</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray"><span class="req"></span>부서명</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
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
                                                <td class="td_8 center bg_gray"><span class="req"></span>팀명</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" readonly onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                                                        <option value="">1팀</option>
                                                        <option value="">2팀</option>
                                                        <option value="">3팀</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray"><span class="req"></span>입사년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus readonly/>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>가입년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>사번</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empNum" id="empNum" class="input_100" readonly/>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>사원명/성별</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_box" style="width: calc(100% - 31% - 2px);" autofocus readonly />
                                                    <select class="input_box float_r" style="width: 30%;" readonly onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                                                        <option value="남">남</option>
                                                        <option value="여">여</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center clearfix bg_gray weight700"><span class="req"></span>생년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>CP</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">내선번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center bg_gray weight700"><span class="req"></span>직급</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                                                        <option value=""></option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">직책</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                                                        <option>-</option>
                                                        <option>부서장</option>
                                                        <option>팀장</option>
                                                        <option>부팀장</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">운전가능여부</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="input_100" id="">
                                                        <option value="">Y</option>
                                                        <option value="">N</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">운전면허 종류</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">1종대형</option>
                                                        <option value="">1종보통</option>
                                                        <option value="">2종보통</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">자차소유여부</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">Y</option>
                                                        <option value="">N</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700">최종학력</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">고등학교졸업</option>
                                                        <option value="">고등학교중퇴</option>
                                                        <option value="">전문학사</option>
                                                        <option value="">학사</option>
                                                        <option value="">석사</option>
                                                        <option value="">박사</option>
                                                        <option value="">대학교중퇴</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">학과/전공</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus maxlength="20" />
                                                </td>
                                                <td class="td_8 center bg_gray weight700">학교이름</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />
                                                </td>
                                                <td class="td_8 center bg_gray weight700">보훈대상</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">비대상</option>
                                                        <option value="">대상</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">장애대상</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">비대상</option>
                                                        <option value="">대상</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center bg_gray weight700"><span class="req"></span>이메일</td>
                                                <td class="td_12 p_lr3" colspan="3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />

                                                </td>

                                                <td class="td_8 center bg_gray weight700">병역구분</td>
                                                <td class="td_12 p_lr3">

                                                    <select name="" class="sel_100" id="">
                                                        <option value="">군필</option>
                                                        <option value="">미필</option>
                                                        <option value="">해당없음</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">종교</td>
                                                <td class="td_12 p_lr3">

                                                    <select name="" class="sel_100" id="">
                                                        <option value="">불교</option>
                                                        <option value="">기독교</option>
                                                        <option value="">천주교</option>
                                                        <option value="">기타</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">결혼여부</td>
                                                <td class="td_12 p_lr3">

                                                    <select name="" class="sel_100" id="">
                                                        <option value="">미혼</option>
                                                        <option value="">기혼</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center bg_gray weight700">보유자격 1</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="" id="" class="input_100" autofocus /></td>
                                                <td class="td_8 center bg_gray weight700">보유자격 2</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="" id="" class="input_100" autofocus /></td>
                                                <td class="td_8 center bg_gray weight700">보유자격 3</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="" id="" class="input_100" autofocus /></td>
                                                <td class="td_8 center bg_gray weight700">어학자격 1</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="" id="" class="input_100" autofocus /></td>
                                                <td class="td_8 center bg_gray weight700">어학자격 2</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="" id="" class="input_100" autofocus /></td>
                                            </tr>
                                            <tr>

                                                <td class="td_8 center bg_gray weight700">국적</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />

                                                </td>
                                                <td class="td_8 center bg_gray weight700">우편번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />

                                                </td>

                                                <td class="td_8 center bg_gray weight700">주소</td>
                                                <td colspan="5" class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center bg_gray weight700"><span class="req"></span>거래은행</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="" class="sel_100" id="">
                                                        <option value="">NH농협</option>
                                                        <option value="">KB국민</option>
                                                        <option value="">우리</option>
                                                        <option value="">하나</option>
                                                        <option value="">IBK기업</option>
                                                        <option value="">SC제일</option>
                                                        <option value="">시티</option>
                                                        <option value="">KDB기업</option>
                                                        <option value="">SBI저축은행</option>
                                                        <option value="">새마을</option>
                                                        <option value="">대구</option>
                                                        <option value="">광주</option>
                                                        <option value="">우체국</option>
                                                        <option value="">신협</option>
                                                        <option value="">전북</option>
                                                        <option value="">경남</option>
                                                        <option value="">부산</option>
                                                        <option value="">수협</option>
                                                        <option value="">제주</option>
                                                        <option value="">저축은행</option>
                                                        <option value="">산림조합</option>
                                                        <option value="">케이뱅크</option>
                                                        <option value="">카카오뱅크</option>
                                                        <option value="">HSBC</option>
                                                        <option value="">중국공상</option>
                                                        <option value="">JP모간</option>
                                                        <option value="">도이치</option>
                                                        <option value="">BNP파리바</option>
                                                        <option value="">BOA</option>
                                                        <option value="">중국건설</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">
                                                <span class="req"></span>계좌번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />
                                                </td>
                                                <td class="td_8 center bg_gray weight700">상세주소</td>
                                                <td colspan="5" class="td_12 p_lr3">
                                                    <input type="text" name="" id="" class="input_100" autofocus />
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="center m_t10">
                                            <button type="submit" class="btn_blue">저장</button>
                                            <button type="reset" class="btn_red">새로고침</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="m_b5 font_16 weight_700 blue_3">
                                        <i class="fas fa-edit"></i>
                                        <span>사원 목록</span>
                                    </div>
                                    <table class="list">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>부서명</th>
                                                <th>직급</th>
                                                <th>직책</th>
                                                <th>사원명</th>
                                                <th>성별</th>
                                                <th>내선번호</th>
                                                <th>휴대번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2</td>
                                                <td>인사부</td>
                                                <td>과장</td>
                                                <td>-</td>
                                                <td>김과장</td>
                                                <td>여</td>
                                                <td>10011</td>
                                                <td>01029293939</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
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
            </div>
        </div>
    </div>
</body>
<script>	
    $(function () {	
        $(".popup").click(function () {	
            $(".modal_wrapper").toggleClass("open");	
        });	
    });	
</script>
</html>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>