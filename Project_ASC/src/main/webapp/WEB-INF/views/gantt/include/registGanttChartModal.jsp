<%@ page contentType="text/html; charset=utf-8"%>



<!-- Modal -->
<div class="modal fade" id="registGanttChartModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">

      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;">간트차트 기능 추가</h4>
      </div>

      <div class="modal-body">
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for="ganttTitle" style="font-size: 20px;">제목</label>
          </div>
          <div class="col-xs-8">
            <input type="text" id="ganttTitle" style="width: 100%;">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for="ganttWorker" style="font-size: 20px;">담당자</label>
          </div>
          <div class="col-xs-8">
            <select id="ganttWorker" style="width: 100%;">
              <option>공통</option>
              <option>김동현</option>
              <option>마민</option>
              <option>이지수</option>
            </select>
          </div>
        </div>

        <br>
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label style="font-size: 20px;">기간</label>
          </div>
          <div class="col-xs-3">
            <input type="date">
          </div>
          <div class="col-xs-1" style="margin-left: 25px">~</div>
          <div class="col-xs-4">
            <input type="date">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label style="font-size: 20px;">색상</label>
          </div>
          <div class="col-xs-8">
              <!-- 색상 선택기 -->
              <div class="col-xs-7">
              <span id="colorpicker"></span>
              </div>
              <div class="col-xs-2">
              <input type="text" id="color" name="color" value="" style="width: 100px;">
              </div>
          </div>
        </div>
        <br>

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

<script>

// UI 구성.
$('#colorpicker').farbtastic(function(data) {
  color = data;
  $('#color').val(color);
  $('#color').css("background-color",color);
  
	});
</script>
