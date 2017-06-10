<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
/** CSS는 나중에 뺄거임 */
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
	width: 3000px;
	overflow-x: auto;
}

/** 기능 목록 css */
.ganttEffect th::before, .ganttEffect th::after {
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

.ganttEffect th:hover::before, .ganttEffect th:hover::after,
	.ganttEffect th:focus::before, .ganttEffect th:focus::after {
	opacity: 1;
	-webkit-transform: translateX(0px);
	-moz-transform: translateX(0px);
	transform: translateX(0px);
}
</style>

<script>
$(document).ready(function(){
	var projectListNo = <%=request.getParameter("projectListNo")%>;
	var userNo = <%=request.getParameter("userNo")%>;
	
	$('#ganttChartBtn').on('click', function() {
		location.href = "/gantt/ganttChart?projectListNo="+projectListNo+"&userNo="+userNo;
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
	    			innerCode += "<td class='distance'>&nbsp;</td>";
					}
	    			for (var j = 0; j < days-duration-i; j++) {
	    			innerCode += "<td>&nbsp;</td>";
	    			}
	    			break;
				} else {
					innerCode += "<td>&nbsp;</td>";
				}
			}
	    	innerCode += "</tr>";
	    </c:forEach>
	   
	   

	
    $('#rightTable').html(innerCode);
    
    /** 실행된거 색입히기 */
    <c:forEach items="${actionList}" var="action" varStatus="status">
    <c:set var="count">${status.index}</c:set>
	var theDay = ${theDay[count]};
	var funcCount = ${action.ganttListNo}-1;
	var color = '${action.color}';
    var steps = $('#rightTable').children().next()[funcCount].children[theDay];
    $(steps).css("background-color", color);
    </c:forEach> 
    	
    
    
    /** Today */
    var todayDays = ${todayDays};
    if (todayDays != -1) {
    	   var set = $('#rightTable').children().children()[todayDays];
    	      $(set).css('background-image', "url(/resources/images/gantt/today.png)");
    	    <c:forEach items="${ganttList}" var="gantt" varStatus="status">
    	   <c:set var="count">${status.index}</c:set>
    	   var startCount =  ${count};
    	   var listNo = ${gantt.ganttListNo};
    	   console.log("count : " + startCount);
    	   var steps = '';
    	      steps = $('#rightTable').children().next()[startCount].children[todayDays];
    	       $(steps).css("background-image", "url(/resources/images/gantt/today.png)");
    	       var check = $(steps).css("background-color");
    	       if (check != 'rgba(0, 0, 0, 0)') {
    	    	$(steps).css("cursor", "pointer");
    	    	$(steps).addClass("today");
				$(steps).attr("id",listNo+":"+todayDays);
			}
    	   </c:forEach> 
	}


    
	/** 안한거 X표 치기 */
    <c:forEach items="${ganttList}" var="gantt" varStatus="status2">
    <c:set var="count2">${status2.index}</c:set>
    var count = ${count2};
    for (var i = 0; i < todayDays; i++) {
    	console.log("들어오나" +i);
    	console.log($(steps).hasClass('distance'));
    	var steps = $('#rightTable').children().next()[count].children[i];
		if ($(steps).hasClass('distance')) {
			var backColor = $(steps).css("background-color");
			console.log("배경색 : "+ backColor);
			if (backColor == 'rgba(0, 0, 0, 0)') {
				$(steps).css("background-image", "url(/resources/images/gantt/ganttX.PNG)");
				$(steps).css("background-repeat", "no-repeat");
			}
			
		}
	}
	</c:forEach>
	
    
	  
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
  <div class="row">
    <div class="col-lg-12">
      <br> <img alt="" src="/resources/images/header/gantt.png"
        style="margin-left: auto; margin-right: auto; display: block; width: 20%">
    </div>
  </div>
  <div class="row text-right">
    <input type="button" id="ganttChartBtn" class="btn btn-primary"
      value="간트차트">
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
            <th><a
              onclick="modal('view','${gantt.ganttListNo}','${gantt.title}', '${gantt.worker}', '${gantt.startDate}','${gantt.endDate}', '${gantt.color}' ) "
              style="cursor: pointer">${gantt.title }</a></th>
          </tr>
        </c:forEach>
      </table>

      <div id="right_div" style="padding-bottom: 5%;">
        <table id="rightTable">
        </table>
      </div>
    </div>
  </div>

  <br>
  
  <div class="row">
    <div>변수 확인</div>
         <c:forEach items="${actionList}" var="action">
            <div>${action.actionListNo },
            ${action.actionNo },
            ${action.ganttListNo },
            ${action.userNo },
            ${action.actionDate },
            ${action.status },
            ${action.color }</div>
        </c:forEach>
        
  </div>


</div>








