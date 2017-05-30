<%@ page contentType="text/html; charset=utf-8" %>

<style>
.profile {width:70px; height:70px; border-radius:70px; overflow:hidden; margin-left: 70%; float: left;}
.profile img {height:70px; width:70px;}
</style>

 <!-- Navigation -->
            <nav class="navbar-default sidebar" role="navigation" style="background-color: #354555">
                <div class="sidebar-nav navbar-collapse">
                    <a href="/"><img src="/resources/images/logo.png" style="width:250px"></a>
                    
                    <div class="row">
                    	<div class="col-xs-2 col-sm-2">
		                    <div><a data-toggle="modal" data-target="#modifyModal" class="profile"><img src="../resources/images/noimage2.png"></a></div>
                    	</div>
                    	<div class="col-xs-10 col-sm-10">
		                    <p style="color: white; font-size: 30px; text-align: center; margin-top: 10px">이종윤</p>
		                </div>
                    </div>
                    <ul class="nav" id="side-menu" style="margin-top: 15px">
                        <li>
                            <a href="/project/dashBoard"><img src="/resources/images/menu/dashboard.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/scrum/taskBoard"><img src="/resources/images/menu/scrum.png" style="width: 50%"><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/scrum/taskBoard"><img src="/resources/images/menu/task.png" style="width: 60%"></a>
                                </li>
                                <li>
                                   	<a href="/scrum/releasePlanning"><img src="/resources/images/menu/release.png" style="width: 70%"></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/gantt/ganttChart"><img src="/resources/images/menu/gantt.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/project/library"><img src="/resources/images/menu/library.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="/project/member"><img src="/resources/images/menu/member.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="#"><img src="/resources/images/menu/log.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a><img src="/resources/images/menu/logout.png"  class="logoutBtn"  style="width: 50%; cursor: pointer;"></a>
                        </li>
                    </ul>
                    
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
            

  
    <script>
  $('.logoutBtn').on('click', function() {
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
			location.href = '/';
		})
	  
  });
  </script>
  
  
    <!-- Modal -->
  <jsp:include page="modifyModal.jsp" />