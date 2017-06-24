<%@ page contentType="text/html; charset=UTF-8"%>
<style>

.uploadedList {
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
			
			<form id="uploadForm"  action="/project/registLibraryList"  method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;"> 제목 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" name="title" id="title" style="width: 100%;">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1"></div>
						<div class="col-xs-8">
							<div class="thumbnail">
								<div class="uploadedList" id="holder"></div>
							</div>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-xs-2 col-xs-offset-1">
							<label style="font-size: 15px;" >파일 선택</label>
						</div>
						<div class="col-xs-8">
                            <button id="fileBtn" class="btn btn-primary" style="background-color:#354555; margin:-4px 2px; border:#354555;">파일선택</button>
							<input type="file" class="fileSelect" style="display:none;" id="fileSelect" name="file" style="width: 100%">
							<input type="hidden"  id="uuidName"  name="uuidName">
							<input type="hidden"  id="displayName"  name="displayName">
							<input type="hidden"  id="userNo"  name="userNo" value="${login.userNo }">
                            <input type="hidden" name="projectListNo" value="${projectListNo}">
						</div>
					</div>
					<br>

					<div class="modal-footer">
						<div class="row">
							<div class="col-xs-2 col-xs-offset-4">
								<button type="submit" class="btn btn-warning"  style="width: 100%; font-size: 15px; font-weight: bold;">등록</button>
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-default" id="cancelBtn" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; ">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
/** 파일선택 CSS*/
$("#fileBtn").on('click', function(){
	event.preventDefault();
   $("#fileSelect").trigger('click');
});


$(function() {
	var userNo = ${login.userNo};
	var projectListNo = location.pathname.split('/')[3];
	$(".uploadedList").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".uploadedList").on("drop", function(event) {
		event.preventDefault();
	});
	
	
	$(".fileSelect").on("change", function(e) {
		e.preventDefault();
		
		var upload = $('.fileSelect');
		// 전달된 파일 데이터를 가져오는 부분
		var file = upload[0].files[0];
		
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
				var str ="";

				if (checkImageType(data)) {
					str ="<div>"
						+ "<img src='/project/library/"+projectListNo+"/displayFile?fileName="+data+"'/>"
						+ "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>" 
						+"</div>";
				} else {
					str ="<div>"
						+ "<img src='/resources/images/file.png'/>"
						+ getOriginalName(data) 
						+ "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>"
						+"</div>";
				}
				
				$('#uuidName').val(data);
				$('#displayName').val("/project/library/"+projectListNo+"/displayFile?fileName="+data);
				$(".uploadedList").html(str);
			}
		});
	});
	
	/** 첨부 파일 삭제 처리 */
	$(".uploadedList").on("click", "small", function(event) {		// small 태그로 처리된 'X' 클릭 이벤트
		var that = $(this);
		
		$.ajax({
			url:"/project/deleteFile",
			type: 'POST',
			data : {fileName: $(this).attr("data-src")},
			dataType: 'text',
			success : function(result) {
				if (result == 'deleted') {
					that.parent("div").remove();
					$('.fileSelect').val("");
				}
			}
		});
	});
	
	/** 취소 버튼 클릭 시 삭제 처리 */
	$("#cancelBtn").on("click", function(event) {	
		var that = $(".delbtn");
		
		$.ajax({
			url:"/project/deleteFile",
			type: 'POST',
			data : {fileName: that.attr("data-src")},
			dataType: 'text',
			success : function(result) {
				if (result == 'deleted') {
					that.parent("div").remove();
					$('.fileSelect').val("");
				}
			}
		});
	});
	
	$("#uploadForm").submit(function(event) {
		event.preventDefault();
		
		var that = $(this);
		
		if($("#title").val().trim().length <1){
			swal({
	            title: '제목을 입력해 주세요!',
	            text: '',
	            type: 'warning',
	            confirmButtonText: '닫기'
	          })
	          return false;	
		} 
		
		if(that["0"].file.value == "") {
			swal({
	            title: '파일을 선택해 주세요!',
	            text: '',
	            type: 'warning',
	            confirmButtonText: '닫기'
			})
			return false;	
		}
		
		var str = "";
		
		$(".uploadedList0 .delbtn").each(function(index) {
			str += "<input type='hidden' name='files["+ index +"]' value='" + $(this).attr("href") +"'> ";
		});
		that.append(str);
		
		that.get(0).submit();
	});
	
	/** 파일의 확장자가 존재하는지 검사 */
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;	// i는 대소문자 구분 없음을 의미
		
		return fileName.match(pattern);
	}
	
	/** uuid로 인해 길어진 파일 이름 줄여주는 기능*/
	function getOriginalName (fileName) {
		if (checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_")+1;	// 원본 파일 이름만 추출
		
		return fileName.substr(idx);
	}
	
	/** 이미지 파일의 원본 파일 찾기 */
	function getImageLink(fileName) {
		if (!checkImageType(fileName)) {
			return;
		}
		
		var front = fileName.substr(0, 5);	// /asc 경로 추출
		var end = fileName.substr(7); 	// s_ 제거
		
		return front + end;
	}
});


</script>