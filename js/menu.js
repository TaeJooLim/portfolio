$(function () {
    $(".admin").click(function () {
        $("#logout").toggle();
    });
    
    $(".menu_tab").mouseleave(function(e) {
        var showid = $(this).attr("href");
        $("#sub_menu").removeClass("sub_menu");
        $(showid).removeClass("select");
    });

    $(".menu_tab").mouseover(function(e) {
        var showid = $(this).attr("href");
        $("#sub_menu").addClass("sub_menu");
        $(showid).addClass("select");

    });
});