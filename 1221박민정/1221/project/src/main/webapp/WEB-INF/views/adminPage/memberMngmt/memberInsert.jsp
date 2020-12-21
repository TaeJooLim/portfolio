<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<style>
    td {
        border:1px solid #ccc;
        border-radius: 2px;
    }

    td:nth-child(2n+1) {
        background-color: #eff3f9;
    }
    .upperArea {
        width:100%;
    }

    .photoArea {
        width:11%;
        /* height:100%; */
        max-width:192px;
    }

    .photoImg img{
        width:100%;
        height:100%;
        display: inline-block;
    }

    .upperInfoTbl {
        width:88.7%;
        max-width:1728px;
    }
</style>

<body>
    <%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
    	<%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
        <div class="mainContent">
            <div class="contentHead">
                <h3 class="font18">사용자 관리 > 사용자 등록</h3>
            </div>
            <div class="member-insert">
                <div class="memberInfo">
                    <form id="frm" method="POST">
                        <div class="upperArea flex flex-justify">
                            <div class="photoArea">
                                <div class="photoImg">
                                    <img ${pageContext.request.contextPath}/images/noPhoto.jpg" id="memPhotoImg" >
                                </div>
                                <div class="photoBtn center">
                                    <input type="file" name="file" id="memPhoto" />
                                </div>
                            </div>
                            <!-- 보이면안되지만 필요한 정보(누구의 정보인지 식별해줌). form 안에 만들기 -->
                            <input type="hidden" name="numFK" id="numFK" value="${memOne.num}" />
                            <table class="upperInfoTbl">
                                <tr class="center">
                                    <td class="td-10">이름</td>
                                    <td class="td-15 p-lr5">
                                        <input type="text" name="memName" id="memName" class="input-100" autofocus value="${memOne.memName}"/>
                                    </td>
                                    <td class="td-10">부서</td>
                                    <td class="td-15 p-lr5">
                                    	<select name="memBuseoCode" id="memBuseoCode" class="sel-100">
                                    		<option value="100" <c:if test="${memOne.memBuseoCode eq '100'}">selected</c:if> >관리부</option>
											<option value="200" <c:if test="${memOne.memBuseoCode eq '200'}">selected</c:if> >기획부</option>
											<option value="300" <c:if test="${memOne.memBuseoCode eq '300'}">selected</c:if> >인사부</option>
											<option value="400" <c:if test="${memOne.memBuseoCode eq '400'}">selected</c:if> >영업부</option>
											<option value="500" <c:if test="${memOne.memBuseoCode eq '500'}">selected</c:if> >생산부</option>
											<option value="600" <c:if test="${memOne.memBuseoCode eq '600'}">selected</c:if> >자재부</option>
											<option value="700" <c:if test="${memOne.memBuseoCode eq '700'}">selected</c:if> >비서실</option>
		                    			</select>
                                    </td>
                                    <td class="td-10">직급</td>
                                    <td class="td-15 p-lr5">
                                        <select name="memGradeCode" id="memGradeCode" class="sel-100">
                                    		<option value="1" <c:if test="${memOne.memGradeCode eq '1'}">selected</c:if> >사원</option>
											<option value="2" <c:if test="${memOne.memGradeCode eq '2'}">selected</c:if> >주임</option>
											<option value="3" <c:if test="${memOne.memGradeCode eq '3'}">selected</c:if> >대리</option>
											<option value="4" <c:if test="${memOne.memGradeCode eq '4'}">selected</c:if> >과장</option>
											<option value="5" <c:if test="${memOne.memGradeCode eq '5'}">selected</c:if> >팀장</option>
											<option value="6" <c:if test="${memOne.memGradeCode eq '6'}">selected</c:if> >부장</option>
		                    			</select>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>성별</td>
                                    <td class="p-lr5">
								        <select name="memGender" id="memGender" class="sel-100">
											<option value="M" <c:if test="${memOne.memGender eq 'M'}">selected</c:if> >남자</option>
											<option value="F" <c:if test="${memOne.memGender eq 'F'}">selected</c:if> >여자</option>
										</select>
                                    </td>
                                    <td>사번</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memNum" id="memNum" class="input-100" value="${memOne.memNum}" autofocus readonly/>
                                    </td>
                                    <td>내선번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memCp" id="memCp" class="input-100" value="${memOthersOne.memCp}"/>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>휴대번호</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memTel" id="memTel" class="input-100" value="${memOthersOne.memTel}"/>
                                    </td>
                                    <td>이메일</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memEmail" id="memEmail" class="input-100" value="${memOthersOne.memEmail}"/>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>생년월일</td>
                                    <td class="flex flex-justify p-lr5">
                                        <input type="text" name="memBirth" id="memBirth" class="input-100" value="${memOthersOne.memBirth}"/>
                                    </td>
                                    <td>입사일</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memEntdate" id="memEntdate" class="input-100"  value="${memOne.memEntdate}"/>
                                    </td>
                                    <td>채용형태</td>
                                    <td class="p-lr5">
                                        <select name="memRecruit" id="memRecruit" class="sel-100">
                                        	<option value="0" <c:if test="${memOthersOne.memRecruit eq '0'}">selected</c:if> >인턴</option>
                                            <option value="1" <c:if test="${memOthersOne.memRecruit eq '1'}">selected</c:if> >임시직</option>
                                            <option value="2" <c:if test="${memOthersOne.memRecruit eq '2'}">selected</c:if> >정규직</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>주소</td>
                                    <td colspan="5" class="p-lr5">
                                        <input type="text" name="memAddr" id="memAddr" class="input-100"  value="${memOthersOne.memAddr}"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="lowerArea p-tb10">
                            <table class="lowerInfoTbl">
                                <tr class="center">
                                    <td class="td-10">결혼여부</td>
                                    <td class="td-10 p-lr5">
                                        <select name="memMarried" id="memMarried" class="sel-100">
                                            <option value="F" <c:if test="${memOthersOne.memMarried eq 'F'}">selected</c:if> >미혼</option>
                                            <option value="T" <c:if test="${memOthersOne.memMarried eq 'T'}">selected</c:if> >기혼</option>
                                        </select>
                                    </td>
                                    <td class="td-10">병역구분</td>
                                    <td class="td-10 p-lr5">
                                        <select name="memService" id="memService" class="sel-100">
                                            <option value="T" <c:if test="${memOthersOne.memService eq 'T'}">selected</c:if>>필</option>
                                            <option value="F" <c:if test="${memOthersOne.memService eq 'F'}">selected</c:if>>미필</option>
                                        </select>
                                    </td>
                                    <td class="td-10">취미</td>
                                    <td class="td-10 p-lr5">
                                        <input type="text" name="memHobby" id="memHobby" class="input-100" value="${memOthersOne.memHobby}"/>
                                    </td>
                                    <td class="td-10">특기</td>
                                    <td class="td-10 p-lr5">
                                        <input type="text" name="memSpeciality" id="memSpeciality" class="input-100" value="${memOthersOne.memSpeciality}" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td class="td-10">장애여부</td>
                                    <td class="p-lr5">
                                        <select name="memDisability" id="memDisability" class="sel-100">
                                            <option value="F" <c:if test="${memOthersOne.memDisability eq 'F'}">selected</c:if>>비장애</option>
                                            <option value="T" <c:if test="${memOthersOne.memDisability eq 'T'}">selected</c:if>>장애</option>
                                        </select>
                                    </td>
                                    <td class="td-10">장애등록번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memDisabilityNum" id="memDisabilityNum" class="input-100" value="${memOthersOne.memDisabilityNum}"/>
                                    </td>
                                    <td class="td-10">보훈대상여부</td>
                                    <td class="p-lr5">
                                        <select name="memReward" id="memReward" class="sel-100">
                                            <option value="F" <c:if test="${memOthersOne.memReward eq 'F'}">selected</c:if>>비대상</option>
                                            <option value="T" <c:if test="${memOthersOne.memReward eq 'T'}">selected</c:if>>대상</option>
                                        </select>
                                    </td>
                                    <td class="td-10">보훈번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memRewardNum" id="memRewardNum" class="input-100" value="${memOthersOne.memRewardNum}" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td class="td-10">최종학력</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memFinalEdu" id="memFinalEdu" class="input-100" value="${memOthersOne.memFinalEdu}" />
                                    </td>
                                    <td class="td-10">키/몸무게</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memHeight" id="memHeight" class="input-40" placeholder="cm" value="${memOthersOne.memHeight}"/>
                                        <input type="text" name="memWeight" id="memWeight" class="input-40" placeholder="kg" value="${memOthersOne.memWeight}"/>
                                    </td>
                                    <td class="td-10">종교</td>
                                    <td class="p-lr5">
                                        <select name="memReligion" id="memReligion" class="sel-100">
                                            <option value="F" <c:if test="${memOthersOne.memReligion eq 'F'}">selected</c:if>>무교</option>
                                            <option value="Chr" <c:if test="${memOthersOne.memReligion eq 'Chr'}">selected</c:if>>기독교</option>
                                            <option value="Bud" <c:if test="${memOthersOne.memReligion eq 'Bud'}">selected</c:if>>불교</option>
                                            <option value="Cat" <c:if test="${memOthersOne.memReligion eq 'Cat'}">selected</c:if>>천주교</option>
                                            <option value="T" <c:if test="${memOthersOne.memReligion eq 'T'}">selected</c:if>>기타</option>
                                        </select>
                                        <!-- False/Christian/Buddhism/Catholic/True -->
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>보유자격1</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense1" id="memLicense1" class="input-100" value="${memOthersOne.memLicense1}"/>
                                    </td>
                                    <td>보유자격2</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense2" id="memLicense2" class="input-100" value="${memOthersOne.memLicense2}"/>
                                    </td>
                                    <td>보유자격3</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense3" id="memLicense3" class="input-100" value="${memOthersOne.memLicense3}"/>
                                    </td>
                                    <td>보유자격4</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense4" id="memLicense4" class="input-100" value="${memOthersOne.memLicense4}" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>어학사항1</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang1" id="memLang1" class="input-100" value="${memOthersOne.memLang1}" />
                                    </td>
                                    <td>어학사항2</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang2" id="memLang2" class="input-100" value="${memOthersOne.memLang2}" />
                                    </td>
                                    <td>어학사항3</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang3" id="memLang3" class="input-100" value="${memOthersOne.memLang3}" />
                                    </td>
                                    <td>어학사항4</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang4" id="memLang4" class="input-100" value="${memOthersOne.memLang4}" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>비고</td>
                                    <td colspan="7" class="p-lr5">
                                        <input type="text" name="memComment" id="memComment" class="input-100" value="${memOthersOne.memComment}" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="btn-grp center">
                            <button type="submit" class="btn-on">내용저장</button>                        
                            <button type="reset" class="btn-off">새로고침</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>
<script>
	function readImg(imgFile){
	    if(imgFile.files && imgFile.files[0]){
	        var reader = new FileReader();
	        reader.onload = function(e){
	            $("#memPhotoImg").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(imgFile.files[0]);
	    }
	}

	function changeGender(memGender, num){
        var msg = "선택하신 사원의 성별을 변경합니다.\n변경하시겠습니까?";
        if( confirm(msg) ){

            var formData = {
            	memGender : memGender,
                num : num
            };

            $.ajax({
                url : "${pageContext.request.contextPath}/member/changeGender",
                type : "POST",
                data : formData,
                success : function(resData){
                    if( resData == "success" ){
						alert("성별 설정이 성공적으로 변경되었습니다.");
                    }                    
                },
                error : function(){
                    alert("성별 설정 변경에 실패하였습니다.");
                },
                complete : function(){
                    window.location.reload();
                }
            });
        }
    }


	
	$(function(){
	    $("#memPhoto").change(function(){
	        readImg(this);
	    });
	});
</script>
</html>