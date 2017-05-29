<%@ page contentType="text/html; charset=UTF-8"%>

<!-- Modal -->
<div id="planningPokerModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;"> Planning Poker </h4>
      </div>
      <div class="modal-body">
      
      <div class="row">
          <div class="col-xs-8 col-xs-offset-2">
          <textarea name="userStoryContent" disabled style="resize:none; width: 100%; height: 115px;">
          UserStory Title, Content
          </textarea>
          </div>
        </div>
      
        <div class="row">
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn" style="width : 100%; font-size: 20px; border-radius: 25px; background-color : #F39C12; font-weight : bold;">0.5</a>
          </div>
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn" style="width : 100%; font-size: 20px; border-radius: 25px; background-color : #F39C12; font-weight : bold;">1</a>
          </div>
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn" style="width : 100%; font-size: 20px; border-radius: 25px; background-color : #F39C12; font-weight : bold;">2</a>
          </div>
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn" style="width : 100%; font-size: 20px; border-radius: 25px; background-color : #F39C12; font-weight : bold;">5</a>
          </div>
          <div class="col-xs-1 col-xs-offset-1">
            <a class="btn" style="width : 100%; font-size: 20px; border-radius: 25px; background-color : #F39C12; font-weight : bold;">10</a>
          </div>
          <div class="col-xs-1">
            <input type="text" pattern="[0.5-9]" maxlength=1 style="text-align:center; width : 100%; font-size: 20px; margin-left: 25px;">
          </div>
        </div>
              
        <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
        <h5 style="font-weight: bold; text-align : center; font-size : 15px;"> 보기에 원하는 시간이 없을 시에는, 오른쪽 입력창에 입력바랍니다 :) </h5>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="col-xs-2 col-xs-offset-4">
              <button type="button" class="btn btn-primary" style="width: 100%; font-size: 15px; font-weight: bold;">저장</button>
            </div>
            <div class="col-xs-2">
              <button type="button" data-dismiss="modal" class="btn btn-default" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">초기화</button>
            </div>
      </div>
    </div>

  </div>
</div>