$(function () {
    $(".admin").click(function () {
        $("#logout").toggle();
    });
    
    $("#sub_menu").mouseleave(function(e) {
        $(".menu_tab").removeClass("bg_white");
        
        $("#sub_menu").removeClass("sub_menu");
        $(".menu").hide();
    });

    $(".menu_tab").mouseover(function(e) {
        $(".menu_tab").removeClass("bg_white");
        $(".menu").hide();

        var showid = $(this).attr("href");
        $(this).addClass("bg_white");
        $("#sub_menu").addClass("sub_menu");
        $(showid).show();
    }); 
});