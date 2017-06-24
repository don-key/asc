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
	width: 3000px;
	overflow-x: auto;
}

/** 일정 목록 css */
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
	var userNo = ${login.userNo};
	var projectListNo = location.pathname.split('/')[3];
	
	$('#ganttChartBtn').on('click', function() {
		location.href = "/gantt/ganttChart/"+projectListNo+"/"+userNo;
	});
	
	/** 이상/현실 표현을 위한 변수 */
	var totalCount = 0;
	var ideal = 0;
	var real = 0;

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
	var innerCode = "<tr>";
	   for(var i=0; i<days; i++){
		   if (pStartYear == pEndYear) {
			   innerCode += "<th>"+pStartMonth+'/'+pStartDay+"</th>";
			var result = addDay(pStartMonth, pStartDay);
			pStartMonth = result[0];
			pStartDay = result[1];
			
		} else{
			if (pStartMonth == 13) {
				pStartMonth = 1;
				pStartYear = pStartYear +1;
			   innerCode += "<th>"+pStartYear + '/' + pStartMonth+'/'+pStartDay+"</th>";
				var result = addDay(pStartMonth, pStartDay);
				pStartMonth = result[0];
				pStartDay = result[1];
			} else {
				   innerCode += "<th>"+pStartMonth+'/'+pStartDay+"</th>";
					var result = addDay(pStartMonth, pStartDay);
					pStartMonth = result[0];
					pStartDay = result[1];
			}
			
		}
	   }
	   
	   innerCode += "</tr>";
	   
		/** 일정 기간 부분 class주기 (class로 커서 활성화 비활성화 구분 및 퍼센트 계산을위해) */
	    <c:forEach items="${ganttList}" var="gantt" varStatus="status">
	    	innerCode += "<tr>";
	    	<c:set var="count">${status.index}</c:set>
	    	for (var i = 0; i < days; i++) {
	    		var startCount =  ${startCount[count] };
	    		var color = "${gantt.color }";
	    		if (i == startCount) {
	    			var duration = ${duration[count]};
	    			for (var j = 0; j < duration; j++) {
	    			innerCode += "<td class='distance'>&nbsp;</td>";
	    			totalCount++;
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
    
    /** 실행된거 색 및 X표시 입히기 */
    <c:forEach items="${actionList}" var="action" varStatus="status">
    <c:set var="count">${status.index}</c:set>
	var theDay = ${theDay[count]};
	var funcCount = ${action.count}-1;
	var color = '${action.color}';
    var steps = $('#rightTable').children().next()[funcCount].children[theDay];
    var status = ${action.status};
    if (status == 0) {
    	$(steps).css("background-image", "url(/resources/images/gantt/X.png)");
		$(steps).css("background-repeat", "no-repeat");
	} else {
   		$(steps).css("background-color", color);
   		real++;
	}
    </c:forEach> 
    
    
    /** Today */
    var todayDays = ${todayDays};
    if (todayDays != -1) {
    	   var set = $('#rightTable').children().children()[todayDays];
    	      $(set).css('background-image', "url(/resources/images/gantt/today.png)");
    	    <c:forEach items="${ganttList}" var="gantt" varStatus="status">
    	   <c:set var="count">${status.index}</c:set>
    	   var startCount =  ${gantt.count}-1;
    	   var listNo = ${gantt.ganttListNo};
    	   var steps = '';
    	      steps = $('#rightTable').children().next()[startCount].children[todayDays];
    	      if ($(steps).css("background-image") == 'none') {
    	       $(steps).css("background-image", "url(/resources/images/gantt/today.png)");
			} else {
    	       $(steps).css("background-image", "url(/resources/images/gantt/today.png), url(/resources/images/gantt/X.png)");
    	       $(steps).css("background-repeat", "no-repeat");
			}
    	   </c:forEach> 
	}
    
    


    
	/** 안한거 -표시 */
    <c:forEach items="${ganttList}" var="gantt" varStatus="status2">
    <c:set var="count2">${status2.index}</c:set>
    var count = ${count2};
    var listNo = ${gantt.ganttListNo};
    for (var i = 0; i <= todayDays; i++) {
    	var steps = $('#rightTable').children().next()[count].children[i];
		if ($(steps).hasClass('distance')) {
			ideal++;
			if (i != todayDays) {
				var backColor = $(steps).css("background-color");
				var backgroundImage = $(steps).css("background-image");
				if (backColor == 'rgba(0, 0, 0, 0)' && backgroundImage == 'none') {
					$(steps).css("background-image", "url(/resources/images/gantt/dash.png)");
					$(steps).css("background-repeat", "no-repeat");
					$(steps).addClass("none");
					$(steps).css("cursor", "pointer");
					$(steps).attr("id",listNo+":"+(todayDays-i));
				}
			}
		}
	}
	</c:forEach>
	
    /** 체크안한 X표 누를때 */
    $(".none").on("click",function(){
    	var info = $(this).attr('id').split(':');
    	var ganttListNo = info[0];
    	var tOrY = info[1];
    	
    	swal({
    		  title: '실행 여부 체크',
    		  text: "이날 할당량을 채우셨습니까?",
    		  type: 'warning',
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: 'Yes',
    		  cancelButtonText: 'No',
    		}).then(function () {
    			$.ajax({
  				url : "/gantt/actionRegister",
  				type : "POST",
  				data : {
  					projectListNo : projectListNo,
  					userNo : userNo,
  					ganttListNo : ganttListNo,
  					tOrY : tOrY,
  					status : 1
  					
  				},
  				success : function(data) {
  					swal(
  			    		    'Success!',
  			    		    '수고하셨습니다.',
  			    		    'success'
  			    		  ).then(function(){
    		    		    	location.href="/gantt/actionChart/"+projectListNo+"/"+userNo;
    		    		    });
  				}
  			});
    			  
    		}, function (dismiss) {
    		  if (dismiss === 'cancel') {
      			$.ajax({
      				url : "/gantt/actionRegister",
      				type : "POST",
      				data : {
      	  				projectListNo : projectListNo,
      	  				userNo : userNo,
      	  				ganttListNo : ganttListNo,
      	  				tOrY : tOrY,
      	  				status : 0
      				},
      				success : function(data) {
      					swal(
      		    		      'Failure!',
      		    		      '일해라 일해!',
      		    		      'error'
      		    		    ).then(function(){
      		    		    	location.href="/gantt/actionChart/"+projectListNo+"/"+userNo;
      		    		    });
      				}
      			});
    		  }
    		  
    		});
      	
      });
	
	/** progress bar 제어하기 */
	var idealBar = $("#ideal"); 
	var idealWidth = ((ideal/totalCount)*100).toFixed(1);
	idealBar.css("width", idealWidth+'%');
	idealBar.html('이상 >> ' + idealWidth * 1 + '%');
	
	var realBar = $("#real"); 
    var realWidth = 0;
    if (real == 0) {
		realWidth = 0;
	} else{
		realWidth = ((real/totalCount)*100).toFixed(1);
	}
    realBar.css("width", realWidth+'%');
    realBar.html('현실 >> ' + realWidth * 1 + '%');
    

  $.ajax({
  		url : "/gantt/percentUpdate",
  		type : "POST",
  		data : {
  			projectListNo : projectListNo,
  			percent : (realWidth * 1) + '%'
  		}
  	});

 if('${goDashBoard}' != ''){
	 location.href="/project/dashBoard/"+projectListNo+"/"+userNo;
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
  <div class="row">
    <div class="col-lg-12">
      <br> <img alt="" src="/resources/images/header/progress.png"
        style="margin-left: auto; margin-right: auto; display: block; width: 20%">
    </div>
  </div>
  <div class="row text-right">
    <input type="button" id="ganttChartBtn" class="btn btn-primary"
      value="간트차트">
  </div>

  <br>
    <div class="progress">
        <div class="progress-bar" id="ideal" role="progressbar" 
        aria-valuemin="0" aria-valuemax="100" ></div>
   </div>
    <div class="progress">
        <div class="progress-bar" id="real" role="progressbar" 
        aria-valuemin="0" aria-valuemax="100" ></div>
   </div>


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
              style="cursor: pointer">${gantt.title } (${gantt.worker })</a></th>
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
  


</div>







