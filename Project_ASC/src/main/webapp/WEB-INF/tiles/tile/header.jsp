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
                          <div class="profile"><img src='/resources/images/upload/${login.photo }'></div>
                            <input type="hidden"  id="mUuidName"  name="uuidName">
                            <input type="hidden"  id="mDisplayName"  name="displayName">
                       </div>
                       <div class="col-xs-10 col-sm-10">
                          <div style="color: white; font-size: 30px; text-align: center; margin-top: 10px">${login.name}</div>
                      </div>
                    </div>
                        <form action="/user/logout" id="logout">
                    <ul class="nav" id="side-menu" style="margin-top: 15px">
                        <li id="dashBoard"> 
                            <a href="#"><img src="/resources/images/menu/dashboard.png" style="width: 50%"></a>
                        </li>
                        <li id="ganttChart">
                            <a href="#"><img src="/resources/images/menu/gantt.png" style="width: 50%"></a>
                        </li>
                        <li id="scrum">
                            <a href="#"><img src="/resources/images/menu/scrum.png" style="width: 50%"><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li id="taskBoard">
                                    <a href="#"><img src="/resources/images/menu/task.png" style="width: 60%"></a>
                                </li>
                                <li id="releasePlanning">
                                      <a href="#"><img src="/resources/images/menu/release.png" style="width: 70%"></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li id="library">
                            <a href="#"><img src="/resources/images/menu/library.png" style="width: 50%"></a>
                        </li>
                         <li id="member">
                            <a href="#"><img src="/resources/images/menu/member.png" style="width: 50%"></a>
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

/** 메뉴 링크 */
$(function() {
	var userNo = ${login.userNo};
	console.log(location.pathname);
	console.log(location.pathname.split('/')[3]);
	var projectListNo = location.pathname.split('/')[3];
	$('#dashBoard').on('click', function() {
		location.href="/project/dashBoard/"+projectListNo+"/"+userNo;
	});
	$('#ganttChart').on('click', function() {
		location.href="/gantt/ganttChart/"+projectListNo+"/"+userNo;
	});
	
	$('#library').on('click', function() {
		location.href="/project/library/"+projectListNo+"/"+userNo;
	});
	
	$('#member').on('click', function() {
		location.href="/project/member/"+projectListNo;
	});
	
	$('#taskBoard').on('click', function() {
		   var projectListNo = 1;
		   
		   
		   $.ajax({
	           type : 'post',
	           url : "/project/getSprintNo",
	           data:
	           {
	        	   scrumNo: projectListNo
	           },
	           success:function(request){
	              console.log(request.value);
	        	   location.href="http://localhost:4567/taskBoard/"+projectListNo+"/"+request+"/"+userNo;
	           }
	           
	       });
	   });
	   
   $('#releasePlanning').on('click', function() {
       location.href="http://localhost:4567/releasePlanning/"+projectListNo+"/"+userNo;
    });
});
</script>
  
  
    <!-- Modal -->
  <jsp:include page="modifyModal.jsp" />