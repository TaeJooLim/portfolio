<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/user/include/HEADER.jsp"%>
<body onload="printClock();">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_main.css">    
            <div class="main_wrap p_20 flex" style="flex-direction: column;">
                <div class="">
                    <div class="static-grp flex space_between m_b20">
                        <div class="box_20x500 bg_white center">
                            <div class="box_title p_15 m_b20 bd_b1">
                                <h3 class="font_16 display_in">내 정보</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>
                            <div class="userinfo font_14">
                                <div class="userpic">
                                    <img src="../images/people/sir.png" alt="">
                                </div>
                                <div class="userinfo-content m_t20">
                                    <span class="blue weight_700">${sessionScope.empName} ${sessionScope.empId}</span>
                                    <span>님 환영합니다.</span>
                                </div>
                                <p>빵빵덕 Corp.</p>
                            </div>
                            <div class="attend-vacation-tab flex space_between m_t20">
                                <div id="attend" style="border-right: 1px solid #e7e7e7;" class="attend_tab p_tb10 active font_14">
                                    근태정보
                                </div>
                                <div id="vacation" class="vacation_tab p_tb10 font_14">휴가정보</div>
                            </div>
                            <div class="attend-vacation-content p_20">
                                <div class="attend_box">
                                    <div class="attend_content p_b10" style="border-bottom: 1px solid #e7e7e7;">
                                        <div class="current-time-box w_100 p_tb10"
                                            style="border: 1px solid #e7e7e7; border-radius: 50px;">
                                            <p class="font_14" id="clock"></p>
                                            <p class="font_18 weight_700"></p>
                                        </div>
                                    </div>
                                    <div class="attend_time font_14 flex space_between p_t10">
                                        <div class="w_50">
                                            <button type="button" class="btn_attend" onClick="setStarttime(${sessionScope.empId});">출근</button>
                                            <p class="p_tb5 weight_700 font_18" id="startTime"></p>
                                        </div>
                                        <div class="w_50">
                                            <button type="button" class="btn_attend" onClick="setEndtime(${sessionScope.empId});">퇴근</button>
                                            <p class="p_tb5 weight_700 font_18" id="endTime"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="vacation_box">
                                    <div class="">
                                        <p class="weight_700 font_16 m_b5">내 휴가정보</p>
                                        <div class="font_14 flex" style="flex-direction:column;justify-content: space-around;">
                                            <div class="vacation_btn flex space_between p_tb10 p_lr20">
                                                <p class="">연차휴가</p>
                                                <p class="blue weight_700">16일</p>
                                            </div>
                                            <div class="vacation_btn flex space_between p_tb10 p_lr20 m_tb5">
                                                <p class="">사용연차</p>
                                                <p class="blue weight_700">15일</p>
                                            </div>
                                            <div class="vacation_btn flex space_between p_tb10 p_lr20">
                                                <p class="">잔여연차</p>
                                                <p class="blue weight_700">1일</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box_60x500 bg_white">
                            <div class="box_title p_15 m_b20 bd_b1">
                                <h3 class="noto center font_16">사내 공지사항</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>

                            <div class="buseo-wrap m_20">
                                <div class="buseo-content flex space_between p_tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="w_50 flex">
                                        <div class="buseo-icon">
                                            <img src="../images/people/man.png" alt="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font_14 weight_700">[총무팀 알림] 법인차량 사용 안내의 건
                                            </p>
                                            <p class="noto font_14">09-15 09:50 ㅇㅇㅇ 과장</p>
                                        </div>
                                    </div>
                                    <div class="w_50" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="" style="width: 20%;">
                            <div class="box_20x250 bg_white center m_b20">
                                <div class="box_title p_15 m_b10 bd_b1">
                                    <h3 class="noto font_16">9월 게시판 현황</h3>
                                    <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </div>
                                <div class="box-content p_lr10">
                                    <table class="font_14 m_t20" style="background-color: #fff;">
                                        <tr>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0;">
                                                <p class="font_12">등록</p>
                                                <p class="weight_700">14건</p>
                                            </td>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0; border-left: 1px solid #e7e7e7; border-right: 1px solid #e7e7e7;">
                                                <p class="font_12">수정</p>
                                                <p class="weight_700">6건</p>
                                            </td>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0;">
                                                <p class="font_12">삭제</p>
                                                <p class="weight_700">3건</p>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="font_14 m_t15">
                                        <tr>
                                            <td class="td_40 p_tb5"
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                게시판 분류</td>
                                            <td class=""
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                등록
                                            </td>
                                            <td class=""
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                수정
                                            </td>
                                            <td class="" style="background-color: #e7e7e7; color: #000;">삭제</td>
                                        </tr>
                                        <tr>
                                            <td class="td_40 p_tb5" style="background-color: transparent; color: #000">
                                                공지사항
                                            </td>
                                            <td style="background-color: transparent; color: #000">11건</td>
                                            <td style="background-color: transparent; color: #000">5건</td>
                                            <td style="background-color: transparent; color: #000">2건</td>
                                        </tr>
                                        <tr>
                                            <td class="td_40 p_tb5" style="background-color: transparent; color: #000">자유게시판
                                            </td>
                                            <td style="background-color: transparent; color: #000">3건</td>
                                            <td style="background-color: transparent; color: #000">1건</td>
                                            <td style="background-color: transparent; color: #000">1건</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="box_20x250 bg_white center">
                                <div class="box_title p_15 m_b10 bd_b1">
                                    <h3 class="noto font_16">9월 자산 현황</h3>
                                    <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                                </div>
                                <div class="p_lr10">
                                    <table class="font_14 m_t20" style="background-color: #fff;">
                                        <tr>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0;">
                                                <p class="font_12">등록</p>
                                                <p class="weight_700">14건</p>
                                            </td>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0; border-left: 1px solid #e7e7e7; border-right: 1px solid #e7e7e7;">
                                                <p class="font_12">고장</p>
                                                <p class="weight_700">6건</p>
                                            </td>
                                            <td class="center"
                                                style="background-color: transparent;color: #000; border: 0;">
                                                <p class="font_12">폐기</p>
                                                <p class="weight_700">3건</p>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="font_14 m_t15">
                                        <tr>
                                            <td class="td_40 p_tb5"
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                지점명</td>
                                            <td class=""
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                등록
                                            </td>
                                            <td class=""
                                                style="background-color: #e7e7e7; color: #000; border-right: 1px solid #fff;">
                                                고장
                                            </td>
                                            <td class="" style="background-color: #e7e7e7; color: #000;">폐기</td>
                                        </tr>
                                        <tr>
                                            <td class="td_40 p_tb5" style="background-color: transparent; color: #000">
                                                서울[본사]
                                            </td>
                                            <td style="background-color: transparent; color: #000">11건</td>
                                            <td style="background-color: transparent; color: #000">5건</td>
                                            <td style="background-color: transparent; color: #000">2건</td>
                                        </tr>
                                        <tr>
                                            <td class="td_40 p_tb5" style="background-color: transparent; color: #000">부산
                                            </td>
                                            <td style="background-color: transparent; color: #000">3건</td>
                                            <td style="background-color: transparent; color: #000">1건</td>
                                            <td style="background-color: transparent; color: #000">1건</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="static-grp flex space_between">
                        <div class="box_20x300 bg_white">
                            <div class="box_title p_15 bd_b1" style="height:50px;">
                                <h3 class="center font_16">시스템 공지사항</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>
                            <div class="p_tb10" style="height:250px; overflow-y: auto;">
                                <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                                    <div class="">
                                        <span class="blue weight_700 m_r5">[관리자]</span>
                                        <span class="">포트폴리오 제출의 건 안내</span>
                                    </div>
                                    <div>
                                        <span class="font_12" style="color: gray;">20-09-18</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="box_20x300 bg_white">
                            <div class="box_title p_15 center bd_b1" style="height:50px;">
                                <h3 class="noto font_16">사내교육 진행현황</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>
                            <div class="p_tb10" style="height:250px; overflow-y: auto;">
                                <div class="education-box font_14 left m_lr20 p_tb10 bd_b1">
                                    <span class="blue weight_700 m_r10">[스마트러닝]</span>
                                    <span class="">스피치스킬업! 조직에서 Good Talke...</span>
                                </div>
                                
                            </div>
                        </div>
                        <div class="box_20x300 bg_white">
                            <div class="box_title p_15 bd_b1" style="height:50px;">
                                <h3 class="noto center font_16">법인차량 사용일지</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>
                            <div class="p_tb10" style="height:250px; overflow-y: auto;">
                                <div class="font_14 left m_lr20 p_tb10 bd_b1 flex space_between">
                                    <div class="">
                                        <span class="blue weight_700 m_r5">[14가 9999 - 카니발]</span>
                                        <span class="">법인차량 사용일지</span>
                                    </div>
                                    <div>
                                        <span class="font_12" style="color: gray;">20-09-18</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="box_40x300 bg_white">
                            <div class="box_title p_15 m_b20 bd_b1">
                                <h3 class="noto center font_16">결재대기</h3>
                                <i class="fas fa-ellipsis-v font_16 gray i_position"></i>
                            </div>
                            <div class="m_t30 font_14">
                                <div class="p_lr20 flex noto weight_700"
                                    style="border-bottom: 1px solid #e7e7e7; padding-bottom: 10px;">
                                    <div style="width: 10%;" >기안일</div>
                                    <div style="width: 10%;" >문서양식</div>
                                    <div style="width: 70%;" >제목</div>
                                    <div style="width: 10%;" >첨부</div>
                                </div>
                                <div class="center p_tb10">
                                    <p class="noto weight_700">결재할 문서가 없습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/user_main.js"></script>
<script>
	function setStarttime(eid){
		var currentDate = new Date();

		var fixedTime = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(), 09, 00, 00); // 지각기준시간()

		/* 	fixedTime(오전9시) - currentDate(오늘시간)
			지각이면 fixedTime - currentDate < 0 (음수)	*/

		if( fixedTime - currentDate < 0 ){
			var late = 'Y';
		}else{
			var late = 'N';
		}	
		
		var currentYear	= addZeros(currentDate.getFullYear(),2);
		var currentMonth = addZeros(currentDate.getMonth()+1,2);
		var currentDates = addZeros(currentDate.getDate(),2);

		var calendar = currentYear + "-" + currentMonth + "-" + currentDates;
		
		$.ajax({
			url		:	"${pageContext.request.contextPath}/user/set_starttime",
			type	:	"POST",
			data	:	{
				empIdFk	:	eid,
				attendWorkdate	: calendar,
				attendLate		: late
			},
			success	:	function(resData){
				if( resData == "success" ){
					alert("출근완료");
					getWorktimes();
				}else{
					alert("이미 출근시간을 입력하였습니다.");
				}
			},
			error	:	function(){
				alert("출근시간 ajax 에러발생");
			}
		});
	}

	/*	퇴근시간 기록	*/
	function setEndtime(eid){
		var currentDate = new Date();

		var currentYear	= addZeros(currentDate.getFullYear(),2);
		var currentMonth = addZeros(currentDate.getMonth()+1,2);
		var currentDates = addZeros(currentDate.getDate(),2);

		var calendar = currentYear + "-" + currentMonth + "-" + currentDates;
		
		$.ajax({
			url		:	"${pageContext.request.contextPath}/user/set_endtime",
			type	:	"POST",
			data	:	{
				empIdFk	:	eid,
				attendWorkdate	: calendar
			},
			success	:	function(resData){
				if( resData == "success" ){
					alert("퇴근완료");
					getWorktimes();
				}else if( resData == "needStart"){
					alert("출근시간을 먼저 입력해야합니다.");
				}else{
					alert("이미 퇴근시간을 입력하였습니다.");
				}
			},
			error	:	function(){
				alert("퇴근시간 ajax 에러발생");
			}
		});
	}


	/*	입력된 출퇴근 시간 가져오기	*/
	function getWorktimes(){
		var currentDate = new Date();

		var currentYear	= addZeros(currentDate.getFullYear(),2);
		var currentMonth = addZeros(currentDate.getMonth()+1,2);
		var currentDates = addZeros(currentDate.getDate(),2);

		var calendar = currentYear + "-" + currentMonth + "-" + currentDates;
		
		$.ajax({
			url		: "${pageContext.request.contextPath}/user/get_worktimes",
			type	: "POST",
			data	: {
				empIdFk			: ${sessionScope.empId},
				attendWorkdate	: calendar
			},
			success	: function(resData){
				var startTime = document.getElementById("startTime");
				var endTime = document.getElementById("endTime");
				startTime.innerHTML = resData.starttime;
				endTime.innerHTML = resData.endtime;
			},
			error	: function(){
				alert("getStarttime ajax에러");
			}
		});
	}
	

	/*	날짜표시할때 1일이 아니라 01일 식으로 표시하기	*/
	function addZeros(num, digit){
		var zero = '';
		num = num.toString();
		if(num.length < digit){
			for(i=0; i < digit - num.length; i++ ){
				zero += '0';
			}
		}

		return zero + num;
	}

	function printClock(){
		var clock = document.getElementById("clock");
		var currentDate = new Date();

		var currentYear	= addZeros(currentDate.getFullYear(),2);
		var currentMonth = addZeros(currentDate.getMonth()+1,2);
		var currentDates = addZeros(currentDate.getDate(),2);

		var week = new Array('일','월','화','수','목','금','토');
		var today	= currentDate.getDay();
		var todayLabel	= week[today];

		var calendar = currentYear + "-" + currentMonth + "-" + currentDates + " (" + todayLabel + ")";
		
		clock.innerHTML = calendar;
	}

	$(function(){
		getWorktimes();
	});
	
</script>
<%@ include file="/WEB-INF/views/erp/user/include/FOOTER.jsp" %>
