<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<style>
#modifyIcon {
	color: green;
	margin: 3%;
	display: inline-block;
}

#deleteIcon {
	color: red;
	margin: 3%;
	display: inline-block;
}

#newProject {
	color: black;
	background-color: white;
}
</style>
<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <div class="page-header" style="font-size: 30px; font-weight: bold;">Project${user}</div>
      </div>
   </div>

   <div class="row">
      <div class=" col-xs-2 col-xs-offset-10">
         <div class="panel-nothing" style="width: 140px;">
            <div class="panel-heading">
               <div class="row">
                  <div class="text-center" style="font-size: 20%;">
                     <a id="newProject" class="btn btn-default btn-lg" data-toggle="modal" data-target="#createProjectModal"> 새 프로젝트 <i class="fa fa-plus-circle"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="row">
   <c:choose>
      <c:when test="${empty list }">
               <div style="margin-top: 10%">
                  <p style="text-align: center; font-size: 20px"> <mark>프로젝트를 생성해주세여</mark></p>
               </div>
      </c:when>
      <c:otherwise>
         <c:forEach items="${list}" var="projectList" varStatus="status">
            <div class="col-lg-3 col-md-3 col-xs-4">
            <a href="/project/dashBoard?projectListNo=${projectList.projectListNo }" class="thumbnail"> <img src="/resources/images/upload${projectList.projectPhoto}" alt="">
               </a>
               <div class="panel">
                  <div style="font-size: 17px; font-weight: bold;"></div>
                  <div class="text-right">${projectList.startDate}~${projectList.endDate}</div>
                  <br>
                  <div class="text-right" style="font-size: 15px;">
                     ${projectList.projectName}&nbsp; <i class="fa fa-child"></i>${count[status.index]}
                  </div>
                  <br>
                  <div class="text-center" style="font-size: 15px;">
                    ${projectList.content}
                  </div>
                  <br>
                  <div class="text-right">
                     <a href="#" id="modifyIcon" class="fa fa-pencil" data-toggle="modal" data-target="#modifyProjectModal">수정</a> <a href="#" id="deleteIcon" class="fa fa-trash-o">삭제</a>
                  </div>
               </div>
            </div>
         </c:forEach>
      </c:otherwise>
   </c:choose>
   
      
   </div>
</div>
<!-- /#page-wrapper -->
<!-- Modal -->
<jsp:include page="include/createProjectModal.jsp" />
<jsp:include page="include/modifyProjectModal.jsp" />

