<%@ page language="java" import="java.sql.*,oracle.jdbc.pool.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Use of Directive Include Tag</title>
</head>
<body>

     <%
	 String id="garry",pwd="112234";
     Connection con;
     PreparedStatement prp;
     OracleDataSource ods;
     ResultSet rs;
     try{
    	 ods = new OracleDataSource();
    	 ods.setUser("system");
    	 ods.setPassword("system");
    	 ods.setPortNumber(1521);
    	 ods.setDatabaseName("xe");
    	 ods.setDriverType("thin");
    	 ods.setServerName("localhost");
    	 con = ods.getConnection();
    	 
    	 String qry ="select * from firstservlet";
			prp = con.prepareStatement(qry);
		
			rs = prp.executeQuery();
			Boolean login=false;
			while(rs.next())
				{
				if(id.equals(rs.getString(1))&&pwd.equals(rs.getString(2)))
				login=true;
				}
			if(login)
			{
				out.println("<p>successfull<p>");%><%@ include file = "DirectiveIncludeDemoLogin.jsp" %>
				<%			
			}
			else
			{
				out.println("<p>failed<p>"); %><%@ include file = "DirectiveIncludeDemoLogin.jsp" %>
				<%
			}
	       } catch (Exception e) {
	    	   e.printStackTrace();
	       }
     
     %>
     
     
  

</body>
</html>