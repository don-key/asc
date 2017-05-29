<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="registUserStoryModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;">User Story 등록</h4>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-xs-5 col-xs-offset-1">
            <label for="categoryList" style="font-size: 27px;"> Release Category </label>
          </div>
          <div class="col-xs-6">
            <select id="categoryList" name='categoryList' autofocus style="width: 83%; height: 37px; margin-top: 4px;">
              <option value=''>#001. 디드</option>
              <option value=''>#002. 디드2</option>
              <option value=''>#003. 디드3</option>
            </select>
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='Title' style="font-size: 20px;">Title</label>
          </div>
          <div class="col-xs-8">
            <input type="text" id='Title' name="Title" style="width: 100%;" placeholder="내용을 입력해주세요.">
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='AsA' style="font-size: 20px;">As a</label> <label style="font-size: 15px;">(사용자)</label>
          </div>
          <div class="col-xs-8">
            <input type="text" id="AsA" name="AsA" style="width: 100%;" placeholder="내용을 입력해주세요.">
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='IWant' style="font-size: 20px;">I want</label> <label style="font-size: 15px;">(기능)</label>
          </div>
          <div class="col-xs-8">
            <textarea id="IWant" name="IWant" style="resize:none; width: 100%; height: 115px;" placeholder="내용을 입력해주세요."></textarea>
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='SoThat' style="font-size: 20px;">So that</label> <label style="font-size: 15px;">(목적)</label>
          </div>
          <div class="col-xs-8">
            <textarea id="SoThat" name="SoThat" style="resize:none; width: 100%; height: 115px;" placeholder="내용을 입력해주세요."></textarea>
          </div>
        </div>
        <br>

        <div class="row">
          <div class="col-xs-2 col-xs-offset-1">
            <label for='Priority' style="font-size: 20px;">우선순위</label>
          </div>
          <div class="col-xs-3">
            <select id="Priority" name='Priority' style="width: 100%;">
              <option value='상'>상</option>
              <option value='중'>중</option>
              <option value='하'>하</option>
            </select>
          </div>
        </div>

        <div class="modal-footer">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-4">
              <button type="button" class="btn btn-success" style="width: 100%; font-size: 15px; font-weight: bold;">생성</button>
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