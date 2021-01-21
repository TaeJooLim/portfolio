 function headChange(head, empNum) {
                    if (confirm("부서장 설정을 변경하시겠습니까?")) {

                        var headType;
                        if (head == 'Y') headType = 'N';
                        else headType = 'Y';

                        // alert(headType);

                        var data = {
                            headType: headType,
                            empNum: empNum
                        }

                        $.ajax({
                            url: "/erp/admin/head_change",
                            type: "POST",
                            data: data,
                            success: function(resData) {
                                alert("부서장 설정이 변경되었습니다.");
                                window.location.reload();
                            },
                            error: function() {
                                alert("설정 변경에 실패했습니다.\n관리자에게 문의하세요.")
                            }
                        });


                    } else {
                        window.location.reload();
                    }
                }

                function confirmChange(confirm, empNum) {

                    var confirmType;
                    if (confirm == 'Y') confirmType = 'N';
                    else confirmType = 'Y';

                    var data = {
                        confirmType: confirmType,
                        empNum: empNum
                    }

                    $.ajax({
                        url: "/erp/admin/confirm_change",
                        type: "POST",
                        data: data,
                        success: function(resData) {
                            alert("승인 설정이 변경되었습니다.");
                            window.location.reload();
                        },
                        error: function() {
                            alert("설정 변경에 실패했습니다.\n관리자에게 문의하세요.")
                        }
                    });

                }

                var flag = false;

                function chkAll() {

                    var chk = document.getElementsByName("chk");
                    if (flag == false) { //선택 x
                        flag = true;

                        for (var i = 0; i < chk.length; i++) {
                            chk[i].checked = true;
                        }

                    } else {
                        flag = false;
                        for (var i = 0; i < chk.length; i++) {
                            chk[i].checked = false;
                        }
                    }
                }

                $("#deleteAll").click(function() {
                    var str = confirm("선택하신 정보를 삭제하시겠습니까?");

                    if (str) {
                        var chkArr = new Array();
                        $(".chk:checked").each(function() {
                            chkArr.push($(this).attr("data-uid"));
                        });

                        //alert(chkArr);

                        $.ajax({
                            url: "/erp/admin/employee_delete",
                            type: "POST",
                            data: {
                                chkArr: chkArr
                            },
                            success: function(resData) {
                                alert("삭제되었습니다.");
                                window.location.reload();
                            },
                            error: function() {
                                alert("선택하신 회원정보가 없습니다.");
                            }
                        });
                    }
                });

                function deleteOne(empId) {

                    var str = confirm("선택하신 정보의 모든 내용이 삭제됩니다.\n그래도 선택하신 삭제하시겠습니까?");
                    if (str) {

                        $.ajax({
                            url: "/erp/admin/employee_delete",
                            type: "POST",
                            data: {
                                empId: empId
                            },
                            success: function(resData) {
                                alert("삭제되었습니다.");
                                window.location.reload();
                            },
                            error: function() {
                                alert("취소 되었습니다.");
                            }
                        });

                    }
                }
                
                function authChange(auth, empId) {
        		
        		if( confirm("권한을 변경하시겠습니까?") ) {
        			var reqData = {
        					auth 	: auth,
        					empId	: empId
        			};
        	
        			$.ajax({
        				url 	: "/erp/admin/auth_change",
        				type	: "POST",
        				data	: reqData,
        				success	: function(resData) {
        					alert("권한이 변경되었습니다.");
        					window.location.reload();
        				},
        				error	: function() {
        					alert("시스템 오류입니다.");
        				}
        			});
        		}else{
        			window.location.reload();
        		}
        	}