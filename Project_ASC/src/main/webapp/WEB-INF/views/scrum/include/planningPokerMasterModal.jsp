<%@ page contentType="text/html; charset=UTF-8"%>

<!-- Modal -->
<div id="planningPokerMasterModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;">Planning Poker</h4>
      </div>
      <div class="modal-body">
      <br>
        <div class="row">
          <div class="text-center">
            <textarea name="userStoryContent" disabled style="resize:none; width: 76%; height: 115px;">
          UserStory Title, Content
          </textarea>
          </div>
        </div>
        <br>

        <div class="row text-center">
          <div class="col-xs-2 col-xs-offset-1">
            <a class="btn" style="width: 53%; font-size: 20px; border-radius: 25px; background-color: #F39C12; font-weight: bold;">0.5</a> 1
          </div>
          <div class="col-xs-2">
            <a class="btn" style="width: 45%; font-size: 20px; border-radius: 25px; background-color: #F39C12; font-weight: bold;">1</a> 1
          </div>
          <div class="col-xs-2">  
            <a class="btn" style="width: 45%; font-size: 20px; border-radius: 25px; background-color: #F39C12; font-weight: bold;">2</a> 1
          </div>
          <div class="col-xs-2">
            <a class="btn" style="width: 45%; font-size: 20px; border-radius: 25px; background-color: #F39C12; font-weight: bold;">5</a> 1
          </div>
          <div class="col-xs-2">
            <a class="btn" style="width: 48%; font-size: 20px; border-radius: 25px; background-color: #F39C12; font-weight: bold;">10</a> 2
          </div>
        </div>
        
        <br>
        
        <div class="row">
          <div class="col-xs-3 col-xs-offset-1">
            <label style="font-size: 20px;">참여도 6/6</label>
          </div>
          <div class="col-xs-1 col-xs-offset-1">
            <label style="font-size: 20px;">평균</label>
          </div>
          <div class="col-xs-2">
            <input type="text" disabled readonly value='3' style="text-align:center; width: 100%; font-size: 20px; margin-left: 25px;">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="col-xs-2 col-xs-offset-4">
          <button type="button" class="btn btn-primary" style="width: 100%; font-size: 15px; font-weight: bold;">Submit</button>
        </div>
        <div class="col-xs-2">
          <button type="button" data-dismiss="modal" class="btn btn-default" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">Cancel</button>
        </div>
      </div>
    </div>

  </div>
</div>