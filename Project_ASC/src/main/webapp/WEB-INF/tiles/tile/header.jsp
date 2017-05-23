<%@ page contentType="text/html; charset=utf-8" %>

 <!-- Navigation -->
            <nav class="navbar-default sidebar" role="navigation" style="background-color: #354555">
                <div class="sidebar-nav navbar-collapse">
                    <img src="${pageContext.servletContext.contextPath}/resources/images/logo.png" style="width:250px">
                    <img src="${pageContext.servletContext.contextPath}/resources/images/loginInfo.PNG" style="width:250px">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>Scrum<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Category</a>
                                </li>
                                <li>
                                    <a href="#">Task Board</a>
                                </li>
                                <li>
                                    <a href="#">Release Planning</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-bar-chart-o fa-fw"></i>Gantt Chart</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i>Library</a>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>Member</a>
                        </li>
                    </ul>
                    <img src="${pageContext.servletContext.contextPath}/resources/images/realtime.PNG" style="width:250px">
                    <img src="${pageContext.servletContext.contextPath}/resources/images/contact.PNG" style="width:250px">
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
