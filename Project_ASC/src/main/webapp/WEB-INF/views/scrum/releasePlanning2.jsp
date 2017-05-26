<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="${pageContext.servletContext.contextPath}/resources/css/scrum/scrum.css" rel="stylesheet">



<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <div class="page-header" id="taskBoardBtn">
        <a class="btn btn-default"> Category </a> <a class="btn btn-default"> Task Board </a> <a class="btn btn-default active"> Release Planning</a>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->

  <div class="row text-center" style="display: flex; width: 1200px; overflow-x: scroll; white-space: nowrap">
    <div class="row" style="display: flex; width: 1200px; overflow-x: scroll; white-space: nowrap">
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드1</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드2</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드3</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드4</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드5</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드6</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드7</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">카드8</div>
    </div>
    
    <div class="row">
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
    </div>
    <div class="row">
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
    </div>
    <div class="row">
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
    </div>
    <div class="row">
      <div class="panel panel-primary huge" style="display: inline; padding: 1%; margin-left: 3px; margin-right: 3px;">유저스토리</div>
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
                &nbsp;<a class="fa fa-pencil"><a>
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
<!-- /#page-wrapper -->


