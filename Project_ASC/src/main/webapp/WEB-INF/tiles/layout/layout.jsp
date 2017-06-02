<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ASC</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="/resources/css/bootstrap.vertical-tabs.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css/metisMenu.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="/resources/css/morris.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="/resources/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Main CSS -->
<!--     <link href="/resources/css/main.css" rel="stylesheet"> -->
<!--     <link href="/resources/css/reset.css" rel="stylesheet"> -->
    <!-- Custom Fonts -->
    <link href="/resources/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Gantt Chart CSS -->
    <link href="/resources/css/gantt/gantt.css" rel="stylesheet" type="text/css">
    <!-- Calendar CSS -->
    <link href="/resources/css/dashBoard/pignose.calendar.css" rel="stylesheet">
    <!-- SweetAlert CSS -->
    <link href="/resources/css/sweetalert2.min.css" rel="stylesheet">
    
      <!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/metisMenu.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="/resources/js/raphael.js"></script>
    <%-- <script src="/resources/js/morris.js"></script>
    <script src="/resources/js/morris-data.js"></script> --%>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>
    <!-- Gantt Chart JavaScript -->
    <script src="/resources/js/gantt/jquery.fn.gantt.js"></script>
    <!-- Calendar JavaScript -->
    <script src="/resources/js/dashBoard/moment.min.js"></script>
    <script src="/resources/js/dashBoard/pignose.calendar.js"></script>
    <!-- SweetAlert JavaScript -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    <script src="/resources/js/bootstrap-datetimepicker.js"></script>
    <script src="/resources/js/bootstrap-datetimepicker.ko.js"></script>
  
</head>
<body>
<div id="wrapper">
   <div id="header">
      <tiles:insertAttribute name="header" />
   </div>
   <div id="content">
      <tiles:insertAttribute name="content" />
   </div>
   <div id="footer">
      <tiles:insertAttribute name="footer" />
   </div>
</div>
</body>

</html>
