 $(function () {

     $(".admin").click(function () {
         $("#logout").toggle();
     });
 });

 $(function () {
     $(".nav-icon").click(function () {
         $(".sub-menu").toggle();
     });
 });


 $(function () {
     $(".menu-tab").on("click", function (e) {
         $(".menu-tab").removeClass("active");
         $(this).addClass("active");
         $(".sub-menu").show();
         $(".menu").removeClass("select");

         $($(this).attr("href")).addClass("select");
         e.preventDefualt();
     });
 });
