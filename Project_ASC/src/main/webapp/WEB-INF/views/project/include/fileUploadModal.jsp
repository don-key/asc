<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Modal -->
  <div class="modal fade" id="fileUploadModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style=" background: #354555; color: #ffffff;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" style="font-weight : bolder;"> 파일 업로드 <i class="fa fa-camera fa-md"></i></h4>
        </div>
        
        <div class="modal-body">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
             <label for="fileUpload" style="font-size : 20px;"> 제목 </label>
            </div>
              <div class="col-xs-8">
                <input type="text" id ="" style="width : 100%;">
              </div>
          </div>
          <br>
          
        <div class="row">
        <div class="col-xs-2 col-xs-offset-1">
        <label style="font-size : 15px;">파일선택</label>
        </div>
        <div class="col-xs-8">
        <input type="file" class="form-control" name="attachFile" style="width: 100%">
        </div>
        </div>
        <br>
        
        
        <div class="modal-footer">
        <div class="row">
        <div class="col-xs-2 col-xs-offset-4">
        <button type="button" class="btn btn-warning" style="width : 100%; font-size : 15px; font-weight : bold;">등록</button>
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