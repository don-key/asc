<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- Modal -->
<div class="modal fade" id="registGanttChartModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <form action="/gantt/register?projectListNo=<%=request.getParameter("projectListNo")%>&userNo=<%=request.getParameter("userNo")%>" method="post" >
      <input type="hidden" id="color" name="color" value="" style="width: 100px;">

      <div class="modal-header" style="background: #354555; color: #ffffff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-weight: bolder;">간트차트 기능 추가</h4>
      </div>
      
        <div class="modal-body">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label for="title" style="font-size: 20px;">제목</label>
            </div>
            <div class="col-xs-8">
              <input type="text" id="title" name="title" style="width: 100%;">
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label for="worker" style="font-size: 20px;">담당자</label>
            </div>
            <div class="col-xs-8">
              <select id="worker" name="worker" style="width: 100%; height: 30px;">
                <option>공통</option>
                <c:forEach items="${member}" var="member">
                  <option>${member }</option>
                </c:forEach>
              </select>
            </div>
          </div>

          <br>
          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label style="font-size: 20px;">기간</label>
            </div>
            <div class="col-xs-3">
              <input type="date" id="startDate" name="startDate">
            </div>
            <div class="col-xs-1" style="margin-left: 20px; height: 25px">~</div>
            <div class="col-xs-4">
              <input type="date" id="endDate" name="endDate">
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label style="font-size: 20px;">색상</label>
            </div>
            <div class="col-xs-8">
              <!-- 색상 선택기 -->
              <div class="col-xs-7">
                <span id="colorpicker"></span>
              </div>
              <div class="col-xs-2">
                <input type="text" id="colorView" name="colorView" value="" style="width: 100px;">
                
              </div>
            </div>
          </div>
        </div>
      
      <div class="modal-footer">
        <div class="row">
          <div class="col-xs-2 col-xs-offset-4">
            <button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">생성</button>
          </div>
          <div class="col-xs-2">
            <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
          </div>
        </div>
      </div>

      </form>

    </div>
  </div>
</div>



