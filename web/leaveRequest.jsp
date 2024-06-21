<%@ page import="java.sql.*" %>
<%@ include file="employeeTop.jsp" %>

<body>
    <div class="container-fluid">
        <div class="d-flex justify-content-center align-items-center mt-4">
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Leave Request</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Input fields -->
                            <form id="myForm" action="leaveRequest.jsp" method="post" onsubmit="return validateForm()">
                                <div class="mb-3 row">
                                    <label for="leaveType" class="col-sm-4 col-form-label"><b>Leave Type</b></label>
                                    <div class="col-sm-8">
                                        <select class="form-select" id="leaveType" name="leaveType" required>
                                            <option value="Medical Leave">Medical Leave</option>
                                            <option value="Vacation Leave">Vacation Leave</option>
                                            <option value="Personal Leave">Personal Leave</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="fromDate" class="col-sm-4 col-form-label"><b>From Date</b></label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" id="fromDate" name="fromDate" required>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="toDate" class="col-sm-4 col-form-label"><b>To Date</b></label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" id="toDate" name="toDate" required>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="description" class="col-sm-4 col-form-label"><b>Description</b></label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Toast container -->
        <div class="toast fade" id="successToast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" style="position: absolute; top: 10px; right: 6px;">
            <div class="toast-header bg-success text-white">
                <i class="fas fa-check-circle me-2"></i>
                <strong class="me-auto">Success!</strong>
            </div>
            <div class="toast-body">
                Leave requested successfully.
            </div>
        </div>

        <!-- Client-side validation script -->
        <script>
            function validateForm() {
                const fromDate = new Date(document.getElementById('fromDate').value);
                const toDate = new Date(document.getElementById('toDate').value);
                const diffTime = Math.abs(toDate - fromDate);
                const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

                if (diffDays > 7) {
                    alert("Leave duration cannot exceed 7 days.");
                    return false;
                }
                return true;
            }
        </script>

        <%
            if ("post".equalsIgnoreCase(request.getMethod())) {
                String leaveType = request.getParameter("leaveType");
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");
                String description = request.getParameter("description");
                String employeeName1 = (String) session.getAttribute("username");
                String employeeID = (String) session.getAttribute("empid");

                // Parse dates to check the duration
                Date fromDateParsed = Date.valueOf(fromDate);
                Date toDateParsed = Date.valueOf(toDate);
                long diff = toDateParsed.getTime() - fromDateParsed.getTime();
                long diffDays = diff / (1000 * 60 * 60 * 24);

                if (diffDays > 7) {
                    out.println("<script>alert('Leave duration cannot exceed 7 days.');</script>");
                } else {
                    String dbUrl1 = "jdbc:mysql://localhost:3306/employeeLMS";
                    String dbUsername1 = "root";
                    String dbPassword1 = "rootAniket@";

                    Connection conn1 = null;
                    PreparedStatement pstmt1 = null;
                    PreparedStatement checkStmt = null;
                    ResultSet rs1 = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn1 = DriverManager.getConnection(dbUrl1, dbUsername1, dbPassword1);

                        // Check if there is an existing leave for the same period
                        String checkSql = "SELECT COUNT(*) FROM leaves WHERE Employee_Code = ? AND ((From_Date BETWEEN ? AND ?) OR (To_Date BETWEEN ? AND ?))";
                        checkStmt = conn1.prepareStatement(checkSql);
                        checkStmt.setString(1, employeeID);
                        checkStmt.setDate(2, fromDateParsed);
                        checkStmt.setDate(3, toDateParsed);
                        checkStmt.setDate(4, fromDateParsed);
                        checkStmt.setDate(5, toDateParsed);
                        rs1 = checkStmt.executeQuery();

                        if (rs1.next() && rs1.getInt(1) > 0) {
        %>
                            <script>
                                window.location.href = 'edashboard.jsp';
                                alert('You have already applied for leave during this period.');
                            </script>
        <%
                        } else {
                            String sql1 = "INSERT INTO leaves (Employee_Code, Leave_Type, From_Date, To_Date, Description, EmpName, Applied_Date) VALUES (?, ?, ?, ?, ?, ?, NOW())";

                            pstmt1 = conn1.prepareStatement(sql1);
                            pstmt1.setString(1, employeeID);
                            pstmt1.setString(2, leaveType);
                            pstmt1.setDate(3, fromDateParsed);
                            pstmt1.setDate(4, toDateParsed);
                            pstmt1.setString(5, description);
                            pstmt1.setString(6, employeeName1);

                            int rowsAffected = pstmt1.executeUpdate();

                            if (rowsAffected > 0) {
        %>
                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        var toast = new bootstrap.Toast(document.getElementById('successToast'));
                                        toast.show();

                                        setTimeout(function () {
                                            window.location.href = 'viewRequest.jsp';
                                        }, 1000);
                                    });
                                </script>
        <%
                            } else {
                                out.println("<script>alert('Failed to submit leave request. Please try again later.');</script>");
                            }
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<script>alert('Error occurred. Please try again later.');</script>");
                    } finally {
                        if (rs1 != null) {
                            try {
                                rs1.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (checkStmt != null) {
                            try {
                                checkStmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (pstmt1 != null) {
                            try {
                                pstmt1.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (conn1 != null) {
                            try {
                                conn1.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        %>
    </div>
    <!-- All scripts -->
    <%@ include file="scripts.jsp" %>
</body>
</html>
