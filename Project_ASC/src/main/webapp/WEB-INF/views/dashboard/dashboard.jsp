<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
div#clock {
color: white;
width: 600px;
overflow: hidden;
text-align: center;
  padding-top : 20%;
  padding-bottom: 5%;
  padding-left: 20%;
  padding-right: 20%;
}
div#clock p {
float: left;
}
div#clock p span {
display: block;
font-size: 50px;
font-weight: bold;
padding: 5px 0 0;
}
#daysLeft {
  color: black;
  margin : auto;
}
.foot {
  padding : 0;
  background : white;
  height: 190px;
}
#textArea {
  resize:none;
  overflow-x:hidden; 
  height: 350px;
  width: 540px;
  border: 0;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px;
}
.textarea {
  padding: 0;
}
.panel-today{
  background : #a8c8f9;
}
.panel-memo {
  background : #c2e0ba;
}
.panel-d-day{
  background : #fc9ebd;
}
.panel-action {
  background : #ffdda6;
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
                <div class="col-lg-6 col-md-6">
                  <div class="col-lg-12 col-md-12">
                    <div class="panel panel-today">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-9 text-left">
                                    <div class="huge">Today Job List</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                                <div>Comment Here!</div>
                                <div>Comment Here!</div>
                                <div>Comment Here!</div>
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
                                <textarea id="textArea" cols='49' rows='20'>Memo</textarea>
                            </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6">
                  <div class="col-lg-6 col-md-6">
                    <div class="panel panel-d-day">
                        <div class="panel-heading">
                          <span class="pull-left">D-Day</span>
                          <div class="clearfix"></div>
                        </div>
                        <div class="panel-footer foot">
                          <div>
                            <div id="clock">
                              <p>
                                <span id="daysLeft">D-Day</span>
                              </p>
                            </div>
                        </div>
                        </div>
                   	  </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <div class="panel panel-action">
                        <div class="panel-heading">
                          <span class="pull-left">Action</span>
                          <div class="clearfix"></div>
                        </div>
                        <div class="panel-footer">
                          <div id="specificChart" class="donut-size">
                            <div class="pie-wrapper">
                              <span class="label">
                                <span class="num">0</span><span class="smaller">%</span>
                              </span>
                              <div class="pie">
                                <div class="left-side half-circle"></div>
                                  <div class="right-side half-circle"></div>
                                </div>
                              <div class="shadow"></div>
                            </div>
                          </div>
                        </div>
                    </div>
                  </div>
<!--               </div> -->
                  <div class="col-lg-12 col-md-12">
                    <div class="panel panel-calendar">
                        <div class="panel-heading">
                            <div class="row">
                                <div id='calendar'></div>
                                <div id='box'></div>
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
  		var title = prompt('Event Title:');
      	if (title) {
        	updateDonutChart('#specificChart', title, true);
        }
      	
      
    $(function() {
      // Easy pie charts
      var calendar = $('#calendar').fullCalendar({
      	header: {
        	left: 'prev,next',
        	center: 'title',
        	right: 'month,basicWeek,basicDay'
      	}
      });
		});
		</script>
    

