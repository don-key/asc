<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.ui-front {
    z-index: 9999;
}
</style>
<!-- Modal -->
<div class="modal fade" id="modifyProjectModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <form action="/lobby/updateProject" method="post" enctype="multipart/form-data">
         <input type="hidden" id="listNo" name="listNo">
         <div class="modal-content">
            <div class="modal-header" style="background: #354555; color: #ffffff;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title" style="font-weight: bolder;">프로젝트 수정</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label for="projectName" style="font-size: 20px; margin-left: 1%;">프로젝트 이름</label>
                  </div>
                  <div class="col-xs-7">
                     <input name="projectName" id="projectName" style="height: 37px; width:68%" placeholder="프로젝트 이름">
                  </div>
               </div>
               <br>

               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">프로젝트 시작</label>
                  </div>
                  <div class="col-xs-5" style="height: 37px;">
                     <div class="input-group" style="width:100%;">
                        <input class="form-control" size="8" type="text" id="startDate" name="startDate" value="" readonly>
                     </div>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">프로젝트 종료</label>
                  </div>
                  <div class="col-xs-5" style="height: 37px;">
                     <div class="input-group" style="width:100%;">
                        <input class="form-control" size="8" type="text" id="endDate" name="endDate" value="" readonly>
                     </div>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">참여인원</label>
                  </div>
                  <div class="col-xs-8">
                       <input type="text" name="member" id="modifyMemberList"  value="" style="height: 35px; width: 80%" placeholder="이메일을 검색해주세요.">
                  </div>
               </div>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1"></div>
                  <div class="col-xs-8">
                  <div id="modifyInvitation">
                     <input type="hidden" name="invitationList" value="${login.id}">
                  </div>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">대표이미지</label>
                  </div>
                  <div class="col-xs-6">
                     <input type="file" class="form-control" id="fileUpload" name="fileUpload" style="height: 37px; width: 100%">
                  </div>
               </div>
               <br>

               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">설명</label>
                  </div>
                  <div class="col-xs-7">
                     <textarea name="content" id="projectContent" style="width: 100%; height: 100px;" ></textarea>
                  </div>
               </div>



               <div class="modal-footer">
                  <div class="row">
                     <div class="col-xs-2 col-xs-offset-4">
                        <button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
                     </div>
                     <div class="col-xs-2">
                        <button type="button" class="btn btn-default" id="modifyClose" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </form>
   </div>
</div>

<script>

$(function() {
	$('#modifyMemberList').autocomplete({
		 source : function( request, response ) {
	       $.ajax({
	              type: 'post',
	              url: "/lobby/memberList",
	              dataType: "json",
	              data: { id : request.term },
	              success: function(data) {
	               response(
	                      $.map(data, function(item) {
	                              console.log(item);
	                          return {
	                              value: item
	                          }
	                      })
	                  );  
	              }
	         });
	      },
	  //조회를 위한 최소글자수
	  minLength: 1,
	  select: function( event, ui) {
		  $('#modifyInvitation').append("<div class='col-xs-12'><input type='text' name='invitationList' style='border:none;' value="+ui.item.value+" readonly><i class='glyphicon glyphicon-remove'></i></div>");
		  $(this).val('');
		  return false;
	  }
	});
	
	$('#modifyInvitation').on('click', function() {
		$('.glyphicon-remove').on('click', function() {
			$(this).parent().remove();
		});
	});

});

$(function() { 
	$('.modifyIcon').on('click', function() {
		var projectListNo = $(this).prev().val();
		$('#listNo').val(projectListNo);
		$.ajax({
            type : 'post',
            url : "/lobby/modifyProject",
            data:
            {
            	projectListNo: projectListNo
            },
            success:function(request){
               console.log(request);
               $('#projectName').val(request.projectList.projectName);
               $('#startDate').val(request.projectList.startDate);
               $('#endDate').val(request.projectList.endDate);
               $('#projectContent').text(request.projectList.content);
               $('#modifyMemberList').val("");
               
               for(var i=0;i<request.invitationList.length;i++){
            	   $('#modifyInvitation').append("<div class='col-xs-12'><input type='text' name='invitationList' style='border:none;' value="+request.invitationList[i]+" readonly><i class='glyphicon glyphicon-remove'></i></div>");
               }
               
		       $('#modifyProjectModal').modal();
            }
            
        });
		
		
	});
	
	$('#modifyClose').on('click', function() {
		$('#modifyInvitation').html("");
	});
});
</script>
