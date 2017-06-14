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
               <i class="fa fa-bell fa-fw"></i> 수정한거 보내려면 버튼 누르든지
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
               <div class="list-group">
               <c:choose>
            <c:when test="${empty list }">
               <div style="margin-top: 10%">
                  <p style="text-align: center; font-size: 20px"> <mark>로그 내역이 존재하지 않습니당</mark></p>
               </div>
            </c:when>
            
            <c:otherwise>
            <c:forEach items="${list }" var="logList" varStatus="status">
                <a href="#" class="list-group-item"> 
                  <i class="fa fa-comment fa-fw"></i> ${logList.content} 
                </a>
            </c:forEach>
         </c:otherwise>

         </c:choose>
                 
               </div>
               <!-- /.list-group -->
               <a href="#" class="btn btn-default btn-block">팀원에게 알리기</a>
            </div>
            <!-- /.panel-body -->
         </div>
      </div>
</div>