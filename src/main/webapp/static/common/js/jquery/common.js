/* 공통 함수  */
var isRun = false;	//ajax 동작 상태값

//숫자형 체크
function isNumeric(num){
	// 좌우 trim(공백제거)을 해준다.
	num = String(num).replace(/^\s+|\s+$/g, "");
	
	if(typeof opt == "undefined" || opt == "1"){
		// 모든 10진수 (부호 선택, 자릿수구분기호 선택, 소수점 선택)
		var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
	}else{
		// only 숫자만(부호 미사용, 자릿수구분기호 미사용, 소수점 미사용)
		var regex = /^[0-9]$/g;
	}
	
	if( regex.test(num) ){
		num = num.replace(/,/g, "");
		return isNaN(num) ? false : true;
	}else{
		return false;
	}
}

//숫자 3자릿수 콤마(,) 리턴
function numberWithCommas(num) {
	if(!isNumeric(num)){
		num = 0;
	}	
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//메뉴탭 이벤트
function menuEvent() {
	$('.btn-menu').on('click', function () {
		$("#searchForm input[name=searchKeyword]").attr("disabled", false);
		if($(".menuTabBtn.on").attr("data-tab") == "category") {
			getCategoryList();	
		} else if($(".menuTabBtn.on").attr("data-tab") == "brand") {
			getBrandList();
		} else if($(".menuTabBtn.on").attr("data-tab") == "sns"){
			getSNSList();
		} else {
			getCategoryList();
		}
	});
	
	$('.menuTabBtn').on("click", function(e){
		if($(e.target).attr("data-tab") == "category") {
			getCategoryList();	
		} else if($(e.target).attr("data-tab") == "brand") {
			getBrandList();
		} else {
			getSNSList();
		}
	})
	
	$('.menuClose').on('click', function () {
	    $("#searchForm input[name=searchKeyword]").attr("disabled", true);
	});
}

//공통코드 조회
function getComnCdInfoList (groupId, codeId) {
	var codeList;
	
	$.ajax({
        url:'/common/getComnCdInfoList.doJson',
        type:'post',
        async: false,
        data : {
        	groupId : groupId,
        	codeId  : codeId
        },
        success:function(data){
        	codeList = data;
        },
        error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      	},
	});
	
	return codeList;
}

//빈값 체크
var isEmpty = (value) => {
	if (value === null) return true
	if (typeof value === 'undefined') return true
	if (typeof value === 'string' && value === '') return true
	if (Array.isArray(value) && value.length < 1) return true
	if (typeof value === 'object' && value.constructor.name === 'Object' && Object.keys(value).length < 1 && Object.getOwnPropertyNames(value) < 1) return true
	if (typeof value === 'object' && value.constructor.name === 'String' && Object.keys(value).length < 1) return true // new String()
	
	  return false;
}

//휴대폰번호 정규식체크
function isMobile(value) {
	var regExp = /^\d{3}\d{3,4}\d{4}$/;

	if(!regExp.test(value)) {            
        //경고
        return false;
	}
	return true;
}

//숫자 정규식체크(공백도 체크)
isNumber = function(data) {
	var regex= /^[\d]*$/;
	return regex.test(data);
}



