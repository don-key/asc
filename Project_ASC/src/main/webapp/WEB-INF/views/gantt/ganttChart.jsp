<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>


<style>

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
</style>


<div id="page-wrapper">
  <div class="row">
    <div class="text-center">
      <h1 class="page-header">Gantt Chart</h1>
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
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능긴거한번써보겠슴다</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
        <tr>
          <th style="padding-right: 5%">기능1</th>
        </tr>
      </table>

      <div id="right_div">
        <table id="inner_table">
          <tr>
            <th class="text-center" style="width: 50px">5/29</th>
            <th class="text-center" style="width: 50px">30</th>
            <th class="text-center" style="width: 50px">31</th>
            <th class="text-center" style="width: 50px">6/1</th>
            <th class="text-center" style="width: 50px">2</th>
            <th class="text-center" style="width: 50px">3</th>
            <th class="text-center" style="width: 50px">4</th>
            <th class="text-center" style="width: 50px">5</th>
            <th class="text-center" style="width: 50px">6</th>
            <th class="text-center" style="width: 50px">7</th>
            <th class="text-center" style="width: 50px">8</th>
            <th class="text-center" style="width: 50px">9</th>
            <th class="text-center" style="width: 50px">10</th>
            <th class="text-center" style="width: 50px">11</th>
            <th class="text-center" style="width: 50px">12</th>
            <th class="text-center" style="width: 50px">13</th>
            <th class="text-center" style="width: 50px">14</th>
            <th class="text-center" style="width: 50px">15</th>
            <th class="text-center" style="width: 50px">16</th>
            <th class="text-center" style="width: 50px">17</th>
            <th class="text-center" style="width: 50px">18</th>
            <th class="text-center" style="width: 50px">19</th>
            <th class="text-center" style="width: 50px">20</th>
            <th class="text-center" style="width: 50px">21</th>
            <th class="text-center" style="width: 50px">22</th>
            <th class="text-center" style="width: 50px">23</th>
            <th class="text-center" style="width: 50px">24</th>
            <th class="text-center" style="width: 50px">25</th>
            <th class="text-center" style="width: 50px">26</th>
            <th class="text-center" style="width: 50px">27</th>
            <th class="text-center" style="width: 50px">28</th>
            <th class="text-center" style="width: 50px">29</th>
            <th class="text-center" style="width: 50px">30</th>
            <th class="text-center" style="width: 50px">7/1</th>
            <th class="text-center" style="width: 50px">2</th>
            <th class="text-center" style="width: 50px">3</th>
          </tr>
          <tr>
            <td style="background-color: rgb(42, 128, 185)">&nbsp;</td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
            <td style="background-color: rgb(42, 128, 185)"></td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(231, 126, 35)">&nbsp;</td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
            <td style="background-color: rgb(231, 126, 35)"></td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
            <td style="background-color: rgb(22, 160, 134)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
            <td style="background-color: rgb(130, 160, 200)">&nbsp;</td>
          </tr>

          <tr>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
            <td style="background-color: rgb(237, 160, 139)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
            <td style="background-color: rgb(240, 247, 103)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
            <td style="background-color: rgb(153, 62, 163)">&nbsp;</td>
          </tr>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
            <td style="background-color: rgb(72, 61, 162)">&nbsp;</td>
          </tr>
          



        </table>
      </div>
    </div>
  </div>
  <br>
  <div class="bottomPanel text-center">
    <a class="btn btn-danger" data-toggle="modal" data-target="#registGanttChartModal">추가</a>
  </div>
</div>


<!-- Modal -->
<jsp:include page="include/registGanttChartModal.jsp" />
<jsp:include page="include/modifyGanttChartModal.jsp" />

<script>
	$(function() {


		$('#actionChartBtn').on('click', function() {
			location.href = "currentChart";
		});

		$('.dataPanel').on('click', function() {
			$('#modifyGanttChartModal').modal();
		});
	});
</script>

