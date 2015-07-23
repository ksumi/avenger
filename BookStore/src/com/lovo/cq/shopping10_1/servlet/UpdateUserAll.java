package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.User;

public class UpdateUserAll extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		//String name = (String)session .getAttribute("poName");
		
		//Model model = new Model();
		//User user =    model.SelectUser(name);
		
	   // session.setAttribute("user", user);
	    response.sendRedirect("updateUsere.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
