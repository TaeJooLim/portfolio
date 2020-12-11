$(function () {
    $(".admin").click(function () {
        $("#logout").toggle();
    });
    $(".nav_icon").click(function () {
        $(".sub_menu").toggle();
    });
    $(".menu_tab").on("click", function (e) {
        $(".menu_tab").removeClass("active");
        $(this).addClass("active");
        $(".sub_menu").show();
        $(".menu").removeClass("select");

        $($(this).attr("href")).addClass("select");
        e.preventDefualt();
    });
});