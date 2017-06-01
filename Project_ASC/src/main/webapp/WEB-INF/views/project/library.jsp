<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

<style>
.panel {
	margin-top: 10% !important
}

.popup {position: absolute;}
.back {background-color: gray; opacity: 0.5; width: 100%; height: 300%;  overflow: hidden;z-index: 1101;}
.front {z-index: 1110; opacity: 1; border: 1px; margin: auto;}
.show {position: relative; max-width: 1200px; max-height: 800px; overflow: auto;}
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
	
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<!-- 업로드시 입력한 제목 보여주기 -->
						${libraryList.title } <a class="btn btn-default btn-sm" style="float: right; padding: 2px 9px;"> <i class="fa fa-trash-o fa-sm"></i>
						</a>
					</div>

					<div class="panel-body">
						<!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
						<p>
							
							
							<a href="#" class=""> <img src="C:/Users/YI JONG YOON/git/asc/Project_ASC/src/main/webapp/resources/images/upload${libraryList.uuidName}" width="20%" ></a>${libraryList.fileName }
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