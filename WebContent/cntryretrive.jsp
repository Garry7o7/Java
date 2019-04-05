<%@ page language="java" import="java.sql.*,oracle.jdbc.pool.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form>
     <select>
     <%
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
    	 
    	 prp = con.prepareStatement("select * from cntry");
    	 
    	 rs = prp.executeQuery();
    	 
    	 while (rs.next()){
    		 %>
    		 <option><%= rs.getString(2) %></option>
    		 <%} 
    	 }
     catch(Exception e){
    	 e.printStackTrace();
     }
     
     %>
     
     </select>
    
    </form>
    
</body>
</html>