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
      <form action="/lobby/selectProject" method="post" enctype="multipart/form-data">
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
                     <input name="projectName" style="height: 37px;" placeholder="프로젝트 이름">
                  </div>
               </div>
               <br>

               <div class="row">
                  <div class="col-xs-2 col-xs-offset-1">
                     <label style="font-size: 20px;">총 기간</label>
                  </div>
                  <div class="col-xs-4" style="padding-left: 0px">
                     <div class="input-group date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="8" type="text" name="startDate" value="" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                     </div>
                  </div>
                  <div class="col-xs-1" style="margin: 0; padding-top: 8px">~</div>
                  <div class="col-xs-4" style="padding-left: 0px">
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
                       <input type="text" name="member" id="memberList" value="" style="height: 35px; width: 80%" placeholder="회원을 검색해주세요.">
                  </div>
               </div>
               
               <div class="row">
                  <div class="col-xs-3 col-xs-offset-1"></div>
                  <div class="col-xs-8">
                  <div id="invitation">
                     <input type="hidden" name="invitationList" value="rlaehdzlsla@gmail.com">
                  </div>
                  </div>
               </div>
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
                        <button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">생성</button>
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
	$('.form_datetime').datetimepicker({
		//language:  'fr',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1
	});
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
	$('.form_time').datetimepicker({
		language : 'ko',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 1,
		minView : 0,
		maxView : 1,
		forceParse : 0
	});
	
	$('#memberList').autocomplete({
		 source : function( request, response ) {
			 console.log(request.term);
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
		  $('#invitation').append("<div class='col-xs-12'><input type='text' name='invitationList' style='border:none;' value="+ui.item.value+" readonly></div>");
		  $(this).val('');
		  return false;
	  }
	});

});
	
</script>
