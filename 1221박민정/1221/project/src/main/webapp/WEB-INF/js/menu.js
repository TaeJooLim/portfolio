$(function(){
    $(".menu").click(function(){
        if($(this).find(".submenu").is(":visible")){
            $(this).find(".submenu").slideUp(200);
            $(this).toggleClass('changed');
        }
        else{
            $(this).find(".submenu").slideDown(200);
            $(this).toggleClass('changed');
        }
    });

    $(".userInfo_detail").click(function(){
        if($(this).find(".changeStatus").is(":visible")){
            $(this).find(".changeStatus").slideUp(200);
        }
        else{
            $(this).find(".changeStatus").slideDown(200);
        }
    });
    
});