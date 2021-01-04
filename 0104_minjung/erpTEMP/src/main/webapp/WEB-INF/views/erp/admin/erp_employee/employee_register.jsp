<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">

<style>
    .member_left {
        /*사진*/
        width: 10%;
        max-width: 195px;
        min-width: 150px;
        margin-right:5px;
    }

    .photo_area {
        width: 100%;
    }

    .photo_area img {
        width: 100%;
        display: inline-block;
    }

    .member_right {
        /*내용*/
        width: 90%;
    }

    .cke_style {
        border: 1px solid #ccc;
        padding: 10px;
        border-radius: 2px;
        width: 100%;
        height: 150px;
    }


    .req::after {
        content: '*';
        color: tomato;
    }

</style>

<body>
    <div class="page_wrap bg_white noto font_14" style="height: 100vh;">
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">인사/급여관리<i class="fas fa-chevron-right p_lr10"></i>5. 사원상세정보 입력/수정</h2>
                </div>
                <div class="main_right_info p_20">
                    <div class="info_title">

                    </div>
                    <div class="info_table">
                        <div class="page_content ">
                            <form id="empRegFrm" action="${pageContext.request.contextPath}/admin/employee_register" name="empRegFrm" method="POST">
                              <!-- 해당 사원 정보 받아오기 -->
                               <input type="hidden" name="empId" id="" value="${employee.empId}"/>
                               
                                <div class="member_info flex space_between">
                                    <div class="member_left">
                                        <div class="photo_area">
                                            <img src="${pageContext.request.contextPath}/images/people1.jpg" alt="" id="empPhotoImg">
                                        </div>
                                        <div class="photo_btn center">
                                            <input type="file" class="td_100" name="empPhoto">
                                        </div>
                                    </div>
                                    <div class="member_right">
                                        <table class="input_list">
                                            <tr>
                                                <td class="td_8 center bg_gray"><span class="req"></span>소속</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" name="empCompany"  >
                                                        <option value="본사" <c:if test="${employee.empCompany eq '본사'}"> selected </c:if> >본사</option>
                                                        <option value="지사" <c:if test="${employee.empCompany eq '지사'}"> selected </c:if> >지사</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray"><span class="req"></span>부서명</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" id="empDepartment" name="empDepartment"  >
                                                    	<c:forEach items="${dList}" var="dlist">
                                                    		<option value="${dlist.empDepartment}" <c:if test="${dlist.empDepartment eq employee.empDepartment}"> selected </c:if>>${dlist.empDepartmentName}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray"><span class="req"></span>팀명</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" name="empTeam"  >
                                                        <option value="1팀">1팀</option>
                                                        <option value="2팀" <c:if test="${employee.empTeam eq '2팀'}"> selected </c:if>>2팀</option>
                                                        <option value="3팀" <c:if test="${employee.empTeam eq '3팀'}"> selected </c:if>>3팀</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray"><span class="req"></span>입사년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="date" name="empEnter" id="" class="input_100"   value="${employee.empEnter }"   />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>가입년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="" id="empRegdate" class="input_100" value="${employee.empRegdate }" readonly placeholder="자동입력" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>사번</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empNum" id="empNum" class="input_100" value="${employee.empNum }" readonly placeholder="자동입력" required />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>사원명/성별</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empName" id="empName" class="input_box" style="width: calc(100% - 31% - 2px);" value="${employee.empName }" maxlength="30" />
                                                    <select class="input_box float_r" name="empGender" style="width: 30%;"  >
                                                        <option value="남">남</option>
                                                        <option value="여" <c:if test="${employee.empGender eq '여'}">selected</c:if>>여</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center clearfix bg_gray weight700"><span class="req"></span>생년월일</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="date" name="empBirth" id="empBirth" class="input_100" value="${employee.empBirth }" />

                                                </td>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>CP</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empCP" id="empCP" value="${employee.empCP}" class="input_100" maxlength="13" />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">내선번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empExtension" id="empExtension"  value="${employee.empExtension }" class="input_100" maxlength="4"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center bg_gray weight700"><span class="req"></span>직급</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" id="empPosition" name="empPosition"  >
                                                    	<c:forEach items="${pList}" var="plist"> ${plist.empPositionName}
                                                    		<option value="${plist.empPosition}" <c:if test="${plist.empPosition eq employee.empPosition}">selected</c:if>>${plist.empPositionName}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">직책</td>
                                                <td class="td_12 p_lr3">
                                                    <select class="sel_100" name="empLeader">
                                                        <option>-</option>
                                                        <option value="부서장" <c:if test="${employee.empLeader eq '부서장'}"> selected </c:if>>부서장</option>
                                                        <option value="팀장" <c:if test="${employee.empLeader eq '팀장'}"> selected </c:if>>팀장</option>
                                                        <option value="부팀장" <c:if test="${employee.empLeader eq '부팀장'}"> selected </c:if>>부팀장</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">운전가능여부</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empDriving" class="input_100" id="empDriving">
                                                    	<option>-</option>
                                                        <option value="Y">Y</option>
                                                        <option value="N"<c:if test="${employee.empDriving eq 'N'}">selected</c:if>>N</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">운전면허 종류</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empCarlicense" class="sel_100" id="empCarlicense">
                                                        <option value="1종대형">1종대형</option>
                                                        <option value="1종보통" <c:if test="${employee.empCarlicense eq '1종보통'}"> selected </c:if> >1종보통</option>
                                                        <option value="2종보통" <c:if test="${employee.empCarlicense eq '2종보통'}"> selected </c:if>>2종보통</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">자차소유여부</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empMycar" class="sel_100" id="empMycar">
                                                        <option value="Y">Y</option>
                                                        <option value="N" <c:if test="${employee.empMycar eq 'N'}"> selected </c:if>>N</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700">최종학력</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empGraduated" class="sel_100" id="empGraduated">
                                                        <option value="고등학교졸업">고등학교졸업</option>
                                                        <option value="고등학교중퇴" <c:if test="${employee.empGraduated eq '고등학교중퇴'}"> selected </c:if>>고등학교중퇴</option>
                                                        <option value="전문학사" <c:if test="${employee.empGraduated eq '전문학사'}"> selected </c:if>>전문학사</option>
                                                        <option value="학사" <c:if test="${employee.empGraduated eq '학사'}"> selected </c:if>>학사</option>
                                                        <option value="석사" <c:if test="${employee.empGraduated eq '석사'}"> selected </c:if>>석사</option>
                                                        <option value="박사" <c:if test="${employee.empGraduated eq '박사'}"> selected </c:if>>박사</option>
                                                        <option value="대학교중퇴" <c:if test="${employee.empGraduated eq '대학교중퇴'}"> selected </c:if>>대학교중퇴</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center bg_gray weight700">학과/전공</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empMajor" id="empMajor" value="${employee.empMajor }" class="input_100" maxlength="20" />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">학교이름</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empAcademy" id="empAcademy" class="input_100" value="${employee.empAcademy }" maxlength="20" />
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">보훈대상</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empReward" class="sel_100" id="empReward">
                                                        <option value="비대상">비대상</option>
                                                        <option value="대상" <c:if test="${employee.empReward eq '대상'}">selected</c:if>>대상</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">장애대상</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empDisability" class="sel_100" id="empDisability">
                                                        <option value="비대상">비대상</option>
                                                        <option value="대상" <c:if test="${employee.empDisability eq '대상'}">selected</c:if>>대상</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>이메일</td>
                                                <td class="td_12 p_lr3" colspan="3">
                                                    <input type="text" name="empEmail" id="empEmail" class="input_100" value="${employee.empEmail}" maxlength="50"/>

                                                </td>

                                                <td class="td_8 center  bg_gray weight700">병역구분</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empArmy" class="sel_100" id="empArmy">
                                                        <option value="해당없음">해당없음</option>
                                                        <option value="군필" <c:if test="${employee.empArmy eq '군필'}">selected</c:if>>군필</option>
                                                        <option value="미필" <c:if test="${employee.empArmy eq '미필'}">selected</c:if>>미필</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">종교</td>
                                                <td class="td_12 p_lr3">

                                                    <select name="empReligion" class="sel_100" id="empReligion">
                                                        <option value="불교">불교</option>
                                                        <option value="기독교" <c:if test="${employee.empReligion eq '기독교'}">selected</c:if>>기독교</option>
                                                        <option value="천주교" <c:if test="${employee.empReligion eq '천주교'}">selected</c:if>>천주교</option>
                                                        <option value="기타" <c:if test="${employee.empReligion eq '기타'}">selected</c:if>>기타</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">결혼여부</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empMarried" class="sel_100" id="empMarried">
                                                        <option value="미혼">미혼</option>
                                                        <option value="기혼" <c:if test="${employee.empMarried eq '기혼'}">selected</c:if>>기혼</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700">보유자격 1</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="empLicense1" id="empLicense1" class="input_100" value="${employee.empLicense1 }" maxlength="20"/></td>
                                                <td class="td_8 center  bg_gray weight700">보유자격 2</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="empLicense2" id="empLicense2" class="input_100" value="${employee.empLicense2 }" maxlength="20"/></td>
                                                <td class="td_8 center  bg_gray weight700">보유자격 3</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="empLicense3" id="empLicense3" class="input_100" value="${employee.empLicense3 }" maxlength="20"/></td>
                                                <td class="td_8 center  bg_gray weight700">어학자격 1</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="empLang1" id="empLang1" class="input_100" value="${employee.empLang1 }" maxlength="20"/></td>
                                                <td class="td_8 center  bg_gray weight700">어학자격 2</td>
                                                <td class="td_12 p_lr3"> <input type="text" name="empLang2" id="empLang2" class="input_100" value="${employee.empLang2 }" maxlength="20"/></td>
                                            </tr>
                                            <tr>

                                                <td class="td_8 center  bg_gray weight700">국적</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empNation" id="empNation" value="${employee.empNation }" class="input_100" maxlength="3"/>

                                                </td>
                                                <td class="td_8 center  bg_gray weight700">우편번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empPost" id="empPost" value="${employee.empPost }" class="input_100" maxlength="5"/>
                                                </td>

                                                <td class="td_8 center  bg_gray weight700">주소</td>
                                                <td colspan="5" class="td_12 p_lr3">
                                                    <input type="text" name="empAddress" id="empAddress" class="input_100"  value="${employee.empAddress }" maxlength="100"/>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_8 center  bg_gray weight700"><span class="req"></span>거래은행</td>
                                                <td class="td_12 p_lr3">
                                                    <select name="empBank" class="sel_100" id="empBank"  >
                                                        <option value="NH농협" <c:if test="${employee.empBank eq 'NH농협'}"> selected </c:if>>NH농협</option>
                                                        <option value="KB국민" <c:if test="${employee.empBank eq 'KB국민'}"> selected </c:if>>KB국민</option>
                                                        <option value="우리" <c:if test="${employee.empBank eq '우리'}"> selected </c:if>>우리</option>
                                                        <option value="하나" <c:if test="${employee.empBank eq '하나'}"> selected </c:if>>하나</option>
                                                        <option value="IBK기업" <c:if test="${employee.empBank eq 'IBK기업'}"> selected </c:if>>IBK기업</option>
                                                        <option value="SC제일" <c:if test="${employee.empBank eq 'SC제일'}"> selected </c:if>>SC제일</option>
                                                        <option value="시티" <c:if test="${employee.empBank eq '시티'}"> selected </c:if>>시티</option>
                                                        <option value="KDB기업" <c:if test="${employee.empBank eq 'KDB기업'}"> selected </c:if>>KDB기업</option>
                                                        <option value="SBI저축은행" <c:if test="${employee.empBank eq 'SBI저축은행'}"> selected </c:if>>SBI저축은행</option>
                                                        <option value="새마을" <c:if test="${employee.empBank eq '새마을'}"> selected </c:if>>새마을</option>
                                                        <option value="대구" <c:if test="${employee.empBank eq '대구'}"> selected </c:if>>대구</option>
                                                        <option value="광주" <c:if test="${employee.empBank eq '광주'}"> selected </c:if>>광주</option>
                                                        <option value="우체국" <c:if test="${employee.empBank eq '우체국'}"> selected </c:if>>우체국</option>
                                                        <option value="신협" <c:if test="${employee.empBank eq '신협'}"> selected </c:if>>신협</option>
                                                        <option value="전북" <c:if test="${employee.empBank eq '전북'}"> selected </c:if>>전북</option>
                                                        <option value="경남" <c:if test="${employee.empBank eq '경남'}"> selected </c:if>>경남</option>
                                                        <option value="부산" <c:if test="${employee.empBank eq '부산'}"> selected </c:if>>부산</option>
                                                        <option value="수협" <c:if test="${employee.empBank eq '수협'}"> selected </c:if>>수협</option>
                                                        <option value="제주" <c:if test="${employee.empBank eq '제주'}"> selected </c:if>>제주</option>
                                                        <option value="저축은행" <c:if test="${employee.empBank eq '저축은행'}"> selected </c:if>>저축은행</option>
                                                        <option value="산림조합" <c:if test="${employee.empBank eq '산림조합'}"> selected </c:if>>산림조합</option>
                                                        <option value="케이뱅크" <c:if test="${employee.empBank eq '케이뱅크'}"> selected </c:if>>케이뱅크</option>
                                                        <option value="카카오뱅크" <c:if test="${employee.empBank eq '카카오뱅크'}"> selected </c:if>>카카오뱅크</option>
                                                        <option value="HSBC" <c:if test="${employee.empBank eq 'HSBC'}"> selected </c:if>>HSBC</option>
                                                        <option value="중국공상" <c:if test="${employee.empBank eq '중국공상'}"> selected </c:if>>중국공상</option>
                                                        <option value="JP모간" <c:if test="${employee.empBank eq 'JP모간'}"> selected </c:if>>JP모간</option>
                                                        <option value="도이치" <c:if test="${employee.empBank eq '도이치'}"> selected </c:if>>도이치</option>
                                                        <option value="BNP파리바" <c:if test="${employee.empBank eq 'BNP파리바'}"> selected </c:if>>BNP파리바</option>
                                                        <option value="BOA" <c:if test="${employee.empBank eq 'BOA'}"> selected </c:if>>BOA</option>
                                                        <option value="중국건설" <c:if test="${employee.empBank eq '중국건설'}"> selected </c:if>>중국건설</option>
                                                    </select>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">
                                                <span class="req" ></span>계좌번호</td>
                                                <td class="td_12 p_lr3">
                                                    <input type="text" name="empAccountnum" id="empAccountnum" class="input_100"   value="${employee.empAccountnum }" maxlength="20"/>
                                                </td>
                                                <td class="td_8 center  bg_gray weight700">상세주소</td>
                                                <td colspan="5" class="td_12 p_lr3">
                                                    <input type="text" name="empAddressDetail" id="empAddressDetail" class="input_100" value="${employee.empAddressDetail }" maxlength="50"/>
                                                </td>
                                            </tr>
                                        </table>
										<input type="hidden" name="empIdFk" value="${employee.empId}"/>
                                    </div>
                                </div>
                                <div class="comment">
                                    <div class="title">
                                        <h3 class="tomato font_14 noto mt20">
                                            경력사항(비고) 입력
                                        </h3>
                                    </div>
                                    <div class="content">
                                        <textarea name="empCareer" id="editor" class="cke_style" style="outline: none">${employee.empCareer}</textarea>
                                    </div>
                                    <div class="btn_grp center m_t10 ">
                                        <button type="submit" class="btn_blue" id="empRegBtn">내용저장</button> <!-- action 찾아감-->
                                        <button type="reset" class="btn_red">새로고침</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<script>
</script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>