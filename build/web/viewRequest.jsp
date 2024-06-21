<%@ page import="java.sql.*" %>
<%--<%@ page import="javax.servlet.http.*" %>--%>


<%@ include file="employeeTop.jsp" %>

    <body>
        <div class="container-fluid">
            <!--include employee dashboard & navigation <main> tag error-->
            <%@ include file="eheader.jsp" %>

            <!--toast conatiner-->
            <div class="toast fade" id="successToast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true"  style="position: absolute; top: 10px; right: 6px;">
                <div class="toast-header bg-success text-white">
                    <i class="fas fa-check-circle me-2"></i>
                    <strong class="me-auto">Success!</strong>
                </div>
                <div class="toast-body">
                    Leave requested successfully.
                </div>
            </div>

            <h6 class="mx-3 mt-5 fs-5"><b>View Leave Requests</b></h6>
            <div class="row pt-3 mx-2 border-top border-success border-3">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">L No.</th>
                                <th scope="col">Leave Type</th>
                                <th scope="col">From Date</th>
                                <th scope="col">To Date</th>
                                <th scope="col">Description</th>
                                <th scope="col">Applied Date</th>
                                <th scope="col">Admin Remark</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%

 String dbUrl = "jdbc:mysql://localhost:3306/employeeLMS";
 String dbUsername = "root";
 String dbPassword = "rootAniket@";
 String employeeName = (String) session.getAttribute("username");


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
  
    Class.forName("com.mysql.jdbc.Driver");

   
    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

   
    String sql = "SELECT * FROM leaves WHERE EmpName = ? ORDER BY sno DESC LIMIT 10";

 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, employeeName);
    
    rs = pstmt.executeQuery();

    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("sno") %></td>
                                <td><%= rs.getString("Leave_Type") %></td>
                                <td><%= rs.getString("From_Date") %></td>
                                <td><%= rs.getString("To_Date") %></td>
                                <td><%= rs.getString("Description") %></td>
                                <td><%= rs.getString("Applied_Date") %></td>
                                <td><%= rs.getString("Admin_Remark") %></td>
                                <td><%= rs.getString("Status") %></td>

                            </tr>
                            <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                        
                                try {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>

        </main>

    </div>

   <!--All scripts-->
    <%@include file="scripts.jsp" %>
</body>
</html>
