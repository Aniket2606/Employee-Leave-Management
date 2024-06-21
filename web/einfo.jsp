<div class="row pt-3 mx-2 border-top border-success border-3">
    <div class="col-md-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Employee Code</th>
                    <th scope="col">Full Name</th>
                    <th scope="col">Department</th>
                    <th scope="col">Email Id</th>
                    <th scope="col">Mobile Number</th>
                    <th scope="col">DOB</th>
                    <th scope="col">Action</th>
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


String sql = "SELECT * FROM employee WHERE username = ?";


pstmt = conn.prepareStatement(sql);
pstmt.setString(1, employeeName);

rs = pstmt.executeQuery();


while (rs.next()) {
                %>
                <tr> 
                    <td><%= rs.getString("Employee_Code") %></td>
                    <td><%= rs.getString("Full_Name") %></td>
                    <td><%= rs.getString("Department") %></td>
                    <td><%= rs.getString("Email_Id") %></td>
                    <td><%= rs.getString("Mobile_Number") %></td>
                    <td><%= rs.getString("DOB") %></td> 
                    <td class="p-2"> <div class="row">
                            <div class="col-md-auto">
                                <a class="btn btn-primary btn-sm" href="#">Edit</a>
                            </div>
                        </div>
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
</div>