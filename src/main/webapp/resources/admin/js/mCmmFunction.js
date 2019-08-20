// 공백이 있나 없나 체크
function checkSpace(str) {
	if (str.search(/\s/) != -1) {
		return true;
	} else {
		return false;
	}
}
// 특수 문자가 있나 없나 체크
function checkSpecial(str) {
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if (special_pattern.test(str) == true) {
		return true;
	} else {
		return false;
	}
}

// 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크)
function checkPasswordPattern(str) {
	var pattern1 = /[0-9]/;// 숫자
	var pattern2 = /[a-zA-Z]/; // 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	if (!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str)
			|| str.length < 8) {
		alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
		return false;
	} else {
		return true;
	}
}

// 금액 표시 1 (ex) 10000 -> 10,000)
function comma(str) {
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 금액 표시 2 (ex) 10000 -> 10,000)

function showNumComma(data) {
	var pattern = /(-?[0-9]+)([0-9]{3})/;
	var value = String(data).replace(/[^0-9\,]/g, "");
	value = value.replace(/,/g, '');
	while (pattern.test(value)) {
		value = value.replace(pattern, "$1,$2");
	}
	return value;
}

// 금액 표시 3 (ex) 10000 -> 10,000)

function getMoneyFormat(m) {
	var a, b;
	if (m.toString().indexOf('.') != -1) {
		var nums = m.toString().split('.');
		a = nums[0];
		b = '.' + nums[1];
	} else {
		a = m;
		b = "";
	}
	return a.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + b;
}

// null 체크
function isNull(obj) {
	return (typeof obj != "undefined" && obj != null && obj != "") ? false
			: true;
}

// length - n의 length 만큼 '0' 추가 (n: 데이터, length: 리턴할 데이터 길이)

function plusZero(n, length) {
	var zero = '';
	n = n.toString();
	if (n.length < length) {
		for (var i = 0; i < length - n.length; i++)
			zero += '0';
	}
	return n + zero;
}

// 첨부파일 확장자 확인
function checkImg(obj, ext){
	var check = false;
	var extName = $(obj).val().substring($(obj).val().lastIndexOf(".")+1).toLowerCase();
	var str = ext.split(",");

	for (var i=0;i<str.length;i++) {
		if ( extName == $.trim(str[i]) ) {
			check = true; break;
		} else {
			check = false;
		}
	}
	if(!check){
		alert(ext+" 이미지 파일만 업로드 가능합니다.");
	}
	return check;
}

// 첨부파일 용량 확인
function checkImgSize(obj, size) {
	var check = false;
	if(window.ActiveXObject) {
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		var filePath = obj[0].value;
		var thefile = fso.getFile(filePath);
		sizeinbytes = thefile.size;
	} else {
		sizeinbytes = obj[0].files[0].size;
	}

	var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	var i = 0;
	var checkSize = size;
	while(checkSize>900) {
		checkSize/=1024; i++;
	}

	checkSize = (Math.round(checkSize*100)/100)+' '+fSExt[i];
	var fSize = sizeinbytes;
	if(fSize > size) {
		alert("첨부파일은 "+ checkSize + " 이하로 등록가능합니다.");
		check = false;
	} else {
		check = true;
	}

	return check;
}


/** * 특수문자 여부 체크 * * @param 데이터 */
function checkSpecial(str) {
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		return special_pattern.test(str);
}

/** * 전화번호 포맷으로 변환 * * @param 데이터 */
function formatTel(phoneNum) {
	if(isPhone(phoneNum)) {
		var rtnNum;
		var regExp =/(02)([0-9]{3,4})([0-9]{4})$/;
		var myArray;
		if(regExp.test(phoneNum)){
			myArray = regExp.exec(phoneNum);
			rtnNum = myArray[1]+'-' + myArray[2]+'-'+myArray[3];
			return rtnNum;
		} else {
			regExp =/(0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			if(regExp.test(phoneNum)){
				myArray = regExp.exec(phoneNum);
				rtnNum = myArray[1]+'-'+myArray[2]+'-'+myArray[3];
				return rtnNum;
			} else {
				return phoneNum;
			}
		}
	} else {
		return phoneNum;
	}
}

/** * 핸드폰번호 포맷으로 변환 * * @param 데이터 */

function formatPhone(phoneNum) {
	if(isMobile(phoneNum)) {
		var rtnNum;
		var regExp =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		var myArray;
		if(regExp.test(phoneNum)){
			myArray = regExp.exec(phoneNum);
			rtnNum = myArray[1]+'-'+myArray[2]+'-'+myArray[3];
			return rtnNum;
		} else {
			return phoneNum;
		}
	} else {
		return phoneNum;
	}
}

/** * 전화번호 형식 체크 * * @param 데이터 */
function isTel(telNum) {
	var regExp =/(02)-([0-9]{3,4})-([0-9]{4})$/;
	//var regExp =/(02)([0-9]{3,4})([0-9]{4})$/;
	var myArray;

	if(regExp.test(telNum)){
		myArray = regExp.exec(telNum);
		return true;
	} else {
		regExp =/(0[3-9]{1}[0-9]{1})-([0-9]{3,4})-([0-9]{4})$/;
		//regExp =/(0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		if(regExp.test(telNum)){
			myArray = regExp.exec(telNum);
			return true;
		} else {
			return false;
		}
	}
}

/** * 핸드폰번호 형식 체크 * * @param 데이터 */
function isPhone(phoneNum) {

	var regExp =/(01[016789])-([1-9]{1}[0-9]{2,3})-([0-9]{4})$/;
	//var regExp =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	var myArray;

	if(regExp.test(phoneNum)){ myArray = regExp.exec(phoneNum);
		return true;
	} else {
		return false;
	}
}

/** * 이메일 형식 체크 * * @param 데이터 */
function isEmail(email) {
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	return exptext.test(email);
}


$(function () {
 	 $(".datepicker").datepicker({
 		dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        //,changeMonth: true //콤보박스에서 월 선택 가능
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']//달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
    });

    //초기값을 오늘 날짜로 설정
    //$('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)



	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') {
				//직접입력일 경우
				$("#email2").val('');
				//값 초기화
				$("#email2").attr("readonly", false);
				//활성화
			} else {
				//직접입력이 아닐경우
				$("#email2").val($(this).text());
				//선택값 입력
				$("#email2").attr("readonly", true);
				//비활성화
			}
		});
	});

	if($("#email2").val() != ''){
		$("#selectEmail option").each(function() {
			if($("#email2").val().trim() == $(this).val().trim()){
				$(this).attr("selected", "selected");
			}
		});
	}

})


