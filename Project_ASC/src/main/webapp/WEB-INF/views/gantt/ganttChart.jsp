<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
td, th {
	padding: 5px;
	height: 40px;
} 

#total_div {
	overflow-x: auto;
}

#right_div {
	width: 1000px;
	overflow-x: auto;
}
</style>

<script>
$(document).ready(function(){
	
	$('#actionChartBtn').on('click', function() {
		location.href = "currentChart";
	});

	$('.dataPanel').on('click', function() {
		$('#modifyGanttChartModal').modal();
	});
	
	var days = ${days};
 	var pStartYear = ${pStartDate[0]};
	var pStartMonth = ${pStartDate[1]};
	var pStartDay = ${pStartDate[2]};
	var pEndYear = ${pEndDate[0]};
	var pEndMonth = ${pEndDate[1]};
	var pEndDay = ${pEndDate[2]}; 
	
	pStartYear = parseInt(pStartYear);
	pStartMonth = parseInt(pStartMonth);
	pStartDay = parseInt(pStartDay);
	
	pEndYear = parseInt(pEndYear);
	pEndMonth = parseInt(pEndMonth);
	pEndDay = parseInt(pEndDay);
	

	
	var date = "";
	   for(var i=0; i<days; i++){
		   console.log(days);
		   if (pStartYear == pEndYear) {
			   date += "<th>"+pStartMonth+'/'+pStartDay+"</th>";
			var result = addDay(pStartMonth, pStartDay);
			pStartMonth = result[0];
			pStartDay = result[1];
			
		} else{
			
		}
		  console.log(i);
	   } 
	   $('.headDate').html(date);
	


	  
});


</script>

<script>
/** 날짜 올려주는 함수 */
function addDay(month, day){
		console.log("스위치 전 : " + month + " 달 : 일 " + day);
		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12: if (day == 31) {
			month += 1;
			day = 1;
		} else {
			day += 1;
		}	
			break;
		case 4:
		case 6:
		case 9:
		case 11: if (day == 30) {
			month += 1;
			day = 1;
		} else {
			day += 1;
		}	
			break;
		case 2:	if (day == 28) {
			month += 1;
			day = 1;
		} else {
			day += 1;
		}	
			break;
		}
		console.log("스위치 후 : " + month + " 달 : 일 " + day);
		return [month, day];
	}






</script>


<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <br> <img alt="" src="/resources/images/header/gantt.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
    </div>
  </div>
  <div class="row text-right">
    <input type="button" id="actionChartBtn" class="btn btn-primary" value="현재 진행률">
  </div>

  <br>



  <div id="total_div">
    <div style="display: flex; overflow-x: auto; white-space: nowrap;">

      <table style="margin-right: 3%; border-right: 1px solid darkgrey;">
        <tr>
          <th style="padding-right: 5%">&nbsp;</th>
        </tr>
        <c:forEach items="${ganttList}" var="gantt">
          <tr>
            <th>${gantt.title }</th>
          </tr>
        </c:forEach>
      </table>

      <div id="right_div days">
      </div>

      <div id="right_div">
        <table id="inner_table">
          <tr class=headDate>
          </tr>
          <tr>
            <td style="background-color: rgb(42, 128, 185)">&nbsp;</td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(231, 126, 35)">&nbsp;</td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
          </tr>

          <tr>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
          </tr>




        </table>
      </div>
    </div>
  </div>
  <br>
  <div class="bottomPanel text-center">
    <a class="btn btn-danger" data-toggle="modal" data-target="#registGanttChartModal">추가</a>
  </div>

  <div class="row">
    <table>
      <c:forEach items="${ganttList}" var="gantt">
        <tr>
          <td>${gantt.ganttListNo }</td>
          <td>${gantt.ganttNo }</td>
          <td>${gantt.userNo }</td>
          <td>${gantt.title }</td>
          <td>${gantt.worker }</td>
          <td>${gantt.startDate }</td>
          <td>${gantt.endDate }</td>
          <td>${gantt.color }</td>
        </tr>
      </c:forEach>
    </table>

  </div>
  
    <div class="row">
    <table>
        <tr>
          <td>${projectDate.projectListNo }</td>
          <td>${projectDate.projectName }</td>
          <td>${projectDate.startDate }</td>
          <td>${projectDate.endDate }</td>
          <td>날짜는요? ${days}</td>
        </tr>
    </table>

  </div>

    <div class="row">
    <div>받아온 값들</div>
    <div>기간 : ${days }</div>
    <div>프젝 시작일 : ${pStartDate[0] }</div>
    <div>${pStartDate[1] }</div>
    <div>${pStartDate[2] }</div>
    <div>프젝 마감일 : ${pEndDate[0] }</div>
    <div>${pEndDate[1] }</div>
    <div>${pEndDate[2] }</div>
    <div>기능 시작일 (계산한 값) : ${startCount[0] }</div>
    <div>${startCount[1] }</div>
    <div>${startCount[2] }</div>
    <div>${startCount[3] }</div>
    <div>기능 유지일 (계산한 값) : ${duration[0] }</div>
    <div>${duration[1] }</div>
    <div>${duration[2] }</div>
    <div>${duration[3] }</div>
    
  </div>


</div>


<!-- Modal -->
<jsp:include page="include/registGanttChartModal.jsp" />
<jsp:include page="include/modifyGanttChartModal.jsp" />

<script>
	$(function() {


		
	});
</script>



