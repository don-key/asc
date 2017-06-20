<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


   <script type="text/javascript">
   $(document).ready(function(){
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      
      
	/** 차트 그리기 */
      function drawChart() {
		/** 스프린트 개수만큼 반복 */
    	  <c:forEach items="${doneDateList}" var="doneDateList" varStatus="status">
    	  <c:set var="count">${status.index}</c:set>
    	  /** 며칠짜리인지 jstl tag로 변수 주기 */
    	  <c:set var="durationCount">${duration[count]-1}</c:set>
    	  var number = ${status.index};
    	  var back = 'curve_chart'+number;
    	  var title = (number+1)+"번째 스프린트";
		  var duration = ${duration[count]};
		  var startDate =  '${sprint[count].startDate }';
		  var startDateSplit = startDate.split('-');
		  var year = parseInt(startDateSplit[0]); 
		  var month = parseInt(startDateSplit[1]); 
		  var day = parseInt(startDateSplit[2]); 
		  var iBackLog = '${idealBackLogCount[count]}';
		  var dateArray = new Array(duration);
		  var iBackLogArray = new Array(duration);
		  var rBackLogArray = new Array(duration);
		  var remainder = iBackLog;

  	      var table = [];
  	      table.push(['Date', 'Ideal', 'Reality']);
  	      
  	      /** 이상 개수 표현 (함수 만들어서 기울기처리)*/
  	      iBackLogArray = slope(duration, iBackLog);
  	      
  	      var i = 0;
  	      /** 기간만큼 반복 */
  	      <c:forEach var="i" begin="0" end="${durationCount}" varStatus="status">
  	     <c:set var="count2">${status.index}</c:set>
  	      /** 날짜 표현 (함수사용) */
  	    	if (month == 13) {
  				month = 1;
  				year = year + 1;
  			 dateArray[i] = year + '/' + month+'/'+day;
  			 var result = addDay(month, day);
  				month = result[0];
  				day = result[1];
  			} else{
  			 dateArray[i] = month+'/'+day;
  				var result = addDay(month, day);
  				month = result[0];
  				day = result[1];
  			}
  	      
  	      /** 남은개수 계산하기 */
  	    	var minus = ${doneDateList[count2]};
  	    	var amount=0;
  	    	if (minus == -1) {
				amount = -1;
				remainder = -1;
			} else {
				amount = remainder - minus;
	  	    	remainder = amount;

			}
  	    	

    	      /** float를 number타입으로 변환해주어야 오류가 안남 */
    	    if (amount == -1) {
    	      table.push( [dateArray[i], Number(iBackLogArray[i]), null]);
    		} else {
      	      table.push( [dateArray[i], Number(iBackLogArray[i]), amount]);
    		}	
  			i++;
  			
    	    </c:forEach>
    	    
    	    
          var data = google.visualization.arrayToDataTable(table);
  
          var options = {
        		  
            title: title,
            legend: { position: 'bottom' },
            vAxis: {
            	format: '0',
              viewWindow: {
                min:0
              }
            }
          };
          var chart = new google.visualization.LineChart(document.getElementById(back));
          chart.draw(data, options);
          </c:forEach>
        }
   });
    </script>
    
 <script>
    /** 백로그 기울기처리 (y=-x(날짜)+개수) */
    function slope(duration, backLog){
    	/** float 형으로 변환하기(나누면 정수만 나오는거 막고, 기울기 분수처리위해) */
    	var DBackLog = parseFloat(backLog);
    	var slope = DBackLog/(duration-1);
    	var array = new Array(duration);
    	array[0] = backLog;
    	for (var i = 1; i < array.length; i++) {
    		/** 나름대로 정확성을 위해 소수점 7자리까지계산 (출력은 1자리까지) */
			array[i] = (DBackLog - slope).toFixed(7);
			DBackLog = array[i];
		}
    	
        return array;
      }
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
      <br> <img alt="" src="/resources/images/header/burnDown.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
    </div>
  </div>
  <c:forEach items="${duration}" var="duration" varStatus="status">
    <div id="curve_chart${status.index}" style="height: 600px" ></div>
</c:forEach>
</div>






