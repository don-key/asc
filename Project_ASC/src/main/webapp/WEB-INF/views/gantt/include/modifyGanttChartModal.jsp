<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal -->
<div class="modal fade" id="modifyGanttChartModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <form action="/gantt/modify" onsubmit="return modifyCheck(this);" method="post">
        <input type="hidden" id="modifyColor" name="modifyColor" value="" style="width: 100px;">
        <input type="hidden" id="modifyListNo" name="modifyListNo" value="" style="width: 100px;">
        <input type="hidden" name="projectListNo" value="${projectListNo}">
        <input type="hidden" name="userNo" value="${userNo}">
        <div class="modal-header" style="background: #354555; color: #ffffff;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-weight: bolder;">간트차트 기능 수정</h4>
        </div>

        <div class="modal-body">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label for="modifyTitle" style="font-size: 20px;">제목</label>
            </div>
            <div class="col-xs-8">
              <input type="text" id="modifyTitle" name="modifyTitle" value="" style="width: 100%;">
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-xs-2 col-xs-offset-1">
              <label for="modifyWorker" style="font-size: 20px;">담당자</label>
            </div>
            <div class="col-xs-8">
              <select id="modifyWorker" name="modifyWorker" style="width: 100%;">
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
              <input type="date" id="modifyStartDate" name="modifyStartDate">
            </div>
            <div class="col-xs-1" style="margin-left: 25px">~</div>
            <div class="col-xs-4">
              <input type="date" id="modifyEndDate" name="modifyEndDate">
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
                <span id="modifyColorpicker"></span>
              </div>
              <div class="col-xs-2">
                <input type="text" id="modifyColorView" name="modifyColorView" value="" style="width: 100px;">

              </div>
            </div>
          </div>
          <br>

        </div>

        <div class="modal-footer">
          <div class="row">
            <div class="col-xs-2 col-xs-offset-3">
              <button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
            </div>
            <div class="col-xs-2">
              <button type="button" id="deleteBtn" onclick="deleteFunction()" class="btn btn-waring" style="width: 100%; font-size: 15px; font-weight: bold;">삭제</button>
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