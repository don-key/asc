<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<style>
.daysLeft {
	color: black;
}
.foot {
  background: white;
}

#textArea {
	overflow-x: hidden;
	height: 50%;
	width: 100%;
	border: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}

.textarea {
	padding: 0;
}

.panel-today {
	background: #a8c8f9;
}

.panel-memo {
	background: #c2e0ba;
}

.panel-d-day {
	background: #fc9ebd;
}

.panel-action {
	background: #ffdda6;
}
</style>
<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <h1 class="page-header">Dashboard</h1>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  <!--              <div class="row"> -->
  <div class="col-md-12">
  <div class="col-lg-6 col-md-6">
    <div class="col-lg-12 col-md-12">
      <div class="panel panel-today">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-12 text-left">
              <div class="huge">Today Job List</div>
            </div>
          </div>
        </div>
        <div class="panel-footer">
          <div class="row">
            <div class="col-xs-12 text-left">
              <div>Comment Here!</div>
              <div>Comment Here!</div>
              <div>Comment Here!</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-12 col-md-12">
      <div class="panel panel-memo">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-9 text-left">
              <div class="huge">Memo</div>
            </div>
            <div class="col-xs-3 text-right">
              <input type='button' class='btn btn-outline btn-danger' value='SAVE'>
            </div>
          </div>
        </div>
        <div class="panel-footer textarea">
          <div class='row'>
            <div class='col-xs-12'>
              <textarea id="textArea">Memo</textarea>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-6 col-md-6">
    <div class="col-lg-6 col-md-6">
      <div class="panel panel-d-day">
        <div class="panel-heading">
          <div class='row'>
            <div class='col-xs-12 text-left'>
              <div class="huge">D-Day</div>
            </div>
          </div>
        </div>
        <div class="panel-footer foot">
          <div class='row'>
            <div class='col-xs-12 text-center'>
              <div class='huge daysLeft'>D-Day</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-6 col-md-6">
    </div>
    <div class="col-lg-12 col-md-12">
      <div class="panel panel-calendar">
        <div class="panel-heading">
          <div class="row">
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- /.row -->
</div>
<!-- /#page-wrapper -->

<!-- Action Percent -->
<script>
	// 퍼센트 바꾸는 소스
	/* var title = prompt('Event Title:');
	if (title) {
	updateDonutChart('#specificChart', title, true);
	} */

	$(function() {
		// Easy pie charts
		var calendar = $('#calendar').fullCalendar({
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'month,basicWeek,basicDay'
			}
		});
	});
</script>

