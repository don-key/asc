<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


   <script type="text/javascript">
   $(document).ready(function(){
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      
      

      function drawChart() {
    	  <c:forEach items="${duration}" var="duration" varStatus="status">
    	  <c:set var="count">${status.index}</c:set>
    	  var number = ${status.index};
    	  var back = 'curve_chart'+number;
    	  var title = (number+1)+"번째 스프린트";
		  var duration = ${duration};
		  var startDate =  '${sprint[count].startDate }';
		  var startDateSplit = startDate.split('-');
		  var dateArray = new Array(duration);
		   for(var i=0; i<duration; i++){
				 dateArray[i] = startDateSplit[1]+'/'+startDateSplit[2];
				var result = addDay(startDateSplit[1], startDateSplit[2]);
				startDateSplit[1] = result[0];
				startDateSplit[2] = result[1];
			}
		   
		   
    	  
	    var table = [];
	    table.push(['Date', 'Ideal', 'Reality']);
	    table.push( ['6/17',  1000,      50]);
	    table.push(['6/16',  300,      400]);
        var data = google.visualization.arrayToDataTable(table);

        var options = {
          title: title,
          curveType: 'function',
          legend: { position: 'bottom' }
        };
        
        var chart = new google.visualization.LineChart(document.getElementById(back));
        chart.draw(data, options);
        </c:forEach>
      }
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
    case 2: if (day == 28) {
      month += 1;
      day = 1;
    } else {
      day += 1;
    } 
      break;
    }
    return [month, day];
  }
  </script>
    
    
    
<div id="page-wrapper">
  <c:forEach items="${duration}" var="duration" varStatus="status">
    <div id="curve_chart${status.index}" style="width: 1000px; height: 600px" onload="drawChart('${status.index}')"></div>
</c:forEach>

<div>변수 테스트</div>
<table>
<c:forEach items="${sprint}" var="sprint">
<tr>
<td>카운트 : ${sprint.count }</td>
<td>스프린트넘 : ${sprint.sprintNo }</td>
<td>스크럼넘 : ${sprint.scrumNo }</td>
<td>시작일 : ${sprint.startDate }</td>
<td>끝나는날 : ${sprint.endDate }</td>
</tr>
</c:forEach>

<c:forEach items="${sprintBLog}" var="sprintBLog">
<tr>
<td>스프린트백로그넘 : ${sprintBLog.sprintBackLogNo }</td>
<td>스프린트넘 : ${sprintBLog.sprintNo }</td>
<td>유저스토리넘 : ${sprintBLog.userStoryNo }</td>
<td>유저넘 : ${sprintBLog.userNo }</td>
<td>내용 : ${sprintBLog.content }</td>
<td>상태 : ${sprintBLog.status }</td>
<td>완료일 : ${sprintBLog.doneDate }</td>
</tr>
</c:forEach>

<c:forEach items="${duration}" var="duration">
<tr>
<td>duration : ${duration}</td>
</tr>
</c:forEach>

<c:forEach items="${graphDate}" var="graphDate">
<tr>
<td>날짜 확인: ${graphDate}</td>
</tr>
</c:forEach>

<c:forEach items="${graphDate}" var="graphDate">
<tr>
<c:forEach items="${duration}" var="duration">
<td>날짜 확인: ${graphDate}</td>
</c:forEach>
</tr>
</c:forEach>


</table>

</div>






