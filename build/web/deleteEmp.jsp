<%@ page import="java.sql.*" %>

<%
        
        String dbUrl1 = "jdbc:mysql://localhost:3306/employeeLMS";
        String dbUsername1 = "root";
        String dbPassword1 = "rootAniket@";

 
        Connection conn1 = null;
        PreparedStatement pstmt1 = null;

        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");

           
            conn1 = DriverManager.getConnection(dbUrl1, dbUsername1, dbPassword1);

            
            String sql1 = "DELETE FROM employee WHERE sno=?";
            pstmt1= conn1.prepareStatement(sql1);

           
           pstmt1.setInt(1, Integer.parseInt(request.getParameter("sno")));  //from url
         
            int rowsAffected = pstmt1.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("employee.jsp");
             } else {
                out.println("<p>Error: Failed to delete employee.</p>");
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
            
            %>