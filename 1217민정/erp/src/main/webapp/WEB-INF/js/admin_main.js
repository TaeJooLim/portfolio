$(function () {
    /* 메인페이지 - 근태/휴가정보 */
    $("#attend").click(function () {
        $("#vacation").removeClass("btn_blue_active");
        $("#attend").addClass("btn_blue_active");
        $(".attend_box").show();
        $(".vacation_box").hide();
    });

    $("#vacation").click(function () {
        $("#vacation").addClass("btn_blue_active");
        $("#attend").removeClass("btn_blue_active");
        $(".attend_box").hide();
        $(".vacation_box").show();
    });
});