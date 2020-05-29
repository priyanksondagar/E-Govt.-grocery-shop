<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%  
  String name=request.getParameter("name");
  String members=request.getParameter("members");
  try
  {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid","root","");
        PreparedStatement ps=conn.prepareStatement("INSERT INTO data(name,members) VALUES(?,?)");
        ps.setString(1, name);
        ps.setString(2, members);
        int row=ps.executeUpdate();
        if(row==0)
        {
            out.print("data not inserted");
        }
        else
        {
            response.sendRedirect("index.html");
        }
  }
  catch(Exception e)
  {
     out.print(e);
  }
%>