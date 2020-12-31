$(function () {
    /* 메인페이지 - 근태/휴가정보 */
    $("#attend").click(function () {
        $("#vacation").removeClass("active");
        $("#attend").addClass("active");
        $(".attend_box").show();
        $(".vacation_box").hide();
    });

    $("#vacation").click(function () {
        $("#vacation").addClass("active");
        $("#attend").removeClass("active");
        $(".attend_box").hide();
        $(".vacation_box").show();
    });
});