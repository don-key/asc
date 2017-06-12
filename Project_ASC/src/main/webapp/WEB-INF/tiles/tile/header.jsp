<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.profile {width:70px; height:70px; border-radius:70px; overflow:hidden; margin-left: 70%; float: left;}
.profile img {height:70px; width:70px;}
</style>

 <!-- Navigation -->
            <nav class="navbar-default sidebar" role="navigation" style="background-color: #354555">
                <div class="sidebar-nav navbar-collapse">
                    <a href="/lobby/selectProject"><img src="/resources/images/logo.png" style="width:250px"></a>
                    
                    <div class="row" id="modalWrapper">
                       <div class="col-xs-2 col-sm-2">
                          <div class="profile"><div class='wen'><img src='/project/displayFile?fileName=${login.photo }'></div></div>
                            <input type="hidden"  id="mUuidName"  name="uuidName">
                            <input type="hidden"  id="mDisplayName"  name="displayName">
                       </div>
                       <div class="col-xs-10 col-sm-10">
                          <div style="color: white; font-size: 30px; text-align: center; margin-top: 10px">${login.name}</div>
                      </div>
                    </div>
                        <form action="/user/logout" id="logout">
                    <ul class="nav" id="side-menu" style="margin-top: 15px">
                        <li>
                            <a href="/project/dashBoard?projectListNo=<%= request.getParameter("projectListNo") %>&userNo=${login.userNo}"><img src="/resources/images/menu/dashboard.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/scrum/taskBoard?projectListNo=<%= request.getParameter("projectListNo") %>&userNo=${login.userNo}"><img src="/resources/images/menu/scrum.png" style="width: 50%"><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="http://192.168.0.62:4567/taskBoard/1/0"><img src="/resources/images/menu/task.png" style="width: 60%"></a>
                                </li>
                                <li>
                                      <a href="http://192.168.0.62:4567/releasePlanning/1"><img src="/resources/images/menu/release.png" style="width: 70%"></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/gantt/ganttChart?projectListNo=<%= request.getParameter("projectListNo") %>&userNo=${login.userNo}"><img src="/resources/images/menu/gantt.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/project/library?projectListNo=<%= request.getParameter("projectListNo") %>&userNo=${login.userNo}"><img src="/resources/images/menu/library.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="/project/member?projectListNo=<%= request.getParameter("projectListNo") %>&userNo=${login.userNo}"><img src="/resources/images/menu/member.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="#"><img src="/resources/images/menu/log.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="#"><img src="/resources/images/menu/logout.png" id="logoutBtn" class="logoutBtn"  style="width: 50%; cursor: pointer;"></a>
                        </li>
                        
                    </ul>
                    </form>
                    
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
            

  
  <script>
//   /** 파일 썸네일 띄우기*/
//   $("#mImgSelect").on("change", function(e) {
//   e.preventDefault();

//   var upload = $('#mImgSelect');
//   console.log(upload);
//   // 전달된 파일 데이터를 가져오는 부분
//   var file = upload[0].files[0];
//   console.log(file);

//   var formData = new FormData();

//   formData.append("file", file);

//   $.ajax({
//     url: '/project/uploadAjax',
//     data : formData,
//     dataType: 'text',
//     processData: false,
//     contentType: false,
//     type: 'POST',
//     success: function(data) {
//        var str ="";

//        if (checkImageType(data)) {
//           str ="<div class='wen'><img src='/project/displayFile?fileName="+data+"'/></div>"
//         } else {
//           str ="<div>"
//              + "<img src='/resources/images/file.png'/>"
//              + getOriginalName(data) 
//              + "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>"
//              +"</div>";
//        }
       
//        $('#mUuidName').val(data);
//        $('#mDisplayName').val("/project/displayFile?fileName="+data);
//        $(".imgPreview").html(str);
//     }
//   });
//   });

//   	/** 파일의 확장자가 존재하는지 검사 */
//   	function checkImageType(fileName) {
//   		var pattern = /jpg|gif|png|jpeg/i;	// i는 대소문자 구분 없음을 의미
  		
//   		return fileName.match(pattern);
//   	}
  	
//   	/** uuid로 인해 길어진 파일 이름 줄여주는 기능*/
//   	function getOriginalName (fileName) {
//   		if (checkImageType(fileName)) {
//   			return;
//   		}
  		
//   		var idx = fileName.indexOf("_")+1;	// 원본 파일 이름만 추출
  		
//   		return fileName.substr(idx);
//   	}
  	
//   	/** 이미지 파일의 원본 파일 찾기 */
//   	function getImageLink(fileName) {
//   		if (!checkImageType(fileName)) {
//   			return;
//   		}
  		
//   		var front = fileName.substr(0, 5);	// /asc 경로 추출
//   		var end = fileName.substr(7); 	// s_ 제거
  		
//   		return front + end;
//   	}
  
  
  
   $('#logoutBtn').on('click', function() {
      swal({
         title: '로그아웃 하시겠습니까?',
         text: "",
        type: 'warning',
         showCancelButton: true,
        confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: 'YES',
         cancelButtonText: 'NO'
      }).then(function () {
         document.getElementById("logout").submit();
         
       })
     
   });

/** 회원수정 모달 띄우기*/
  $(function() {
   $('#modalWrapper').on('click', function() {
      $('#modifyModal').modal();
   });
});

</script>
  
  
    <!-- Modal -->
  <jsp:include page="modifyModal.jsp" />