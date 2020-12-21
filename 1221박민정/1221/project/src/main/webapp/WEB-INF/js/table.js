
$(function(){
    $("tr:nth-child(2n+1)").addClass("tr-even");

    $(".trHover:not(:first-child)").mouseover(function(){
        $(this).addClass("hover");
    });
    
    $(".trHover:not(:first-child)").mouseout(function(){
    	$(this).removeClass("hover");
    });

    $(".trHover:nth-child(2n+1)").mouseover(function(){
        $(this).removeClass("tr-even");
        $(this).addClass("hover");
    });
    $(".trHover:nth-child(2n+1)").mouseout(function(){
        $(this).removeClass("hover");
        $(this).addClass("tr-even");
    });

    $(".page").mouseover(function(){
        $(this).addClass("hover");
    });

    $(".page").mouseout(function(){
        $(this).removeClass("hover");
    });
});
