<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="modifyProjectModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;">새 프로젝트 만들기</h4>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label for="newProjectName" style="font-size: 20px; margin-left:1%;">프로젝트 이름</label>
          </div>
          <div class="col-xs-7">
            <input id="newProjectName" style="height: 37px;" placeholder="프로젝트 이름">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">총 기간</label>
          </div>
            <div class="col-xs-2"><input type="date"></div>
             <label class="col-xs-1"></label>
             <div class="col-xs-2"><input type="date"></div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">참여인원</label>
          </div>
          <div class="col-xs-3">
            <input type="text" name="member" style="height: 35px;" placeholder="내용을 입력해주세요.">
          </div>
          <div class="col-xs-3">
            <button class="btn btn-self btn-md" style="margin-left:15%; background-color: rgba(40, 61, 71, 0.42)" name="memberSearch" style="height: 37px;">검색</button>
          </div>
        </div>
        
        
         <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;"></label>
          </div>
          <div class="col-xs-2">
             <label id="selectedMember" style="height: 26px; margin-top:10%;" for="member">이현명</label>
          </div>
          <div class="col-xs-2">
            <button class="btn btn-self btn-md" style="margin-left:15%; background-color: #f5f5f5" name="memberSearch" style="height: 37px;">X</button>
          </div>
        </div>

         <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;"></label>
          </div>
          <div class="col-xs-2">
             <label id="selectedMember" style="height: 26px; margin-top:10%;" for="member">이현명</label>
          </div>
          <div class="col-xs-2">
            <button class="btn btn-self btn-md" style="margin-left:15%; background-color: #f5f5f5" name="memberSearch" style="height: 37px;">X</button>
          </div>
        </div>        
        
        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">팀명</label>
          </div>
          <div class="col-xs-6">
            <input name="userStoryIWant" style="height: 37px;" placeholder="내용을 입력해주세요.">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">대표이미지</label>
          </div>
          <div class="col-xs-6">
            <input type="file" class="form-control" name="projectImage" style="height: 37px; width:100%">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">설명</label>
          </div>
          <div class="col-xs-7">
            <textarea id="" style="width:100%; height: 100px;" placeholder="내용을 입력해주세요"></textarea>
          </div>
        </div>

        <div class="modal-footer">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-4">
              <button type="button" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">생성</button>
            </div>
            <div class="col-xs-2">
              <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>


</div>