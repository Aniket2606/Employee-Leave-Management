<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        // Retrieve employee name from session
        String username = (String)session.getAttribute("username");
        
                 if (username == null) {
%>
        <script>
            alert("Your session has expired. Please log in again.");
            window.location.href = "index.jsp";
        </script>
<%
    }
%>

<div class="row">
    <!-- Sidebar -->
    <nav class="col-md-2 d-none d-md-block bg-dark sidebar">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">
                <li class="nav-item border-bottom mb-2 border-2">
                    <div class="nav-link text-center my-2 pb-2" >
                        <b class="text-white fs-6">Company Employee </b>
                    </div>
                </li>
                <li class="nav-item border-bottom mb-2 border-2">
                    <div class="nav-link text-center my-1 pb-2" >
                        <b class="text-white fs-5"><%= username %></b>
                    </div>
                </li>
                <li class="nav-item mb-1">
                    <a class="nav-link text-white" href="edashboard.jsp"><i class="fas fa-tachometer-alt"></i><span class="ms-2">My profile</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="viewRequest.jsp"><i class="fas fa-building"></i><span class="ms-2"> View Requests</span></a>
                </li>
            </ul>
        </div>
    </nav>


    <!-- Main Content -->
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
        <!--Including header Employee Management form header file-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light ">
            <div class="container bg-white py-2">

                <div class="text-center w-100">
                    <span class="navbar-text text-dark fs-5"><b>EMPLOYEE LEAVE MANAGEMENT SYSTEM</b></span>
                </div>
                <div class="notification-buttons d-flex">

                    <!--#fsb for making full screen button-->
                    <button class="btn btn-primary me-2" id="fsb">
                        <i class="fas fa-expand"></i>
                    </button>

                    <!--Button popover for logout-->
                     <button class="btn btn-secondary" id="popover-btn">
                <i class="fas fa-bell"></i>
            </button>
            <div id="popover-content" style="display: none;">
                <div class="container">
                    <div class="row">
                        <div class="col text-center mb-2">
                            <span class="text-muted small">Accounts</span>
                        </div>
                    </div>
                    <div class="row border-top">
                        <div class="col">
                            <div class="d-flex mt-2 mb-2">
                                <a href="#" class="btn btn-light text-dark"><i class="fas fa-key me-3"></i>Change Password</a>
                            </div>
                        </div>
                    </div>
                    <div class="row border-top">
                        <div class="col">
                            <div class="d-flex mt-1">
                                <a href="logout.jsp" class="btn btn-light text-dark"><i class="fas fa-sign-out-alt me-3"></i>Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                </div>
            </div>
        </nav>


        <h6 class="mt-4 mx-2 ps-2 pb-2 border-bottom border-success border-3 fs-5"><b>Welcome <%= username %> ! </b></h6>
