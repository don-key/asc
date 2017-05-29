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
          href="/scrum/taskBoard" class="btn btn-default active"> Task Board </a> <a
          href="/scrum/releasePlanning" class="btn btn-default"> Release Planning </a>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  
  
  <div class="container">
    <div class="row">
      <div class="col-sm-2 col-sm-offset-10">
        <a class="btn btn-default" id="nextSprintBtn">Next Sprint <span class="fa fa-plus-circle"></span></a>
      </div>
    </div>

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
              <div class="huge">User Story <a class="fa fa-plus-circle" data-toggle="modal" data-target="#registUserStoryModal"></a></div>
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
                &nbsp;<a class="fa fa-pencil" data-toggle="modal" data-target="#modifyUserStoryModal"></a>
              </div>
            </div>
            <div class="col-xs-6 text-right">
              <div class="content">
                <a class="fa fa-trash-o"></a>&nbsp;
              </div>
            </div>
            <div class="col-xs-10 col-xs-offset-1 text-center">
              <div class="content"><a data-toggle="modal" data-target="#detailUserStoryModal">회원가입 #001</a></div>
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

<script>
// <a class="btn btn-default" id="nextSprintBtn">

$('#nextSprintBtn').on("click", function(event) {
	event.preventDefault();
// 	var chg = (decodeURIComponent('${cookie.name.value}'));
// 	var articleNo = $(this).next().next().val();
// 	var productN = $(this).next().next().next().val();
// 	var from = $(this).next().next().next().next().val();

swal({
		  title: '　　정말로 다음 스프린트로　　넘어가시겠습니까??',
			text: '확인 을 입력해주세요',
		  input: 'text',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인', 
		  cancelButtonText: '취소',
		  showLoaderOnConfirm: true,
		  preConfirm: function (confirm) {
			    return new Promise(function (resolve, reject) {
			      setTimeout(function() {
			        if (confirm == '확인') {
			          console.log('Confirm');
			          location.href='/scrum/taskBoard';
			        } else {
			          resolve()
			        }
			      }, 500)
			    })
			  },
			  allowOutsideClick: false
			}).then(function (confirm) {
			  swal({
			    type: 'warning',
			    title: '잘 못 입력하셨어요!',
			    html: '확인 을 입력하세요!'
			   
			  })
		});
		return false;
	
	});
</script>

<!-- Modal -->
  <jsp:include page="include/registTodoModal.jsp" />
  <jsp:include page="include/detailTodoModal.jsp" />
  <jsp:include page="include/modifyTodoModal.jsp" />
  <jsp:include page="include/registUserStoryModal.jsp" />
  <jsp:include page="include/detailUserStoryModal.jsp" />
  <jsp:include page="include/modifyUserStoryModal.jsp" />
  <jsp:include page="include/categoryModal.jsp" />
