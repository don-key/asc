<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <br> <img alt="" src="/resources/images/header/log.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
      </div>
   </div>
      <div class="col-xs-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <i class="fa fa-bell fa-fw"></i> History
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
               <div class="list-group">
               <c:choose>
            <c:when test="${empty front }">
               <div style="margin-top: 10%">
                  <p style="text-align: center; font-size: 20px"> <mark>로그 내역이 존재하지 않습니당</mark></p>
               </div>
            </c:when>
            
            <c:otherwise>
            <c:forEach items="${front }" var="front" varStatus="status">
                <a href="#" class="list-group-item"> 
                  <i class="fa fa-comment fa-fw"></i> ${front}
                  <span class="pull-right text-muted small"><em>${end[status.index]}</em> </span>
                </a>
            </c:forEach>
         </c:otherwise>

         </c:choose>
                 
               </div>
               <!-- /.list-group -->
               <a href="#" class="btn btn-default btn-block" id="sendMail">팀원에게 알리기</a>
            </div>
            <!-- /.panel-body -->
         </div>
      </div>
</div>

<script> 
$(function() {
	var id = '${login.id}';
	var userNo = ${login.userNo};
	var projectListNo = location.pathname.split('/')[3];
	$('#sendMail').on('click', function() {
		event.preventDefault();
		location.href = "/project/sendMail/"+projectListNo+"/"+id+"/"+userNo;
	});
	
	if('${msg}' == 'SUCCESS'){
	  swal({
           title : '메일 전송이 완료되었습니다.',
           type : 'success',
           confirmButtonText : '닫기'
        });
	}
});
</script>