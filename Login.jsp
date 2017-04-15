<%-- 
    Document   : Login
    Created on : 5 Feb, 2016, 10:31:39 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Page</title>
    </head>
    <body>
        <h1>Log In</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="newAccount.jsp">New User SignUp here</a>
        <br><br><br>
        
        <form method="post">
            Email id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name ="EMid"><br><br>
            Password &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="Pass"><br><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="LogIn" >
            </form>
        <a href="ForgotPassword.jsp">Forgot Password</a><br><br><br>
    <br><br>
        <%
        try {
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid!=null)
                response.sendRedirect("Paper.jsp");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
           
            String a=request.getParameter("EMid");
          
            String ps=request.getParameter("Pass");
            String passdb;
            
            String sql="Select * from paperlogin where Email='"+a+"'";
            ResultSet rs=st.executeQuery(sql);
                        
            if(a!=null){
                if (rs.next()){
                    passdb=rs.getString(2);
                
                    if(passdb.equals(ps)){
                        Cookie c1=new Cookie("EMid",a);
                        Cookie c2=new Cookie("Pass",ps);
                        c1.setMaxAge(600);
                        c2.setMaxAge(600);
                        response.addCookie(c1);
                        response.addCookie(c2);
                        
                        
                        if(rs.getString(3).equals("u")){
                            s.setAttribute("eid",a);
                            response.sendRedirect("Paper.jsp");
                        }
                        else{
                            s.setAttribute("Admin",a);
                            response.sendRedirect("Admin.jsp");
                        }
                    }
                    else 
                        out.println("password you entered is wrong.");
                
                }
                else
                    out.println("user name you entered is wrong");
            }
            else
                out.print("enter email  please");
            
        } 
        catch (Throwable ex) {
            out.println(ex);
        }
        %>
           
           
    </body>
</html>