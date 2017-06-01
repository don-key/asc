<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

<style>
.panel {
	margin-top: 10% !important
}

.popup {position: absolute;}
.back {background-color: gray; opacity: 0.5; width: 8	0%; height: 30%;  overflow: hidden;z-index: 1101;}
.front {z-index: 1110; opacity: 1; border: 1px; margin: auto;}
.show {position: relative; max-width: 800px; max-height: 600px; overflow: auto;}
</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<br> <img alt="" src="/resources/images/header/library.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
		</div>
	</div>

	<div class="row">

		<div class="">
			<a id="" class="btn btn-default btn-lg" style="margin-left: 85%;" data-toggle="modal" data-target="#fileUploadModal"> <i class="fa fa-upload fa-lg"></i> 파일 업로드
			</a>
		</div>
		
		<c:forEach items="${list }" var="libraryList">
		
		<form role="form" method="post">
			<input type="hidden" name="libraryListNo" value="${libraryList.libraryListNo }">
		</form>
		
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<!-- 업로드시 입력한 제목 보여주기 -->
						${libraryList.title } <a class="btn btn-default btn-sm" style="float: right; padding: 2px 9px;"> <i class="fa fa-trash-o fa-sm" id="removeBtn"></i>
						</a>
					</div>

					<div class="panel-body">
						<!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
						<p>
							<a href="/resources/images/file.png" class="thumbnailList" style="color: black;"> <img src="/resources/images/file.png" width="20%" >${libraryList.fileName }</a>
						</p>
					</div>
					<div class="panel-footer">작성자 : ${libraryList.userNo }</div>
				</div>
			</div>

		</c:forEach>
	</div>
	<!-- /.row -->
	
	<!-- 원본 이미지의 경우 큰 크기로 보여주기 위해 div 숨겨놓기 -->
	<div class="popup back" style="display: none;"></div>
		<div id="popup_front" class="popup front" style="display: none;">
		<img id="popup_img">
	</div>
	
</div>


<!-- Modal -->
<jsp:include page="include/fileUploadModal.jsp" />

<script>
	$(".thumbnailList").on("click", function(event) {
		
		var fileLink = $(this).attr("href");
		
		if (checkImageType(fileLink)) {
			event.preventDefault();
			
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
			
			$(".popup").show('slow');
			imgTag.addClass("show");
		}
	});
	
	$("#popup_img").on("click", function() {
		$(".popup").hide('slow');
	});
	
	$("#removeBtn").on("click", function() {
		var formObj = $("form[role='form']");

		console.log(formObj);
		
		formObj.attr("action", "/project/remove");
		formObj.submit();
	});

	/** 파일의 확장자가 존재하는지 검사 */
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;	// i는 대소문자 구분 없음을 의미
		
		return fileName.match(pattern);
	}
	
	function getFileInfo(fullName) {
		var fileName, imgsrc, getLink;
		
		var fileLink;
		
		if (checkImageType(fullName)) {
			imgsrc = "/displayFile?fileName=" + fullName;
			fileLink = fullName.substr(7);
			
			var front = fileName.substr(0, 5);	// /asc 경로 추출
			var end = fileName.substr(7); 	// s_ 제거
			
			getLink = "/displayFile?fileName=" + front + end;
		} else {
			imgsrc = "resources/images/noimage.png";
			fileLink = fullName.substr(7);
			getLink = "/displayFile?fileName=" + fullName;
		}
		
		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	}
</script>