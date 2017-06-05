<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
a {
  color: black;
}

a:hover, a:focus {
    color: #2e689b;
    text-decoration: none;
}


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


/* Effect 1: Brackets */
.ganttEffect th::before,
.ganttEffect th::after {
  display: inline-block;
  opacity: 0;
  -webkit-transition: -webkit-transform 0.3s, opacity 0.2s;
  -moz-transition: -moz-transform 0.3s, opacity 0.2s;
  transition: transform 0.3s, opacity 0.2s;
}

.ganttEffect th::before {
  margin-right: 10px;
  content: '[';
  -webkit-transform: translateX(20px);
  -moz-transform: translateX(20px);
  transform: translateX(20px);
}

.ganttEffect th::after {
  margin-left: 10px;
  content: ']';
  -webkit-transform: translateX(-20px);
  -moz-transform: translateX(-20px);
  transform: translateX(-20px);
}

.ganttEffect th:hover::before,
.ganttEffect th:hover::after,
.ganttEffect th:focus::before,
.ganttEffect th:focus::after {
  opacity: 1;
  -webkit-transform: translateX(0px);
  -moz-transform: translateX(0px);
  transform: translateX(0px);
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
	

	/** 날짜 출력 */
	var innerCode = "";
		innerCode += "<tr>";
	   for(var i=0; i<days; i++){
		   if (pStartYear == pEndYear) {
			   innerCode += "<th>"+pStartMonth+'/'+pStartDay+"</th>";
			var result = addDay(pStartMonth, pStartDay);
			pStartMonth = result[0];
			pStartDay = result[1];
			
		} else{
			/** 여기 나중에 꼭 채워넣자!!!!!!!!! */
			
		}
	   }
	   
	   innerCode += "</tr>";
	   
	   
	/** 기능(색) 출력 */
    <c:forEach items="${ganttList}" var="gantt" varStatus="status">
    	innerCode += "<tr>";
    	<c:set var="count">${status.index}</c:set>
    	for (var i = 0; i < days; i++) {
    		var startCount =  ${startCount[count] };
    		var color = "${gantt.color }";
    		if (i == startCount) {
    			var duration = ${duration[count]};
    			console.log("duration : " + duration);
    			for (var j = 0; j < duration; j++) {
    			innerCode += "<td style='background-color: " + color + "'>&nbsp;</td>";
				}
    			break;
			} else {
				innerCode += "<td>&nbsp;</td>"
			}
		}
    	innerCode += "</tr>";
    </c:forEach>
	
    $('#rightTable').html(innerCode);
	

	  
});


</script>

<script>
/** 날짜 올려주는 함수 */
function addDay(month, day){
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
		return [month, day];
	}
	
/** 기능 조회 모달에 값 넣어주기 */
function viewModal(title, worker, startDate, endDate, color){
	$('#viewTitle').html(title);
	$('#viewWorker').html(worker);
	$('#viewStartDate').html(startDate);
	$('#viewEndDate').html(endDate);
	$('#viewColor').css("background-color", color);
	
	console.log("들어왔니?");
	
	$("#viewGanttChartModal").modal('show');
	
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
          <tr class="ganttEffect">
            <th><a onclick="viewModal('${gantt.title}', '${gantt.worker}', '${gantt.startDate}','${gantt.endDate}', '${gantt.color}' ) " >${gantt.title }</a></th>
          </tr>
        </c:forEach>
      </table>

      <div id="right_div" style="padding-bottom : 5%;">
        <table id="rightTable">
        </table>
      </div>
    </div>
  </div>
  
  <br>
  
  <div class="bottomPanel text-center">
    <a class="btn btn-danger" data-toggle="modal" data-target="#registGanttChartModal">추가</a>
  </div>

  <div class="row">
  <div>테스트 / 변수확인</div>
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
    <div>${startCount[4] }</div>
    <div>${startCount[5] }</div>
    <div>${startCount[6] }</div>
    <div>${startCount[7] }</div>
    <div>기능 유지일 (계산한 값) : ${duration[0] }</div>
    <div>${duration[1] }</div>
    <div>${duration[2] }</div>
    <div>${duration[3] }</div>
    <div>${duration[4] }</div>
    <div>${duration[5] }</div>
    <div>${duration[6] }</div>
    <div>${duration[7] }</div>
    
  </div>


</div>


<!-- Modal -->
<jsp:include page="include/registGanttChartModal.jsp" />
<jsp:include page="include/modifyGanttChartModal.jsp" />
<jsp:include page="include/viewGanttChartModal.jsp" />




