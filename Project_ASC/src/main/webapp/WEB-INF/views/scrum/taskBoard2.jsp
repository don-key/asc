<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" %>
<link
  href="${pageContext.servletContext.contextPath}/resources/css/scrum/scrum.css"
  rel="stylesheet">



<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <div class="page-header" id="taskBoardBtn">
        <a class="btn btn-default"> Category </a> <a
          class="btn btn-default active"> Task Board </a> <a
          class="btn btn-default"> Release </a>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  
  <div class="row">

    <div class="col-lg-3 col-md-6">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="huge">User Story</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="panel panel-green">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="huge">To Do</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="panel panel-yellow">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="huge">Doing</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="panel panel-red">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="huge">Done</div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- /.row -->
  <div class=row>
  <div class="col-lg-3 col-md-6"> <!-- User Story -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 #001</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- ToDo -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"><a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 뷰 디자인 #001</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- Doing -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 뷰 디자인 #001</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- Done -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 뷰 디자인 #001</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      
      <div class="row">
      <div class="col-lg-3 col-md-6"> <!-- User Story -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 #002</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- ToDo -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 뷰 디자인 #002</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- Doing -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 뷰 디자인 #002</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6"> <!-- Done -->
    <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
          <div class="col-xs-6 text-left">
              <div class="content">&nbsp;<a class="fa fa-pencil"></a></div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content"><a class="fa fa-trash-o"></a>&nbsp;</div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 뷰 디자인 #002</div>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      
     
  
  
</div>
</div>
<!-- /#page-wrapper -->


