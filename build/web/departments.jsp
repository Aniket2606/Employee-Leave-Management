<%@ page import="java.sql.*" %>


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

                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="mt-4 mx-3 fs-5"><b>Manage Departments</b></h6>
                    <a href="addDepartment.jsp" class="btn btn-sm btn-success mt-2 me-3 btn-scale" data-bs-toggle="modal" data-bs-target="#departmentModal">  <!--Modal at end of page -->
                        <i class="fas fa-plus me-2"></i>Add Department</a>
                </div>
                
                <div class="row pt-3 mx-2 mb-5 border-top border-success border-3">
                    <div class="col-md-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">S No.</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Dep code</th>
                                    <th scope="col">Creation Date</th>
                                    <th scope="col">Action</th>

                                </tr>
                            </thead>
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

                                       
                                    String sql = "SELECT * FROM departments ORDER BY sno";

                                    
                                    pstmt = conn.prepareStatement(sql);
 
                                     
                                    rs = pstmt.executeQuery();

                                   
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString("sno") %></td>
                                    <td><%= rs.getString("name") %></td>
                                    <td><%= rs.getString("code") %></td>
                                    <td><%= rs.getString("creation_date") %></td>
                                    <td>            
                                        <a href="edit_employee.jsp?sno=<%= rs.getString("sno") %>" class="btn btn-sm btn-primary me-2">Edit</a>
                                        <a href="deleteDep.jsp?sno=<%= rs.getString("sno") %>" class="btn btn-sm btn-danger">Delete</a>
                                    </td>

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

             <%@ include file="addDepartment.jsp" %>

            </main>

        </div>
    </div>

    <!--All scripts-->
    <%@include file="scripts.jsp" %>
</body>
</html>
