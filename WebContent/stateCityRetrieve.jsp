<%@ page language="java" import="java.sql.*,oracle.jdbc.pool.*,java.util.HashMap,java.util.Map" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>State and Cities</title>
</head>
<body >

<form>
<select name="StateDropDown" onChange="location.href='stateCityRetrieve.jsp?key='+this.value" >

 <%
 
 

 
Connection con = null;
PreparedStatement prp;
PreparedStatement prp1;
OracleDataSource ods;
ResultSet rs;
ResultSet rs1;


try {
	ods = new OracleDataSource();
	 ods.setUser("system");
	 ods.setPassword("system");
	 ods.setPortNumber(1521);
	 ods.setDatabaseName("xe");
	 ods.setDriverType("thin");
	 ods.setServerName("localhost");
	 con = ods.getConnection();
	 
	 prp = con.prepareStatement("select * from state");
	 rs = prp.executeQuery();
	 
	 while (rs.next())
	 {
		 %>
	 <option value="<%=rs.getInt(1) %>" 
	 <%= (request.getParameter("key") != null && request.getParameter("key").equals(String.valueOf(rs.getInt(1)))) ? "selected" : "" %>>
	 <%= rs.getString(2) %></option>
	 
	<%
	 }
	 

}
catch(Exception e){
	 e.printStackTrace();
}
%>

</select>
<select name="CityDropDown" >
<%
if(request.getParameter("key") != null)
{
		int a = Integer.parseInt(request.getParameter("key"));
	try{
prp1 = con.prepareStatement("select * from city WHERE STATE_ID=?");
prp1.setInt(1, a);
rs1 = prp1.executeQuery();
while(rs1.next())
{	
%>
<option value="<%=rs1.getInt(1) %>" ><%= rs1.getString(3) %></option>
<%
}
	}
	catch(Exception e){
		 e.printStackTrace();
	}
  }
%>
</select>
</form>

</body>
</html>