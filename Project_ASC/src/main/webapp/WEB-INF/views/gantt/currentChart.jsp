<%@ page contentType="text/html; charset=utf-8" %>
<style>
   #ganttChartBtn{
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
    
    .ganttWrapper .x{
      background-color: white;
      background-image: url(/resources/images/gantt/ganttX.PNG);
      background-size: 40px 40px;
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
   
   .progress-bar{
      background-color: rgba(26, 188, 156, 0.52);
   }
   
</style>

<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">Current Chart</h1>
      </div>
   </div>
    <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="70"
        aria-valuemin="0" aria-valuemax="100" style="width:70%">이상 >> 70%</div>
   </div>
    <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="50"
        aria-valuemin="0" aria-valuemax="100" style="width:70%">현실 >> 50%</div>
   </div>
   <div class="row">
      <input type="button" id="ganttChartBtn"class="btn btn-primary" value="간트 차트">
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
                        <div class="row col"></div>
                     </div>
                  </div>
               </div>
             </div>
            </div>
         </div>
</div>


<script>
   
   $(function() {
   var days = "";
   for(var i=1; i<50; i++){
      days += "<div class='row date wd'>"+i+"</div>";
   }
   $('.days').html(days);
   var days = "";
   for(var i=1; i<6; i++){
      if(i <5){
        days += "<div class='row date action0'></div>";
      }else{
        days += "<div class='row date x'></div>";
      }
   } 
   $(".action0").css("background-color", "rgb(42, 128, 185)");
   $('#action0').html(days);
   
   $('#ganttChartBtn').on('click', function() {
		 location.href="ganttChart";
   });
   
   $('.dataPanel').on('click', function() {
	   swal({
		   title: '일정을 완료하셨습니까?',
		   text: "",
		   type: 'question',
		   showCancelButton: true,
		   confirmButtonColor: '#3085d6',
		   cancelButtonColor: '#d33',
		   confirmButtonText: '네',
		   cancelButtonText: '아뇨',
		   confirmButtonClass: 'btn btn-success btn-lg',
		   cancelButtonClass: 'btn btn-danger btn-lg',
		   buttonsStyling: false
		 }).then(function () {
		   swal(
		     '등록 완료!',
		     '일 해라 일!',
		     'success'
		   )
		 }, function (dismiss) {
		   if (dismiss === 'cancel') {
		     swal(
		       '등록 취소!',
		       '일 해라 일!',
		       'error'
		     )
		   }
		 })
	  
   });
    
   });
</script>