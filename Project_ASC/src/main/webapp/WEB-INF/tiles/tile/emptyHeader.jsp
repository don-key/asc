<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 

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
		                    <div class="profile">
                                  <img src="/resources/images/upload${m:urlDecode(cookie.photoCookie.value)}">
                            </div>
                    	</div>
                      	<div class="col-xs-10 col-sm-10">
  		                    <div style="color: white; font-size: 30px; text-align: center; margin-top: 10px">${m:urlDecode(cookie.CookieForUser.value)}</div>
		                </div>
                    </div>
                    
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
            

  
  <script>

  /** 회원수정 모달 띄우기*/
  $(function() {
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