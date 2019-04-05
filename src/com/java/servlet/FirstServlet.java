package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.pool.OracleDataSource;

/**
 * Servlet implementation class FirstServlet
 */
//@WebServlet(name = "demo", urlPatterns = { "/demo" })
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		
		System.out.println("initialized");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		
		System.out.println("Destroyed");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("login");
		String pwd = request.getParameter("password");
		out.println("Username: "+id+"<br/>");
		out.println(" password: "+pwd+"<br/><br/>");
		out.println("Options selected are below :<br/>");
		
		
			String[] c = request.getParameterValues("check");
			for(int i=0;i<c.length ;i++)
				out.print(c[i]+"<br/>");
	
	// establish database connection and validate credentials
			Connection con;
			PreparedStatement prp;
			OracleDataSource ods;
			
	       try {
	    	   ods = new OracleDataSource();
	    		// set the usr name
	    		ods.setUser("system");
	    		//password
	    		ods.setPassword("system");
	    		// set port 
	    		ods.setPortNumber(1521);
	    		ods.setServerName("localhost");
	    		ods.setDatabaseName("xe");
	    		ods.setDriverType("thin");
	    		
	    		// get the connection
	    		con = ods.getConnection();
			String qry ="select * from firstservlet";
			prp = con.prepareStatement(qry);
		
			ResultSet rs = prp.executeQuery();
			Boolean login=false;
			while(rs.next())
				{
				if(id.equals(rs.getString(1))&&pwd.equals(rs.getString(2)))
				login=true;
				}
			if(login)
				out.println("<h1>login successful</h1>");
			else
				out.println("<h1>login failed<h1>");
	       } catch (Exception e) {
	    	   e.printStackTrace();
	       }
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
