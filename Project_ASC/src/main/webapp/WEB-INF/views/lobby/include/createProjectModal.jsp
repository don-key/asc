<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.ui-front {
    z-index: 9999;
}
</style>
<!-- Modal -->
<div class="modal fade" id="createProjectModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <form action="/lobby/selectProject" id="createForm" method="post" enctype="multipart/form-data">
         <div class="modal-content">
            <div class="modal-header" style="background: #354555; color: #ffffff;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title" style="font-weight: bolder;">새 프로젝트 만들기</h4>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label for="projectName" style="font-size: 20px; margin-left: 1%;">프로젝트 이름</label>
                  </div>
                  <div class="col-xs-7">
                     <input name="projectName" style="height: 37px; width:68%" placeholder="프로젝트 이름">
                  </div>
               </div>
               <br>

               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">프로젝트 시작</label>
                  </div>
                  <div class="col-xs-5" style="height: 37px;">
                     <div class="input-group date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="8" type="text" name="startDate" value="" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                     </div>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">프로젝트 종료</label>
                  </div>
                  <div class="col-xs-5" style="height: 37px;">
                     <div class="input-group date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="8" type="text" name="endDate" value="" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                     </div>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">참여인원</label>
                  </div>
                  <div class="col-xs-8">
                       <input type="text" name="member" id="memberList" value="" style="height: 35px; width: 80%" placeholder="이메일을 검색해주세요.">
                  </div>
               </div>
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1"></div>
                  <div class="col-xs-8">
                  <div id="invitation">
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
                     <input type="file" class="form-control" name="fileUpload" style="height: 37px; width: 100%">
                  </div>
               </div>
               <br>

               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1">
                     <label style="font-size: 20px;">설명</label>
                  </div>
                  <div class="col-xs-7">
                     <textarea name="content" style="width: 100%; height: 100px;" placeholder="내용을 입력해주세요"></textarea>
                  </div>
               </div>



               <div class="modal-footer">
                  <div class="row">
                     <div class="col-xs-2 col-xs-offset-4">
                        <button type="submit"  class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">생성</button>
                     </div>
                     <div class="col-xs-2">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
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
	$('.form_date').datetimepicker({
		language : 'ko',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
	
	$('#memberList').autocomplete({
		 source : function( request, response ) {
	       $.ajax({
	              type: 'post',
	              url: "/lobby/memberList",
	              dataType: "json",
	              data: { id : request.term },
	              success: function(data) {
	               response(
	                      $.map(data, function(item) {
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
		  var invitationList = $('#invitation').find("input[name=invitationList]");
		  var check = true;
		  for(var i=0;i<invitationList.length;i++){
			  if(invitationList.get(i).value == ui.item.value){
				  check=false;
			  }
	      }
		  if(check){
		 	 $('#invitation').append("<div class='col-xs-12'><input type='text' name='invitationList' style='border:none;' value="+ui.item.value+" readonly><i class='glyphicon glyphicon-remove'></i></div>");
	     	 $(this).val('');
		  }else{
			  swal({
	                 title : '이미 참여 중인 팀원입니다',
	                 type : 'warning',
	                 confirmButtonText : '닫기'
	              })
		  }
		  return false;
	  }
	});
	
	$('#invitation').on('click', function() {
		$('.glyphicon-remove').on('click', function() {
			$(this).parent().remove();
		});
	});
	
	$('#createForm').submit(function(form) {
		  var now = new Date();
	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	      var current_date = year + '-' + mon + '-' + day;
	      console.log(current_date);

		var createForm = $(form)[0].target;
		
		if(createForm.projectName.value.trim().length == 0){
			swal({
                title : '프로젝트 이름을 입력해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		
		if(createForm.startDate.value.trim().length == 0){
			swal({
                title : '프로젝트 시작 날짜를 입력해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		if(createForm.endDate.value.trim().length == 0){
			swal({
                title : '프로젝트 종료 날짜를 입력해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		
		if(current_date > createForm.startDate.value){
			swal({
                title : '프로젝트 기간을 확인해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		
		if(createForm.startDate.value > createForm.endDate.value){
			swal({
                title : '프로젝트 기간을 확인해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		
		if(createForm.startDate.value == createForm.endDate.value){
			swal({
                title : '프로젝트 기간을 확인해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
			return false;
		}
		return true;
	});
});
	
</script>
