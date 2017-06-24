<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 
<div id="loding" style="text-align: center;display:none; width:100%; background-color: rgba(255,255,255,1); position: absolute; z-index: 999999">
   <img src="/resources/images/loding.gif" style="margin-top: 15%">
</div>
<script>
   var h = $(window).height();
   $('#loding').height(h);
   if(location.pathname.split('/')[2] == 'selectProject'){
      $('#loding').show();
   }
</script> 
<style>
.profile {width:70px; height:70px; border-radius:70px; overflow:hidden; margin-left: 70%; float: left;}
.profile img {height:70px; width:70px;}
.sidebar .sidebar-nav.navbar-collapse{
  overflow: hidden;
  border: 1px solid #354555;  
}
</style>

 <!-- Navigation -->
            <nav class="navbar-default sidebar"  style="background-color: #354555">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
            </div>
                <div class="sidebar-nav navbar-collapse" id="myNavbar2">
                    <a href="/lobby/selectProject"><img src="/resources/images/logo.png" style="width:250px"></a>
                    
                    <div class="row" id="modalWrapper">
                    	<div class="col-xs-2 col-sm-2">
		                    <div class="profile">
                                  <img src="/resources/images/upload${m:urlDecode(cookie.photoCookie.value)}">
                            </div>
                    	</div>
                      	<div class="col-xs-10 col-sm-10">
  		                    <div style="color: white; font-size: 30px; text-align: center; margin-top: 10px">${m:urlDecode(cookie.CookieForUser.value)}</div>
		                </div>
                    </div>
                    
                
                <form action="/user/logout" id="logout">
                <ul class="nav" id="side-menu" style="margin-top: 15px">
                        <li id="help">
                            <a href="/lobby/help"><img src="/resources/images/menu/help.png" style="width: 50%;"></a>
                        </li>
                        <li id="logoutBtn">
                            <a href="#"><img src="/resources/images/menu/logout.png" class="logoutBtn"  style="width: 60%; cursor: pointer;"></a>
                        </li>
                </ul>
                </form>
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
            

  
  <script>

  /** 회원수정 모달 띄우기*/
  $(function() {
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
   $('#modalWrapper').on('click', function(){
		var userNo =${login.userNo};
		$.ajax({
            type : 'post',
            url : "/user/modifyView",
            data:
            {
            	userNo: userNo
            },
            success:function(request){
               console.log(request);
               $('#modifyId').val(request.id);
               $('#modifyName').val(request.name);
               $('#modifyPhone').val(request.phone);
               $('#modifyPhoto').attr('src', '/resources/images/upload'+request.photo);
               $('#modifyModal').modal();
            }
            
        });
   });
  });
</script>
  
  
    <!-- Modal -->
  <jsp:include page="modifyModal.jsp" />