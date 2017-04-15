<%-- 
    Document   : Admin
    Created on : 6 Feb, 2016, 12:27:30 AM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <style type="text/css">
        #TextArea1 {
            height: 57px;
            width: 239px;
        }
        .auto-style2 {
            width: 141px;
            height: 64px;
        }
        .auto-style3 {
            height: 64px;
        }
        #Text1 {
            width: 236px;
        }
        #Text2 {
            width: 235px;
        }
        #Text3 {
            width: 234px;
        }
        #Text4 {
            width: 233px;
        }
        #Text5 {
            width: 231px;
        }
        .auto-style4 {
            width: 141px;
            height: 41px;
        }
        .auto-style5 {
            height: 41px;
        }
        .auto-style6 {
            width: 141px;
            height: 42px;
        }
        .auto-style7 {
            height: 42px;
        }
        .auto-style8 {
            width: 141px;
            height: 38px;
        }
        .auto-style9 {
            height: 38px;
        }
        .auto-style10 {
            width: 141px;
            height: 66px;
        }
        .auto-style11 {
            height: 66px;
        }
        .auto-style12 {
            width: 141px;
            height: 73px;
        }
        .auto-style13 {
            height: 73px;
        }
    </style>
    </head>
    <body>
         <a href="LogOut.jsp"><input type="button" value="logout"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UpdateProfile.jsp">Update profile</a>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("Admin");
            if(eid==null)
                response.sendRedirect("Login.jsp");
        %>
        <h1>Input Questions</h1>
        <form method="post">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style10">Question Number</td>
            <td class="auto-style11">
                <input name="Qn" type="number" /></td>
            
        </tr>
        <tr>
            <td class="auto-style2">Question</td>
            <td class="auto-style3">
                <textarea name="Ques" cols="20" name="S1" rows="2"></textarea></td>

        </tr>
        <tr>
            <td class="auto-style4">Option 1</td>
            <td class="auto-style5">
                <input name="OpOne" type="text" /></td>
            
        </tr>
        <tr>
            <td class="auto-style6">Option 2</td>
            <td class="auto-style7">
                <input name="OpTwo" type="text" /></td>
            
        </tr>
         <tr>
            <td class="auto-style4">Option 3</td>
            <td class="auto-style5">
                <input name="OpThree" type="text" /></td>

        </tr>
        <tr>
            <td class="auto-style8">Option 4</td>
            <td class="auto-style9">
                <input name="OpFour" type="text" /></td>
            
        </tr>
        <tr>
            <td class="auto-style10">Correct answer</td>
            <td class="auto-style11">
                <input name="ans" type="text" /></td>
            
        </tr>
        <tr>
           
            <td class="auto-style12"></td>
            <td class="auto-style13">
        <input type="submit" value="Insert"></td>
            
        </tr>
    </table>
    </form>
        <%
        try {
            String qn=request.getParameter("Qn");
            String q=request.getParameter("Ques");
            String o1=request.getParameter("OpOne");
            String o2=request.getParameter("OpTwo");
            String o3=request.getParameter("OpThree");
            String o4=request.getParameter("OpFour");
            String ans=request.getParameter("ans");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="System";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
            String sql="insert into PAPERQUES values ('"+q+"','"+o1+"','"+o2+"','"+o3+"','"+o4+"','"+ans+"','"+qn+"')";
            st.executeQuery(sql);
            out.println("Data inserted in table");
        } 
        catch (Throwable ex) {
            out.println("the error is "+ex);
        }
    %>
    </body>
</html>
