<%@ page contentType="text/html; charset=utf-8" %>

 <!-- Navigation -->
            <nav class="navbar-default sidebar" role="navigation" style="background-color: #354555">
                <div class="sidebar-nav navbar-collapse">
                    <a href="/main"><img src="/resources/images/logo.png" style="width:250px"></a>
                    <img src="/resources/images/loginInfo.PNG" style="width:250px">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/project/dashBoard"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                        </li>
                        <li>
                            <a href="/scrum/taskBoard"><i class="fa fa-table fa-fw"></i>Scrum<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/scrum/taskBoard">Category</a>
                                </li>
                                <li>
                                    <a href="/scrum/taskBoard">Task Board</a>
                                </li>
                                <li>
                                    <a href="/scrum/releasePlanning">Release Planning</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/gantt/ganttChart"><i class="fa fa-bar-chart-o fa-fw"></i>Gantt Chart</a>
                        </li>
                        <li>
                            <a href="/project/library"><i class="fa fa-edit fa-fw"></i>Library</a>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>Member</a>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>메일보내는버튼</a>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>로그아웃</a>
                        </li>
                    </ul>
                    <img src="/resources/images/realtime.PNG" style="width:250px" onclick="popupOpen()">
                    <script type="text/javascript">
                      /*채팅창 팝업*/
                      function popupOpen(){
                      
                        var popUrl = "/chatting"; //팝업창에 출력될 페이지 URL
                      
                        var popOption = "width=750, height=400, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
                      
                          window.open(popUrl,"",popOption);
                      
                        }
                    </script>
                    <img src="/resources/images/contact.PNG" style="width:250px">
                </div>
                <!-- /.sidebar-collapse -->
            </nav>
            <!-- /.navbar-static-side -->
