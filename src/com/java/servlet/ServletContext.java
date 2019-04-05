package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletContext
 */
//@WebServlet("/ServletContext")
public class ServletContext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletContext() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//setting content type
				response.setContentType("text/html");
				
				//get printwriter
				PrintWriter out = response.getWriter();
				
				//read configuration params
				javax.servlet.ServletContext context = getServletContext();
				String portNumber = context.getInitParameter("port");
				
				//generate HTML content
				out.println("<html><body>");
				out.println("Port Number : "+portNumber);
				out.println("</html></body>");
		
	}

}
