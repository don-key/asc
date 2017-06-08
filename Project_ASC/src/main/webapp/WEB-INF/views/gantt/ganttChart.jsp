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
	var userNo = ${userNo};
	console.log("유저넘 "+userNo);
	
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
    			innerCode += "<td style='background-color: " + color + ";'>&nbsp;</td>";
				}
    			break;
			} else {
				innerCode += "<td>&nbsp;</td>"
			}
		}
    	innerCode += "</tr>";
    </c:forEach>
	
    $('#rightTable').html(innerCode);
	
    


    /** Today */
    var todayDays = ${todayDays};
    if (todayDays != -1) {
    	   var set = $('#rightTable').children().children()[todayDays];
    	      $(set).css('background-image', "url(/resources/images/gantt/today.png)");
    	    <c:forEach items="${ganttList}" var="gantt" varStatus="status">
    	   <c:set var="count">${status.index}</c:set>
    	   var startCount =  ${count};
    	   console.log("count : " + startCount);
    	   var steps = '';
    	      /** i는 세로 뒤에 2 자리는 날짜 범위 */
    	      steps = $('#rightTable').children().next()[startCount].children[todayDays];
    	       $(steps).css("background-image", "url(/resources/images/gantt/today.png)");
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
	
/** 기능 모달에 값 넣어주기 */
function modal(status, listNo, title, worker, startDate, endDate, color){
	if (status == 'view') {
    	$('#viewTitle').html(title);
    	$('#viewWorker').html(worker);
    	$('#viewStartDate').html(startDate);
    	$('#viewEndDate').html(endDate);
    	$('#viewColor').css("background-color", color);
    	
    	$('#modifyListNo').val(listNo);
    	$('#modifyTitle').val(title);
    	/** 여기 해결해야함 */
    	  $('#modifyWorker').each(function(){
    
    		    if($(this).val() == worker){
    		      $(this).attr("selected","selected");
    		    }
    
    		  });
    	$('#modifyStartDate').val(startDate);
    	$('#modifyEndDate').val(endDate);
    	$('#modifyColor').val(color);
    	$('#modifyColorView').css("background-color", color);
    	
    	$("#viewGanttChartModal").modal('show');
	
	} else if(status == 'modify'){
		$("#viewGanttChartModal").modal('hide');
		$('#viewGanttChartModal').on('hidden.bs.modal', function (e) {
		$("#modifyGanttChartModal").modal('show');
			});
		
	}
}


/** 기능 삭제 버튼 누를때 */
function deleteFunction(){
	var listNo = $('#modifyListNo').val();
	swal({
		  title: 'Are you sure?',
		  text: "한번 삭제된 기능은 돌이킬 수 없습니다.",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: "Delete!",
		}).then(function () {
		  swal(
		    'Deleted!',
		    '기능삭제 완료!',
		    'success'
		  ).then(function () {
				location.href="/gantt/delete?listNo="+listNo;
			});
		});
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
            <th><a onclick="modal('view','${gantt.ganttListNo}','${gantt.title}', '${gantt.worker}', '${gantt.startDate}','${gantt.endDate}', '${gantt.color}' ) "  style="cursor:pointer">${gantt.title }</a></th>
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
    <a class="btn btn-danger" data-toggle="modal" data-target="#registGanttChartModal" style="margin-bottom: 3%;">추가</a>
  </div>
  
  
<%--   <div class="test-center">
  <div>오늘의 기능</div>
  <c:forEach items="${todayList}" var="today">
  <div>${today }</div>
  
  </c:forEach>
  </div> --%>




</div>




<!-- Modal -->
<jsp:include page="include/registGanttChartModal.jsp" />
<jsp:include page="include/modifyGanttChartModal.jsp" />
<jsp:include page="include/viewGanttChartModal.jsp" />


<script>
  // UI 구성.
  $('#colorpicker').farbtastic(function(data) {
    color = data;
    $('#color').val(color);
    $('#colorView').css("background-color", color);

  });
  
  $('#modifyColorpicker').farbtastic(function(data) {
    color = data;
    $('#modifyColor').val(color);
    $('#modifyColorView').css("background-color", color);

  });
</script>



