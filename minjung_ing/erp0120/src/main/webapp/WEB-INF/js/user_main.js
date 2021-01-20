function addZeros(num, digit) {
    var zero = '';
    num = num.toString();
    if (num.length < digit) {
        for (i = 0; i < digit - num.length; i++) {
            zero += '0';
        }
    }

    return zero + num;
}

function showDate() {
   var clock = document.getElementById("date");
   var today = new Date();

   var week = ['일', '월', '화', '수', '목', '금', '토'];
   var nowDate = (today.getFullYear()) + "-" + addZeros((today.getMonth()+1), 2) + "-" + addZeros((today.getDate()), 2) + " (" + week[(today.getDay())] + ")" ;
   date.innerHTML = nowDate;
   setTimeout("showTime()", 1000);
}

function showTime() {
   var clock = document.getElementById("clock");
   var today = new Date();

   var nowTime = addZeros((today.getHours()), 2) + " : " + addZeros((today.getMinutes()), 2) + " : " + addZeros((today.getSeconds()), 2);
   clock.innerHTML = nowTime;
   setTimeout("showTime()", 1000);
}


function getWorktimes() {
	var currentDate = new Date();

    var currentYear = addZeros(currentDate.getFullYear(), 2);
    var currentMonth = addZeros(currentDate.getMonth() + 1, 2);
    var currentDates = addZeros(currentDate.getDate(), 2);
    var empIdFk = $("#hiddenId").val();

    var calendar = currentYear + "-" + currentMonth + "-" + currentDates;
    
    $.ajax({
    	url : "/erp/user/get_worktimes",
    	type : "POST",
    	data : {empIdFk: empIdFk,attendWorkdate: calendar},
    	success: function (resData) {
            var startTime = document.getElementById("startTime");
            var endTime = document.getElementById("endTime");
            startTime.innerHTML = resData.starttime;
            endTime.innerHTML = resData.endtime;
        },
        error: function () {
            alert("getStarttime ajax에러");
        }
    });
}
 
function setStarttime(eid) {
    var currentDate = new Date();

    var fixedTime = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(), 09, 00,
    00); // 지각기준시간()

    /* 	fixedTime(오전9시) - currentDate(오늘시간)
    	지각이면 fixedTime - currentDate < 0 (음수)	*/

    if (fixedTime - currentDate < 0) {
        var late = 'Y';
    } else {
        var late = 'N';
    }

    var currentYear = addZeros(currentDate.getFullYear(), 2);
    var currentMonth = addZeros(currentDate.getMonth() + 1, 2);
    var currentDates = addZeros(currentDate.getDate(), 2);

    var calendar = currentYear + "-" + currentMonth + "-" + currentDates;

	        
    $.ajax({
        url: "/erp/user/set_starttime",
        type: "POST",
        data: {
            empIdFk: eid,
            attendWorkdate: calendar,
            attendLate: late
        },
        success: function (resData) {
            if (resData == "success") {
                alert("출근완료");
                getWorktimes();
            } else {
                alert("이미 출근시간을 입력하였습니다.");
            }
        },
        error: function () {
            alert("출근시간 ajax 에러발생");
        }
    });
}

function setEndtime(eid) {
    var currentDate = new Date();

    var currentYear = addZeros(currentDate.getFullYear(), 2);
    var currentMonth = addZeros(currentDate.getMonth() + 1, 2);
    var currentDates = addZeros(currentDate.getDate(), 2);

    var calendar = currentYear + "-" + currentMonth + "-" + currentDates;

    $.ajax({
        url: "/erp/user/set_endtime",
        type: "POST",
        data: {
            empIdFk: eid,
            attendWorkdate: calendar
        },
        success: function (resData) {
            if (resData == "success") {
                alert("퇴근완료");
                getWorktimes();
            } else if (resData == "needStart") {
                alert("출근시간을 먼저 입력해야합니다.");
            } else {
                alert("이미 퇴근시간을 입력하였습니다.");
            }
        },
        error: function () {
            alert("퇴근시간 ajax 에러발생");
        }
    });
}

$(function() {
	showTime();
	showDate();
	getWorktimes();

    $("#notice").click(function () {
        $("#system").removeClass("active");
        $("#notice").addClass("active");
        $(".notice_box").show();
        $(".system_box").hide();
    });

    $("#system").click(function () {
        $("#system").addClass("active");
        $("#notice").removeClass("active");
        $(".notice_box").hide();
        $(".system_box").show();
    });
});
