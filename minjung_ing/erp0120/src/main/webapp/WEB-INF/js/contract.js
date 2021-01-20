
$(function() {
	 $("#search_wrap").hide();
  
   	 $("#search").click(function(){
   		if($("#contDocNum").val() == ''){
   		 alert("문서번호를 먼저 생성해주세요.");
   		}else{
   			$("#search_wrap").toggle();
   	   		};
   		 });
   	
   	$(".proc_sel_btn").click(function() {
        $("#search_wrap").hide();
        $(".search_list t").hide();
    });
    
    $("#contDpAmount").blur(function() {
    	$("#pTotalPrice").val($("#contDpAmount").val() * $("#pBuy").val());
    });
});

$(".readonly").keydown(function(e){
    e.preventDefault();
    });
$(".readonly").attr("autocomplete", "off");
 
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
 
$("#contDpAmount").keyup(function () {
     //정규표현식 = 숫자만 사용가능
     $(this).val($(this).val().replace(/[^0-9]$/gi, ""));
});


$("#contClientCompany").click(function(){
	clientCom();	
});

 function clientCom(){
 	var clientId = $("#contClientCompany option:selected").val();
 	clientComOne(clientId);
	
}

function clientComOne(clientId){
	$.ajax({
		type 	: "POST",
		url 	: "/erp/admin/contract_client",
		data	:{clientId : clientId},
		success	: function(resdata) {
					$("#clientCode").val(resdata.clientCode);
					$("#clientCompany").val(resdata.clientCompany);
					$("#clientCeoName").val(resdata.clientCeoName);
					$("#clientLicenseNum").val(resdata.clientLicenseNum);
					$("#clientCompanyPhone").val(resdata.clientCompanyPhone);
 					$("#clientResEmail").val(resdata.clientResEmail);
					$("#clientResponsibility").val(resdata.clientResponsibility);
		},
		error	: function() {
			alert("시스템 에러");
		}
	});
}

function conRegBtn(){
	var formData = $("#frm").serialize();
	$.ajax({
			url		: "/erp/admin/contract_insert",
			type	: "POST",
			data	: formData,
			success	: function(resdata) {
				alert( "문서번호가 생성되었습니다.");
				window.location.href="/erp/admin/contract_detail?contID="+resdata;
				
			},
			error	:function() {
				alert("등록에 실패했습니다. 거래처 등록여부와 사업장번호를 확인해주세요.");			
			}
		});
};

function searchfrm(){
	var formData = $("#searchfrm").serialize();
	var contID = $("#contID").val();
	$.ajax({
			url		: "/erp/admin/contract_detail_prod",
			type	: "POST",
			data	: {words:$("#words").val(),searchOpt:$("#searchOpt option:selected").val(),formData},
			success	: function(results) {
				$("#search_wrap").show();
				$(".plist").hide();
				 var str = null;
				 $("#plist").find("tr").remove();	  
				 $.each(results , function(key, results){
					 	str += '<tr>';
		                str += '<td>' + results.pId + '</td><td>' + results.pName + '</td><td>' + results.pCode + '</td><td>' + results.pModelnum + '</td><td>' + results.pBrand+ '</td>';
		                str += '<td>';
		                str += '<button type="button" id="proc_sel_btn" class="proc_sel_btn s_btn_gray" onClick="procSel('+contID+', \''+results.pName+'\');">선택</button>'; 
			            str += '</td>';
		                str += '</tr>';
		           });
		           $("#plist").append(str);            
			},
			error	:function() {
				alert("검색 실패");			
			}
		});
	
}


function procSel(contID, pName){
	window.location.href="/erp/admin/contract_detail_list?contID="+contID+"&contDpName="+pName;
};

function contDReg(){
	if(!$("#contDpAmount").val() > 0){
		alert("수량을 입력해주세요.");
		}else{
	var formData = $("#contDReg").serialize();
		$.ajax({
			url		: "/erp/admin/contract_detail_insert",
			type	: "POST",
			data	: formData,
			success	: function(resdata) {
				alert( "품목이 등록되었습니다.");
				window.location.href="/erp/admin/contract_detail?contID="+resdata;
			},
			error	:function() {
				alert("시스템 에러");			
			}
		});
		};	
};

function contDDel(contDID){
	if( confirm("등록된 품목 삭제하시겠습니까?") ) {
	$.ajax({
		url		: "/erp/admin/contract_detail_delete",
		type	: "POST",
		data	: {contDID : contDID},
		success	: function(resData) {
			alert( "품목 삭제되었습니다.");
			window.location.reload();
			
		},
		error	:function() {
			alert("시스템 에러");			
		}
	});
	}else{
		window.location.reload();
		}
}

//contract_modify

 function searchfrmDM(){
		var formData = $("#searchfrmDM").serialize();
		var contDocNum = $("#contDocNum").val();
		$.ajax({
				url		: "/erp/admin/contract_modify_prod",
				type	: "POST",
				data	: {words:$("#words").val(),searchOpt:$("#searchOpt option:selected").val(),formData},
				success	: function(results) {
					var str = null;
					$("#plist").append(str);
					$("#search_wrap").show();
					$(".plist").hide();
					 $("#plist").find("tr").remove();
					 $.each(results , function(key, results){
							str += '<tr>';
			                str += '<td>' + results.pId + '</td><td>' + results.pName + '</td><td>' + results.pCode + '</td><td>' + results.pModelnum + '</td><td>' + results.pBrand+ '</td>';
			                str += '<td> <button type="button" id="" class="proc_sel_btn s_btn_gray" onClick="procSelDM(\''+contDocNum+'\', \''+results.pName+'\');">선택</button> </td>';
			                str += '</tr>';
			           });
			           $("#plist").append(str);
					
				},
				error	:function() {
					alert("검색 실패");			
				}
			});
		
	}

 function procSelDM(contDocNum, pName){
	 window.location.href="/erp/admin/contract_modify?contDocNum="+contDocNum+"&contDpName="+pName;
	 }	

function conUpBtn(){
	var formData = $("#frm").serialize();
	$.ajax({
			url		: "/erp/admin/contract_modify_update",
			type	: "POST",
			data	: formData,
			success	: function(resdata) {
				alert( "계약서가 수정되었습니다.");
				window.location.reload();
				
			},
			error	:function() {
				alert("수정에 실패했습니다.");			
			}
		});
};
function contDMReg(){
	if(!$("#contDpAmount").val() > 0){
		alert("수량을 입력해주세요.");
	}else{
		var formData = $("#contDMReg").serialize();
		
		$.ajax({
			url		: "/erp/admin/contract_modify_insert",
			type	: "POST",
			data	: formData,
			success	: function(resdata) {
				alert( "품목이 등록되었습니다.");
				window.location.href="/erp/admin/contract_modify?contDocNum="+resdata;
			},
			error	:function() {
				alert("시스템 에러");			
			}
		});
	};
};

