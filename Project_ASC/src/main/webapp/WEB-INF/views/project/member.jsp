<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.col-xs-12 {
	margin-top: 25px;
	border-bottom: 1px solid #eee;
	padding-bottom: 18px
}

.profile {width:70px; height:70px; border-radius:70px; margin:0 auto; margin-left: 70%; float: left; overflow:hidden;}
.profile img {height:70px; width:70px;}

.name {
	font-size: 20px
}
</style>

<div id="page-wrapper">
	<br> <br>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<img alt="" src="/resources/images/header/member.png" style="margin-left: auto; margin-right: auto; display: block; width: 20%">
			</div>
         <c:forEach items="${map}" var="projectList" varStatus="status">
			<div class="form-group">
				<div class="col-xs-12 col-sm-12 ">
					<div class="col-xs-2 col-sm-2">
						<div class="profile"><img src="/resources/images/upload/${map[status.index].get(3)}"></div>
					</div> 
					<div class="col-xs-3 col-sm-3 ">
						<p class="name">${map[status.index].get(1)}</p>
						<p>${map[status.index].get(2)} / ${map[status.index].get(0)}</p>
						<p>${map[status.index].get(4)}</p>
					</div>
					<div class="col-xs-1 col-sm-1 ">
						<br>
						<h5>${map[status.index].get(5)}</h5>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
         </c:forEach>
		</div>
	</div>
</div>