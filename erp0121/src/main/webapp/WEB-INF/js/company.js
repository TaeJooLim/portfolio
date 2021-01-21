// 전화번호 자동 하이픈
var autoHypen = function(str) {
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) {
		return str;
	} else if (str.length < 7) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	} else if (str.length < 11) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	} else {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}

	return str;
}

$("#comTel, #comCp").keyup(function() {
	console.log(this.value);
	this.value = autoHypen(this.value);
});

// 사업자번호 자동 하이픈
var autoHypenNum = function(str) {
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) {
		return str;
	} else if (str.length < 6) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	} else {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 2);
		tmp += '-';
		tmp += str.substr(5);
		return tmp;
	}
	return str;
}

$("#comNum").keyup(function() {
	console.log(this.value);
	this.value = autoHypenNum(this.value);
});


// 등록한 이미지 바로표시
function readcomCeoImage(imgFile) {
	if (imgFile.files && imgFile.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#comCeoImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(imgFile.files[0]);
	}
	else {

	}
};
function readcomStampImage(imgFile) {
	if (imgFile.files && imgFile.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#comStampImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(imgFile.files[0]);
	}
	else {

	}
};
function readcomCeoStampImage(imgFile) {
	if (imgFile.files && imgFile.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#comCeoStampImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(imgFile.files[0]);
	}
	else {

	}
};
function readcomCeoSignImage(imgFile) {
	if (imgFile.files && imgFile.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#comCeoSignImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(imgFile.files[0]);
	}
	else {

	}
};
$("#comCeoImgBtn").change(function() {
	readcomCeoImage(this);
});
$("#comStampImgBtn").change(function() {
	readcomStampImage(this);
});
$("#comCeoStampImgBtn").change(function() {
	readcomCeoStampImage(this);
});
$("#comCeoSignImgBtn").change(function() {
	readcomCeoSignImage(this);
});