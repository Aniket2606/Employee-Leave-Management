<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="adminTop.jsp" %>
    <body>
        <div class="container-fluid">

            <div class="row">
                <!-- Sidebar -->
                <%@ include file="asidebar.jsp" %>


                <!-- Main Content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
                    <!--Including header Employee Management form header file-->
                    <%@ include file="header.jsp" %>

                    <h6 class="mt-4 mx-3 fs-5"><b>View Leave Details</b></h6>
                    <div class="row pt-3 mx-2 mb-5 border-top border-success border-3">

                        <table class="table">

                            <tbody>
                                <% 
                                
                                String dbUrl = "jdbc:mysql://localhost:3306/employeeLMS";
                                String dbUsername = "root";
                                String dbPassword = "rootAniket@";

                                Connection conn = null;
                                PreparedStatement pstmt = null;
                                ResultSet rs = null;

                                try {
                                
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

                                    // SQL query to fetch details based on sno
                                  String sql = "SELECT employee.*, leaves.* " +
                                  "FROM employee " +
                                  "INNER JOIN leaves ON employee.Employee_Code = leaves.Employee_Code " +
                                  "WHERE leaves.sno = ?";

                                    pstmt = conn.prepareStatement(sql);
                                    pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));  //from url
                                    rs = pstmt.executeQuery();

                                   
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<th>Employee Name</th>");
                                        out.println("<td>" + rs.getString("Full_Name") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Employee ID</th>");
                                        out.println("<td>" + rs.getString("Employee_Code") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Gender</th>");
                                        out.println("<td>" + rs.getString("gender") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Contact No.</th>");
                                        out.println("<td>" + rs.getString("mobile_Number") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Leave Type</th>");
                                        out.println("<td>" + rs.getString("leave_type") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Leave Duration</th>");
                                        out.println("<td>" + rs.getString("From_Date") + " to  " + rs.getString("To_Date")+"</td>");
                                        out.println("</tr>");
                                        out.println("<tr>");
                                        out.println("<th>Applied Date</th>");
                                        out.println("<td>" + rs.getString("Applied_Date") + "</td>");
                                        out.println("</tr>");
                                        
                                        out.println("<tr>");
                                        out.println("<th>Description</th>");
                                        out.println("<td>" + rs.getString("description") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr class='table-light'>");
                                        out.println("<th>Leave Status</th>");
                                        out.println("<td>" + rs.getString("leaves.Status") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr class='table-light'>");
                                        out.println("<th>Admin Remark</th>");
                                        out.println("<td>" + rs.getString("Admin_Remark") + "</td>");
                                        out.println("</tr>");
                                        out.println("<tr class='table-light'>");
                                        out.println("<th>Admin Action</th>");
                                        out.println("<td>" + rs.getString("admin_action") + "</td>");
                                        out.println("</tr>");
                                        
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
                        <div class="text-center mt-4">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#takeActionModal">Take Action</button>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="takeActionModal" tabindex="-1" aria-labelledby="insertDataModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="insertDataModalLabel">Take Action</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="viewDetails.jsp" method="post">
                                            <!--For getting id from url-->
                                            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                            <div class="mb-3">
                                                <label for="status" class="form-label">Status</label>
                                                <select class="form-select" id="status" name="status" required>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Approved">Approved</option>
                                                    <option value="Not Approved">Not Approved</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="remarks" class="form-label">Remarks</label>
                                                <input type="text" class="form-control" id="remarks" name="remarks" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%

if (request.getMethod().equalsIgnoreCase("post")) {
    String status = request.getParameter("status");
    String remarks = request.getParameter("remarks");
    
   // Get the value of sno from the request parameter
    String id = request.getParameter("id");

    int sno = Integer.parseInt(id);

   
    String dbUrl1 = "jdbc:mysql://localhost:3306/employeeLMS";
    String dbUsername1 = "root";
    String dbPassword1 = "rootAniket@";

 
    Connection conn1 = null;
    PreparedStatement pstmt1 = null;

    try {
     
        Class.forName("com.mysql.cj.jdbc.Driver");

        
        conn1 = DriverManager.getConnection(dbUrl1, dbUsername1, dbPassword1);

       
        String sql1 = "UPDATE leaves SET Status = ?, Admin_Remark = ?, admin_action = NOW() WHERE sno = ?";
           
       
        pstmt1 = conn1.prepareStatement(sql1);

      
        pstmt1.setString(1, status);
        pstmt1.setString(2, remarks);
        pstmt1.setInt(3, sno);

        int rowsAffected = pstmt1.executeUpdate();
   
        if (rowsAffected > 0) {
            response.sendRedirect("viewDetails.jsp?id=" + sno);
            out.println("<p class='text-success'>Leave request updated successfully.</p>");
        } else {
            out.println("<p class='text-danger'>Failed to update leave request. Please try again later.</p>");
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p class='text-danger'>Error occurred. Please try again later.</p>");
    } finally {
       
        if (pstmt1 != null) {
            try { pstmt1.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (conn1 != null) {
            try { conn1.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
                        %>

                </main>

            </div>
        </div>

         <!--All scripts-->
    <%@include file="scripts.jsp" %>
    </body>
</html>
