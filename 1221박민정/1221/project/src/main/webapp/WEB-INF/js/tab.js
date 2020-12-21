$(function () {
    $("#open").click(function() {
        $("#open").addClass("active");
        $("#close").removeClass("active");
    });

    $("#open-org").click(function() {
        $("#close-org").removeClass("active");
        $("#open-org").addClass("active");
    });

    $("#close-org").click(function() {
        $("#open-org").removeClass("active");
        $("#close-org").addClass("active");
    });
});