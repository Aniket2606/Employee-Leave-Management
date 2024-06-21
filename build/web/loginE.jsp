<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%--<%@ page import="javax.servlet.http.*" %>--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Additional Custom CSS */
            body {
                background: url('Assets/bk.jpg') no-repeat center center fixed;
                background-size: cover;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .login-form {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
            }
            .img{
                height:200px;
                width:200px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="login-form">
                        <form action="loginE.jsp" method="post">
                            <!-- Logo Image -->
                            <div class="text-center">
                                <img src="Assets/logo.png" alt="Logo" class="img">
                            </div>
                            <h4 class="text-center mb-4"><b>Employee Login</b></h4>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                            </div>
                            <div class="form-group mb-4">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
                        <%
                            // Check if form is submitted
                            if (request.getMethod().equalsIgnoreCase("post")) {
                                String username = request.getParameter("username");
                                String password = request.getParameter("password");

                              
                                String dbUrl = "jdbc:mysql://localhost:3306/employeeLMS";
                                String dbUsername = "root";
                                String dbPassword = "rootAniket@";

                               
                                Connection conn = null;
                                PreparedStatement pstmt = null;
                                ResultSet rs = null;

                                try {
                                   
                                    Class.forName("com.mysql.cj.jdbc.Driver");

                                   
                                    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

                                    
                                    String query = "SELECT * FROM employee WHERE username = ? AND password = ?";
                                    pstmt = conn.prepareStatement(query);
                                    pstmt.setString(1, username);
                                    pstmt.setString(2, password);

                                   
                                    rs = pstmt.executeQuery();

                                    
                                    if (rs.next()) {
                                        
                                         String employeeName = rs.getString("username");
                                         String employeeID = rs.getString("Employee_Code");
                                         session.setAttribute("username", employeeName);
                                         session.setAttribute("empid", employeeID);
                                         
                                         response.sendRedirect("edashboard.jsp");
                                    } else {
                                    
                                        out.println("<p class='text-danger text-center mt-2'>Invalid username or password!</p>");
                                    }
                                } catch (ClassNotFoundException | SQLException e) {
                                    e.printStackTrace();
                                    out.println("<p class='text-danger'>Error occurred. Please try again later.</p>");
                                } finally {
                                   
                                    if (rs != null) {
                                        try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    }
                                    if (pstmt != null) {
                                        try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    }
                                    if (conn != null) {
                                        try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    }
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
