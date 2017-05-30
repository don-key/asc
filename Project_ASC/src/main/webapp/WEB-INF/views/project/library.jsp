<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

      <style>
      .panel{
      
        margin-top:10% !important
      }
      </style>

          <div id="page-wrapper"> 
			   <div class="row">
			      <div class="col-lg-12">
			      <br>
			         <img alt="" src="/resources/images/header/library.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
			      </div>
			   </div>
          
            <div class="row">
            
              <div class="">
               <a id="" class="btn btn-default btn-lg" style="margin-left: 85%;" data-toggle="modal" data-target="#fileUploadModal">
               <i class="fa fa-upload fa-lg"></i>　파일 업로드</a>
              </div>
               <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                            <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                              <i class="fa fa-trash-o fa-sm"></i>
                            </a> 
                        </div>
                        
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>
                       </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
                
               <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                            <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                              <i class="fa fa-trash-o fa-md" ></i>
                            </a> 
                        </div>
                        
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>
                       </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
                
               <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                            <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                              <i class="fa fa-trash-o fa-md" ></i>
                            </a> 
                        </div>
                        
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>
                       </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
                
                
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                              <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                              <i class="fa fa-trash-o fa-md"></i>
                            </a> 
                        </div>
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>                        
                        </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                            <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                             <i class="fa fa-trash-o fa-md"></i>
                            </a>                             
                        </div>
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>  
                        </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
                 <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                        <!-- 업로드시 입력한 제목 보여주기 -->
                            글 제목
                            <a class="btn btn-default btn-sm" style="margin-left: 75% !important">
                              <i class="fa fa-trash-o fa-md"></i>
                            </a> 
                        </div>
                        <div class="panel-body">
                            <!-- 썸네일 사진 보여지는 자리, 클릭하면 사진 미리보기-->
                            <p><a href="#" class=""> <img src="/resources/images/noimage.png " width=70px; height=50px; alt=""></a>우리나라 좋은나라.jpg</p>  
                        </div>
                        <div class="panel-footer">
                            작성자 : 이현명
                        </div>
                    </div>
                </div>
             
                
            </div>
            <!-- /.row -->
          </div>
         
      <!-- Modal -->
    <jsp:include page="include/fileUploadModal.jsp" />