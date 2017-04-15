<%-- 
    Document   : Paper
    Created on : 5 Feb, 2016, 11:14:01 PM
    Author     : user
--%>



<%@page import="java.util.Arrays"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Questions</title>
         <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
    </head>
   
    <body>
        <h1>welcome student</h1>
    
        <div class="auto-style1"><a href="LogOut.jsp"><input type="button" value="logout"></a></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UpdateProfile.jsp">Update profile</a>
        <a href="ChangePassword.jsp">Change Password</a>
        <%
            HttpSession s=request.getSession();
        String eid=(String)s.getAttribute("eid");
            if(eid==null)
                response.sendRedirect("Login.jsp");
            else
                out.print("<div class=auto-style1>Welcome "+eid+"</div>");
        %>
        <h2>Questions</h2>
         <%
        try{
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="System";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
            String sql="select * from paperques";
            ResultSet rs=st.executeQuery(sql);
	
            int n,i=0;
            int da[] = new int[100]; 
            %>
            <form method="post">
            <%while(rs.next()){
                n=rs.getInt(7);
                da[n]=rs.getInt(6);
                i++;
                out.println("Ques: "+ i +") "+rs.getString(1)+"<br>");
                //out.println("<form><input type=radio name=cb"+n+" value=1 /> "+rs.getString(2)+"   <input type=radio name=cb"+n+" value=2 />"+rs.getString(3)+"  <input type=radio name=cb"+n+" value=3 />"+rs.getString(4)+"  <input type=radio name=cb"+n+" value=4 />"+rs.getString(5)+"<input type=submit value=next /></form><br><br><br><br>");
                out.println("<input type=radio name=cb"+n+" value=1 /> "+rs.getString(2)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=radio name=cb"+n+" value=2 />"+rs.getString(3)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=radio name=cb"+n+" value=3 />"+rs.getString(4)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=radio name=cb"+n+" value=4 />"+rs.getString(5)+"<br><br><br><br><br>");
            }
            %>
        <input type=submit value=next />
            </form>
        <%
            
            int count=0;
            int[] Cans = new int [100];
            while(i>0){
                String ck=request.getParameter("cb"+i);
                int ck1=Integer.valueOf(ck);
                if(ck1==da[i]){
                    Cans[count] = i;
                count++;
                
                }
                i--;
            }
            out.print("number of correct answeres are: "+count+"<br>");
            out.print("correct answeres are of ques number: ");
            for(int q = (count - 1); q >= 0; q--)
            out.print(Cans[q]+", ");

        }
        catch(Throwable t){
            out.print("error occured: "+t);
        }
        
        //out.print(request.getParameter("cb1"));
        //out.print(request.getParameter("cb2"));
%>
</body>
</html>
