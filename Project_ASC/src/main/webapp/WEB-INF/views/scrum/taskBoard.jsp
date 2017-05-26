<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<link
  href="${pageContext.servletContext.contextPath}/resources/css/scrum/scrum.css"
  rel="stylesheet">



<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <div class="page-header" id="taskBoardBtn">
        <a class="btn btn-default" data-toggle="modal" data-target="#categoryModal"> Category </a> <a
          class="btn btn-default active"> Task Board </a> <a
          class="btn btn-default"> Release Planning </a>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->

  <div class="container">

    <div class="col-sm-1" id="tabArea">
      <ul id="myTab4" class="nav nav-tabs tabs-left sideways"
        role="tablist">
        <li role="presentation" class="active"><a href="#home4"
          id="home-tab4" role="tab" data-toggle="tab"
          aria-controls="home4" aria-expanded="true">2nd Sprint</a></li>
        <li role="presentation" class=""><a href="#profile4"
          role="tab" id="profile-tab4" data-toggle="tab"
          aria-controls="profile4" aria-expanded="false">1st Sprint</a></li>
        
      </ul>
    </div>
    <div class="col-sm-11">
      <div id="myTabContent4" class="tab-content">
        <div role="tabpanel" class="tab-pane fade active in" id="home4"
          aria-labelledby="home-tab4">
          
          <div class="row">

    <div class="col-lg-3 col-md-6">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="huge">User Story <a class="fa fa-plus-circle"></a></div>
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
              <div class="huge">To Do <a class="fa fa-plus-circle" data-toggle="modal" data-target="#registTodoModal"></a></div>
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
    <div class="col-lg-3 col-md-6">
      <!-- User Story -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 #001</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- ToDo -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil" data-toggle="modal" data-target="#modifyTodoModal"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content"><a data-toggle="modal" data-target="#detailTodoModal">회원가입 뷰 디자인 #001</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- Doing -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil" ></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">회원가입 뷰 디자인 #001</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- Done -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
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
    <div class="col-lg-3 col-md-6">
      <!-- User Story -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 #002</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- ToDo -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 뷰 디자인 #002</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- Doing -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content">로그인 뷰 디자인 #002</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <!-- Done -->
      <div class="panel panel-gray">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-6 text-left">
              <div class="content">
                &nbsp;<a class="fa fa-pencil"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
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
        <div role="tabpanel" class="tab-pane fade"
          id="profile4" aria-labelledby="profile-tab4">
          <p>1번째</p>
        </div>
      </div>
    </div>

  </div>


  
</div>
<!-- /#page-wrapper -->

<!-- Modal -->
  <jsp:include page="include/registTodoModal.jsp" />
  <jsp:include page="include/detailTodoModal.jsp" />
  <jsp:include page="include/modifyTodoModal.jsp" />
  <jsp:include page="include/categoryModal.jsp" />
