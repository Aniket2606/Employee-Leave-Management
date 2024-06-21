<%@ page import="java.sql.*" %>       
<div class="container-fluid">
    <div class="d-flex justify-content-center align-items-center mt-4">

        <!--modal-->
        <div class="modal fade" id="departmentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Input fields -->
                        <form id="myForm" action="addDepartment.jsp" method="post">

                            <div class="mb-3 row">
                                <label for="empName" class="col-sm-4 col-form-label"><b>Department Name</b></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="empName" name="depName" required>
                                </div>
                            </div>
                            
                            <div class="mb-3 row">
                                <label for="depCode" class="col-sm-4 col-form-label"><b>Department Code</b></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="depCode" name="depCode" required>
                                </div>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Department</button>
                    </div>
                </div>
            </div>     
        </div>

    </div>
    <%
       if (request.getMethod().equalsIgnoreCase("post")) {
       String name = request.getParameter("depName");
       String code = request.getParameter("depCode");
            
       String url = "jdbc:mysql://localhost:3306/employeeLMS";
       String username = "root";
       String password = "rootAniket@";
       
       Connection conn1 = null;
       PreparedStatement pstmt1 = null;
        
       try {
            
           Class.forName("com.mysql.jdbc.Driver");
           
           conn1 = DriverManager.getConnection(url, username, password);
           
          
           String sql1 = "INSERT INTO departments (name, code) VALUES (?, ?)";
           pstmt1 = conn1.prepareStatement(sql1);
           pstmt1.setString(1, name);
           pstmt1.setString(2, code);
            
           int rowsAffected = pstmt1.executeUpdate();
            
           if (rowsAffected > 0) {
               response.sendRedirect("departments.jsp");
           } else {
               out.println("<p>Failed to add department.</p>");
           }
       } catch (Exception e) {
           out.println("<p>An error occurred: " + e.getMessage() + "</p>");
       } finally {
           if (pstmt1 != null) pstmt1.close();
           if (conn1 != null) conn1.close();
       }
       }
    %>

</div>
