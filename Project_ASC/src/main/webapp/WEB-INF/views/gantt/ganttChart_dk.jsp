<%@ page contentType="text/html; charset=utf-8" %>

<style>
   #actionChartBtn{
      float:right;
   }
      
   .gantt{
      width:100%;
      border: 4px solid #f6e9e9;
      border-radius: 6px;
      box-sizing: border-box;
      position: relative;
   }
   .ganttWrapper{
      width:100%;
   }
   
    .ganttWrapper .spacer{
      margin: 0;
      height:48px;
      width:100%;
    }
   
   .ganttWrapper .dataPanel{
      height:600px;
      margin-left: 0px;
      width:1920px;
      /* background-image: url(/resources/images/gantt/grid.png); */
    }
    
    .ganttWrapper .row{
      float: left;
      height: 40px;
    }
    
    .ganttWrapper .date{
       overflow: auto;
       width: 40px;
       height: 40px;
       line-height: 40px;
       text-align: center;
       margin: 0px 0 0 -1px;
       font-size: 11px;
       color: #484a4d;
       text-align: center;
    }
    
    .ganttWrapper .wd{
      background-color: rgb(241, 196, 15);
      text-align: center;
    }
    
    .ganttWrapper .blank{
      background-color: white;
      text-align: center;
    }
    
   .ganttWrapper .ganttContent{
      overflow: hidden;
      position: relative;
      width: 100%;
   }
   
   
   .ganttWrapper .leftPanel{
      float: left;
      width: 225px;
      overflow: hidden;
      border-right: 1px soild #ddd;
      position: relative;
   }
   
   .ganttWrapper .functions{
      margin:0px;
      width:100%;
      text-align: center;
   }
   .ganttWrapper .rightPanel{
      overflow:auto; 
   }
   .ganttWrapper .bottomPanel{
      clear:both;
      text-align: center;
      width:100%;
   }
   
   .ganttWrapper .col{
      background-color: yellow;
      position: absolute;
      margin-left: 196px; /* 이게 동적으로 바뀌어야 함 39 x 개수 */
      width: 40px;
      height: 600px;
      opacity : 0.6;
      z-index : 1;
   }
   
   .ganttLabel{
    display: inline-block;
    margin: 0 0 0 5px;
    color: #484A4D;
    width: 110px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
   }
   
</style>

<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">Gantt Chart</h1>
      </div>
   </div>
   <div class="row">
      <input type="button" id="actionChartBtn"class="btn btn-primary" value="현재 진행률">
   </div>
      <div class="clearfix"></div>
         <div class="row">
           <div class="gantt">
            <div class="ganttWrapper">
               <div class="ganttContent">
                  <div class="leftPanel">
                     <div class="row spacer">
                        
                     </div>
                     <div class="row functions">
                           <span class="ganttLabel">Sprint 0</span>
                     </div>
                     <div class="row functions">
                           <span class="ganttLabel">Sprint 1</span>
                     </div>
                     <div class="row functions">
                           <span class="ganttLabel">Sprint 2</span>
                     </div>
                  </div>
                  <div class="rightPanel">
                     <div class="dataPanel">
                        
                        <div class="row days" style="margin-left: 0px;">
                           
                        </div>
                        <div class="row action0" id="action0" style="margin-left: 0px;">
                           
                        </div>
                        <div class="row action1" id="action1" style="margin-left: 0px;">
                           
                        </div>
                        <div class="row col"></div>
                        <div class="row action2" id="action2" style="margin-left: 0px;">
                           
                        </div>
                     </div>
                  </div>
                  <div class="bottomPanel">
                      <a class="btn btn-danger" data-toggle="modal" data-target="#registGanttChartModal">추가</a>
                  </div>
               </div>
             </div>
            </div>
         </div>
</div>
  <!-- Modal -->
  <jsp:include page="include/registGanttChartModal.jsp" />
  <jsp:include page="include/modifyGanttChartModal.jsp" />
<script>
$(function() {
	var days = "";
	   for(var i=1; i<50; i++){
	   	days += "<div class='row date wd'>"+i+"</div>";
	   }
	   $('.days').html(days);
	   var days = "";
	   for(var i=1; i<50; i++){
		   if(i <10){
	  	 	  days += "<div class='row date blank'></div>";
		   }else{
	  	 	  days += "<div class='row date action0'></div>";
		   }
	   } 
	   $(".action0").css("background-color", "rgb(42, 128, 185)");
	   $('#action0').html(days);
	   var days = "";
	   for(var i=1; i<50; i++){
		   if(i <10){
		  	 	  days += "<div class='row date action1'></div>";
			   }else{
		  	 	  days += "<div class='row date blank'></div>";
			   }
	   }
	   $(".action1").css("background-color", "rgb(231, 126, 35)");
	   $('#action1').html(days);
	   var days = "";
	   for(var i=1; i<50; i++){
		  	   if(i <10){
		  	 	  days += "<div class='row date blank'></div>";
			   }else if(i<20){
		  	 	  days += "<div class='row date action2'></div>";
			   }else{
		  	 	  days += "<div class='row date blank'></div>";
			   }
	   } 
	   $(".action2").css("background-color", "rgb(22, 160, 134)");
	   $('#action2').html(days);
	   
	   $('#actionChartBtn').on('click', function() {
		 location.href="currentChart";
	   });
	   
	   $('.dataPanel').on('click', function() {
		 $('#modifyGanttChartModal').modal();
	   });
});
   
</script>
