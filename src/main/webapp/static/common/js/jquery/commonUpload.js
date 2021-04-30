var cuDelFileSeq = ""; // 삭제 fileseq 저장 (00001,00002,...)

//이미지삭제
function deleteImage(obj) {		
	
	var parent = $(obj).parent(".upload-thumbnail");
	var separator = isEmpty(cuDelFileSeq) ? "" : ",";  
	
	var fileSeq = parent.children("input[name=fileSeq]").val();
	if(!isEmpty(fileSeq)){
		cuDelFileSeq += separator + fileSeq;
	}		
	parent.remove();
	
	if($(".img-upload-btn").length == 0) {
		addUploadFileDiv();	//이미지 추가 div 없으면 추가
	}
}

//이미지 셋팅
function setImg(obj) {
	if(obj.files && obj.files[0]) {
		var fileSize = obj.files[0].size;
		var maxSize = (10 * 1024 * 1024);    //10MB
		if(fileSize > maxSize) {
			alert("첨부이미지 사이즈는 10MB 이내로 등록 가능합니다. ");
			fileClear(obj);		//파일클리어
			return false;
		} else {
			var reader = new FileReader();
			reader.onload = function (e) {
				$(obj).parent().parent().find(".loadImg").attr('src', e.target.result);
			}
			reader.readAsDataURL(obj.files[0]);
		}
		
		$(obj).attr("name", "uploadFile");
	    $(".img-upload-btn").addClass("upload-thumbnail");
	    $(".img-upload-btn .img-thumbnail").show();
	    $(".img-upload-btn .img-del-btn").show();
	    
	    $(".img-upload-btn .file_hide").hide();
	    $(".img-upload-btn").removeClass("img-upload-btn");
	    
	    addUploadFileDiv();
	}
}
	
//이미지 업로드 div 추가
function addUploadFileDiv() {
	//썸네일 3개이상일때 추가 안함
	if($(".upload-thumbnail").length >= 3) {
		return false;
	} else {
		var str = "";
			str += '<div class="img-upload-btn">'
	   		str += '	<label class="file_hide">'
	   		str += '		<input type="file" class="fileImage" accept="image/gif, image/jpg, image/png, image/jpeg" />'
	   		str += '	</label>'
	   		str += '	<span class="img-thumbnail" style="display: none;">'
	   		str += '		<img class="loadImg" />'
	   		str += '	</span>'
	   		str += '	 <button class="img-del-btn" style="display: none;">삭제</button>'
	   		str += '</div>';
		
		$(".sm-upload-area").append(str);
	}
}

//파일 초기화
function fileClear(obj){
    //ie 브라우저 체크
    if ($.browser.msie) {
        $(obj).replaceWith($(obj).clone(true));
    } else {
        $(obj).val("");
    }
}