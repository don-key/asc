<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Modal -->
  <div class="modal fade" id="registTodoModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style=" background: #354555; color: #ffffff;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-weight : bolder;"> To Do 등록 </h4>
        </div>
        <div class="modal-body">
        
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for="userStoryList" style="font-size : 20px;"> User Story </label>
          </div>
          <div class="col-xs-8">
            <select id = "userStoryList" name='userStoryList' autofocus style="width : 100%;">
              <option value=''>#001. User Story</option>
              <option value=''>#002. User Story</option>
              <option value=''>#003. User Story</option>
            </select>
          </div>
        </div>
        <br>
          
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='Title' style="font-size : 20px;">Title</label>
          </div>
          <div class="col-xs-8">
            <input type="text" id="Title" name="Title" style="width : 100%;">
          </div>
        </div>
        <br>
        
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='Content' style="font-size : 20px;">Content</label>
          </div>
          <div class="col-xs-8">
            <textarea id="Content" name="Content" style="resize:none; width : 100%; height : 150px;"></textarea>
          </div>
        </div>
        <br>
        
        <div class="row">
          <div class="col-xs-2 col-xs-offset-6">
            <label for='workerList' style="font-size : 20px;">작업자</label>
          </div>
          <div class="col-xs-3">
            <select id = "workerList" name='workerList' style="width : 100%;">
              <option value=''>김동현</option>
              <option value=''>이종윤</option>
              <option value=''>마민</option>
            </select>
          </div>
        </div>
        
        <div class="modal-footer">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-4">
              <button type="button" class="btn btn-success" style="width : 100%; font-size : 15px; font-weight : bold;">생성</button>
            </div>
            <div class="col-xs-2">
              <button type="button" class="btn btn-default" data-dismiss="modal" style="width : 100%; font-size : 15px; font-weight : bold;background-color: #333;
                color: #ffffff;">취소</button>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  
  
  </div>