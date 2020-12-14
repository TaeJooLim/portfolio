$(function () {
    $(".admin").click(function () {
        $("#logout").toggle();
    });
    
    $("#sub_menu").mouseleave(function(e) {
        var showid = $(this).attr("href");
        $("#sub_menu").removeClass("sub_menu");
        $(".menu").hide();
    });
    $(".menu_tab").mouseleave(function(e) {
        var showid = $(this).attr("href");
    });

    $(".menu_tab").mouseover(function(e) {
        $(".menu").hide();
        var showid = $(this).attr("href");
        $("#sub_menu").addClass("sub_menu");
        $(showid).show();
    }); 
});