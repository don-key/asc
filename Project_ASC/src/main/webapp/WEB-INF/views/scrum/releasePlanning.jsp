<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="${pageContext.servletContext.contextPath}/resources/css/scrum/scrum2.css" rel="stylesheet">



<div id="page-wrapper">
  <div class="row">
    <div class="col-lg-12">
      <div class="page-header" id="taskBoardBtn">
        <a class="btn btn-default" data-toggle="modal" data-target="#categoryModal"> Category </a> <a
          href="/scrum/taskBoard" class="btn btn-default"> Task Board </a> <a
          href="/scrum/releasePlanning" class="btn btn-default active"> Release Planning </a>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->

  <div style="display: flex; overflow-x: auto; overflow-y:hidden; white-space: nowrap; padding-bottom: 10%;">

    <table>
      <tr>
        <th>카드1</th>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리1</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리2</td>
      </tr>
      <tr>
        <td class="pokerToDo"><a data-toggle="modal" data-target="#planningPokerModal">유저스토리3</a></td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드2</th>
      </tr>
      <tr>
        <td class="pokerAllDone">유저스토리4</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리5</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드3</th>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리6</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리7</td>
      </tr>
      <tr>
        <td class="pokerAllDone">유저스토리8</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리9</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리10</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리11</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드4</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리10</td>
      </tr>
      <tr>
        <td class="pokerAllDone">유저스토리11</td>
      </tr>
      <tr>
        <td class="pokerDone">유저스토리12</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드5</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리8</td>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리9</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드6</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리6</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드7</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리6</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드8</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리6</td>
      </tr>
    </table>

    <table>
      <tr>
        <th>카드9</th>
      </tr>
      <tr>
        <td class="pokerToDo">유저스토리6</td>
      </tr>
    </table>

  </div>
</div>

<!-- /#page-wrapper -->

<!-- Modal -->
  <jsp:include page="include/categoryModal.jsp" />
  <jsp:include page="include/planningPokerModal.jsp" />

