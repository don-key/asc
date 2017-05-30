<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
}

</style>
<!-- Modal -->
<div class="modal fade" id="fileUploadModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="background: #354555; color: #ffffff;">
				<button type="button" class="close" data-dismiss="modal"></button>
				<h4 class="modal-title" style="font-weight: bolder;">
					파일 업로드 <i class="fa fa-upload fa-lg"></i>
				</h4>
			</div>

			<form id="uploadForm" action="/project/uploadAjax" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label for="fileUpload" style="font-size: 15px;"> 제목 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" id="" style="width: 100%;">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1"></div>
						<div class="col-xs-8">
							<div class="thumbnail">
								<div class="fileDrop"></div>
							</div>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;">파일 선택</label>
						</div>
						<div class="col-xs-8">
							<input type="file" class="form-control" name="file" style="width: 100%">
						</div>
					</div>
					<br>


					<div class="modal-footer">
						<div class="row">
							<div class="col-xs-2 col-xs-offset-4">
								<button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">등록</button>
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	
	// 전달된 파일 데이터를 가져오는 부분
	var files = event.originalEvent.dataTransfer.files;	// dataTransfer : 이벤트와 같이 전달된 데이터, dataTransfer.files : 그 안에 포함된 파일 데이터 찾아내기 위함
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: '/project/uploadAjax',
		data : formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
			alert(data);
		}
	});
});
</script>