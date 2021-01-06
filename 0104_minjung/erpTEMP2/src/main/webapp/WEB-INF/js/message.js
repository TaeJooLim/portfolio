$("#delSendMsgAll").click(function() {
	var str = confirm("선택하신 메세지를 삭제하시겠습니까?");

	if (str) {
		var chkArr = new Array();
		$(".chk:checked").each(function() {
			chkArr.push($(this).attr("data-uid"));
		});

		//alert(chkArr);

		$.ajax({
			url: "/erp/common/delSendMsgAll",
			type: "POST",
			data: {
				chkSelDel : chkArr
			},
			success: function(resData) {
				alert("선택하신 메세지가 삭제되었습니다.");
				window.location.reload();
			},
			error: function() {
				alert("메세지 선택삭제 AJAX 장애발생");
			}
		});
	}
});
$("#delFromMsgAll").click(function() {
	var str = confirm("선택하신 메세지를 삭제하시겠습니까?");

	if (str) {
		var chkArr = new Array();
		$(".chk:checked").each(function() {
			chkArr.push($(this).attr("data-uid"));
		});

		//alert(chkArr);

		$.ajax({
			url: "/erp/common/delFromMsgAll",
			type: "POST",
			data: {
				chkSelDel : chkArr
			},
			success: function(resData) {
				alert("선택하신 메세지가 삭제되었습니다.");
				window.location.reload();
			},
			error: function() {
				alert("메세지 선택삭제 AJAX 장애발생");
			}
		});
	}
});