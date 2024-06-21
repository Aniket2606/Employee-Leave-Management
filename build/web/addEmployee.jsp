<%@ page import="java.sql.*" %>       
<div class="container-fluid">
            <div class="d-flex justify-content-center align-items-center mt-4">

                <!--modal-->
                <div class="modal fade" id="employeeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Input fields -->
                                <form id="myForm" action="addEmployee.jsp" method="post">

                                    <div class="mb-3 row">
                                        <label for="empCode" class="col-sm-4 col-form-label"><b>Employee Code</b></label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="empCode" name="empCode" required>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="userName" class="col-sm-4 col-form-label"><b>User Name</b></label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="userName" name="userName" required>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3 row">
                                        <label for="fullName" class="col-sm-4 col-form-label"><b>Full Name</b></label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="email" class="col-sm-4 col-form-label"><b>Email Id</b></label>
                                        <div class="col-sm-8">
                                            <input type="email" class="form-control" id="email" name="email" required>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="gender" class="col-sm-4 col-form-label"><b>Gender</b></label>
                                        <div class="col-sm-8">
                                            <select class="form-select" id="gender" name="gender" required>
                                                <option value="">Select Gender</option>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="dob" class="col-sm-4 col-form-label"><b>Date of Birth</b></label>
                                        <div class="col-sm-8">
                                            <input type="date" class="form-control" id="dob" name="dob" required>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="department" class="col-sm-4 col-form-label"><b>Gender</b></label>
                                        <div class="col-sm-8">
                                            <select class="form-select" id="department" name="department" required>
                                                <option value="">Select Department</option>
                                                <option value="CS">Computers</option>
                                                <option value="AC">Accounts</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="mobile" class="col-sm-4 col-form-label"><b>Mobile Number</b></label>
                                        <div class="col-sm-8">
                                            <input type="tel" class="form-control" id="mobile" name="mobile" required>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="password" class="col-sm-4 col-form-label"><b>Password</b></label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="password" name="password" required>
                                        </div>
                                    </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Add Employee</button>
                            </div>
                        </div>
                    </div>     
                </div>

            </div>

         <%

       if (request.getMethod().equalsIgnoreCase("post")) {
        String empCode = request.getParameter("empCode");
        String username = request.getParameter("userName");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String department = request.getParameter("department");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

       
        String dbUrl1 = "jdbc:mysql://localhost:3306/employeeLMS";
        String dbUsername1 = "root";
        String dbPassword1 = "rootAniket@";

        
        Connection conn1 = null;
        PreparedStatement pstmt1 = null;

        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            conn1 = DriverManager.getConnection(dbUrl1, dbUsername1, dbPassword1);

            
            String sql1 = "INSERT INTO employee (Employee_Code, Full_Name, Email_Id, gender, DOB, Department, Mobile_Number, password, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt1= conn1.prepareStatement(sql1);

           
            pstmt1.setString(1, empCode);
            pstmt1.setString(2, fullName);
            pstmt1.setString(3, email);
            pstmt1.setString(4, gender);
            pstmt1.setString(5, dob);
            pstmt1.setString(6, department);
            pstmt1.setString(7, mobile);
            pstmt1.setString(8, password);
            pstmt1.setString(9, username);

            int rowsAffected = pstmt1.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("employee.jsp");
             } else {
                out.println("<p>Error: Failed to add employee.</p>");
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
        </div>
      