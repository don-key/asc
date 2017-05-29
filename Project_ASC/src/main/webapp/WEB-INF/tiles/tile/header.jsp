<%@ page contentType="text/html; charset=utf-8" %>

 <!-- Navigation -->
            <nav class="navbar-default sidebar" role="navigation" style="background-color: #354555">
                <div class="sidebar-nav navbar-collapse">
                    <a href="/"><img src="/resources/images/logo.png" style="width:250px"></a>
                    <a data-toggle="modal" data-target="#modifyModal"><img src="/resources/images/loginInfo.PNG" style="width:250px"></a>
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/project/dashBoard"><img src="/resources/images/menu/dashboard.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/scrum/taskBoard"><img src="/resources/images/menu/scrum.png" style="width: 50%"><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/scrum/taskBoard"><img src="/resources/images/menu/task.png" style="width: 60%"></a>
                                </li>
                                <li>
                                   	<a href="/scrum/releasePlanning"><img src="/resources/images/menu/release.png" style="width: 70%"></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/gantt/ganttChart"><img src="/resources/images/menu/gantt.png" style="width: 50%"></a>
                        </li>
                        <li>
                            <a href="/project/library"><img src="/resources/images/menu/library.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="/project/member"><img src="/resources/images/menu/member.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="#"><img src="/resources/images/menu/log.png" style="width: 50%"></a>
                        </li>
                         <li>
                            <a href="/"><img src="/resources/images/menu/logout.png" style="width: 50%"></a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
            
  <!-- Modal -->
  <jsp:include page="modifyModal.jsp" />