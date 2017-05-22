<%@ page contentType="text/html; charset=utf-8" %>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


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
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/metisMenu.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/font-awesome.css" rel="stylesheet" type="text/css">
  
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
  <!-- jQuery -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/metisMenu.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/raphael.js"></script>
    <%-- <script src="${pageContext.servletContext.contextPath}/resources/js/morris.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/morris-data.js"></script> --%>
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/sb-admin-2.js"></script>
</html>
