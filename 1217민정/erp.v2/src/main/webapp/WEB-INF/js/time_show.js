function showDate() {
    var clock = document.getElementById("date");
    var today = new Date();

    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var nowDate = (today.getFullYear()) + "-" + (today.getMonth()+1) + "-" + (today.getDate()) + " (" + week[(today.getDay())] + ")" ;
    date.innerHTML = nowDate;
    setTimeout("showTime()", 1000);
}

function showTime() {
    var clock = document.getElementById("clock");
    var today = new Date();

    var nowTime = (today.getHours()) + " : " + (today.getMinutes()) + " : " + (today.getSeconds());
    clock.innerHTML = nowTime;
    setTimeout("showTime()", 1000);
}
window.onload = function() {
    showTime();
    showDate();
}