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

                    <%
                                    
                                     String dbUrl = "jdbc:mysql://localhost:3306/employeeLMS";
                                     String dbUsername = "root";
                                     String dbPassword = "rootAniket@";

                                    
                                    Connection conn = null;
                                    
                                    Statement stmt = null;
                                    PreparedStatement pstmt = null;
                                    
                                    ResultSet rs1 = null;
                                    ResultSet rs2 = null;
                                    ResultSet rs3 = null;
                                    ResultSet rs = null;
 
                                   
                                    try {
                                        
                                       Class.forName("com.mysql.cj.jdbc.Driver");

                                       
                                        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
      
                    %>

                    <h6 class="mx-3 mt-4 fs-5"><b>All Leave History</b></h6>
                    <div class="row pt-3 mx-2 border-top border-success border-3">
                        <div class="col-md-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">L No.</th>
                                        <th scope="col">Employee Name</th>
                                        <th scope="col">Leave Type</th>
                                        <th scope="col">Applied Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                                                      
                                                                         String sql = "SELECT * FROM leaves ORDER BY sno";
                                                                         pstmt = conn.prepareStatement(sql);
 
                                                                         rs = pstmt.executeQuery();
 
                                                                         while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%= rs.getString("sno") %></td>
                                        <td><%= rs.getString("EmpName") %></td>
                                        <td><%= rs.getString("Leave_Type") %></td>
                                        <td><%= rs.getString("Applied_Date") %></td>
                                        <td><%= rs.getString("Status") %></td>
                                        <td>
                                            <a href="viewDetails.jsp?id=<%= rs.getString("sno") %>" class="btn btn-primary btn-sm">View Details</a>
                                        </td>


                                    </tr>
                                    <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                       
                                        try {
                                            if (rs1 != null) rs1.close();
                                            if (rs2 != null) rs2.close();
                                            if (rs3 != null) rs3.close();
                                            if (rs != null) rs.close();
                                            if (stmt != null) stmt.close();
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
        </div>

         <!--All scripts-->
    <%@include file="scripts.jsp" %>
    </body>
</html>
