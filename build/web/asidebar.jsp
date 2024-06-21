<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String admin = (String)session.getAttribute("admin");
        if (admin == null) {
%>
        <script>
            alert("Your session has expired. Please log in again.");
            window.location.href = "index.jsp";
        </script>
<%
    }
%>

<nav class="col-md-2 d-none d-md-block bg-dark sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item border-bottom mb-1 border-2">
                                <div class="nav-link text-center my-2 pb-2" >
                                    <b class="text-white fs-6">Administrator</b>
                                </div>
                            </li>
                            <li class="nav-item border-bottom mb-2 border-2">
                                <div class="nav-link pt-2 pb-1" >
                                    <img src="Assets/admin.png" width="46" height="46" class="mx-2">
                                    <b class="text-white fs-5"><%= admin %></b>
                                </div>
                            </li>
                            
                            
                            <li class="nav-item">
                                <a class="nav-link text-white" href="adashboard.jsp"><i class="fas fa-tachometer-alt"></i><span class="ms-1"> Dashboard</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="departments.jsp"><i class="fas fa-building"></i><span class="ms-2"> Departments</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="employee.jsp"><i class="fas fa-users "></i><span class="ms-2">Employees</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <button type="button" class="nav-link text-white dropdown-toggle" id="leavesOption" data-bs-toggle="dropdown">
                                    <span><i class="fas fa-calendar-alt"></i></span>
                                    <span class="ms-2">Manage Leaves</span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="leavesOption">
                                    <li><a class="dropdown-item" href="allLeave.jsp">All Leave</a></li>
                                    <li><a class="dropdown-item" href="pendingLeaves.jsp">Pending Leave</a></li>
                                    <li><a class="dropdown-item" href="approvedLeaves.jsp">Approved Leave</a></li>
                                    <li><a class="dropdown-item" href="Rejectedleaves.jsp">Not Approved Leave</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>