<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="/resources/css/library/lightbox.css" rel="stylesheet">

<script src="/resources/js/library/lightbox.js"></script>

<style>
a{
color: black;
}
.panel {
	margin-top: 10% !important
}

</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<br> <img alt="" src="/resources/images/header/library.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
		</div>
	</div>

	<div class="row">

		<div class="">
			<a id="" class="btn btn-default btn-lg" style="margin-left: 85%;" data-toggle="modal" data-target="#fileUploadModal"> 
				<i class="fa fa-upload fa-lg"></i> 파일 업로드
			</a>
		</div>

		<!-- 원본 이미지의 경우 큰 크기로 보여주기 위해 div 숨겨놓기 -->
		<div class="popup back" style="display: none;"></div>
		<div id="popup_front" class="popup front" style="display: none;">
			<img id="popup_img">
		</div>
			<c:choose>
				<c:when test="${empty list }">
					<div style="margin-top: 10%">
						<p style="text-align: center; font-size: 20px"> <mark>자료실 내역이 존재하지 않습니당</mark></p>
					</div>
				</c:when>
				
				<c:otherwise>
				<c:forEach items="${list }" var="libraryList" varStatus="status">

					<form role="form" method="post">
						<input type="hidden" name="libraryListNo" value="${libraryList.libraryListNo }">
					</form>

					<!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<div class="panel panel-info">
							<div class="panel-heading">
								${libraryList.title }
								
								<c:if test="${login.userNo == libraryList.userNo }">
									<a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
										<i class="fa fa-trash-o fa-sm"></i> 
									</a>
								</c:if>
								
							</div>

							<div class="panel-body" style="height: 90px">
								<div class="libraryList">
									<a href="/resources/images/upload${libraryList.uuidName}" class="thumbnailList" data-lightbox="image-${status.index}"> 
										<img src="/resources/images/upload${libraryList.uuidName}" width="20%"  class="thumbnailImage" onerror='this.src="/resources/images/file.png"'/>
										${libraryList.fileName }
									</a>
									<input type="hidden" id="uuid" value="${libraryList.uuidName}">
								</div>
							</div>
							
							<div class="panel-footer">	작성자 : ${name[status.index].name}
							<a class="btn btn-default btn-sm" id="downloadBtn"  onclick="downloadFunc('${libraryList.uuidName}')" style="float: right; padding: 2px 9px;"> 
									<i class="fa fa-download fa-sm"></i> 
							</a>
							</div>
							
						</div>
					</div>
				</c:forEach>
			</c:otherwise>

			</c:choose>
	</div>
	<!-- /.row -->

</div>

<!-- Modal -->
<jsp:include page="include/fileUploadModal.jsp" />


<script>
/** 삭제 버튼 이벤트 처리 */
	$(".removeBtn").on("click",	function() {
		var link = $(this).parent().parent().parent().prev();
		swal({
			title : '자료를 삭제하시겠습니까?',
			text : "",
			type : 'question',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : 'Yes',
			cancelButtonText : 'No',
		}).then(function() {
				var formObj = link;
				var projectListNo = location.pathname.split('/')[3];
				var userNo = ${login.userNo};
				var arr = [];
				$(".thumbnailList img").each(function(index) {
					arr.push($(this).attr("src"));
					console.log(arr);
				});

				$.post("/project/deleteAllFiles", {files : arr}, function() {

				});

				formObj.attr("action", "/project/remove/"+projectListNo+"/"+userNo);
				formObj.submit();
				link = '';
			})
	});

	/** 다운로드 클릭 시 이벤트 */
	function downloadFunc(uuidName){
		event.preventDefault();
		
		var data = uuidName;
		var url="";
		
			if (checkImageType(data)) {
			var front = data.substring(0, 5);	// /asc 경로 추출
			var end = data.substring(7); 	// s_ 제거
			
			location.href = "/project/library/1/displayFile?fileName="+front+end; 
		} else {
			location.href = "/project/library/1/displayFile?fileName="+data; 
		} 
	}

	/** 파일의 확장자가 존재하는지 검사 */
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i; // i는 대소문자 구분 없음을 의미
	
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
			imgsrc = "resources/images/file.png";
			fileLink = fullName.substr(7);
			getLink = "/displayFile?fileName=" + fullName;
		}
		
		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	}

</script>