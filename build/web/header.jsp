
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
                                <a href="logout.jsp" class="btn btn-light text-dark pe-5"><i class="fas fa-sign-out-alt me-3"></i>Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</nav>