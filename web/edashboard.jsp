<%@ page import="java.sql.*" %>
<%--<%@ page import="javax.servlet.http.*" %>--%>


<%@ include file="employeeTop.jsp" %>

    <body>
        <div class="container-fluid">
            <!--include employee dashboard & navigation <main> ERR-->
            <%@ include file="eheader.jsp" %>


            <div class="row pt-2 mx-2 mb-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <img src="Assets/apply.png" class="square">
                                </div>
                                <div class="col-md-9">
                                    <p class="card-text mt-1"><b>Make Leave Request</b></p>
                                    <a href="leaveRequest.jsp" class="card-text number btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">Apply</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <img src="Assets/history.png" class="square">
                                </div>
                                <div class="col-md-9">
                                    <p class="card-text mt-1"><b>Request History</b></p>
                                    <a href="viewRequest.jsp" class="card-text number btn btn-primary btn-sm">View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <h6 class="mx-3 pt-1 fs-5"><b>Employee Info</b></h6>
            <!--displaying logged in employee details-->
            <%@ include file="einfo.jsp"%> 

        </main>
        <!--including leave request modal (placement-fixed, acc. to code, DNC)-->
        <%@ include file="leaveRequest.jsp"%>  
    </div>
</div>

 <!--All scripts-->
    <%@include file="scripts.jsp" %>

</body>
</html>
