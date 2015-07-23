package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.daoimpl.NoRelativeBooksException;
import com.lovo.cq.shopping10_1.model.Model;

public class SearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keywords = (String) request.getAttribute("keywords");
		Model model = new Model();
		try{
			List searchList = model.searchBooks(keywords);
			request.setAttribute("searchList", searchList);
			request.getRequestDispatcher("searchOut.jsp").forward(request, response);
		}catch(NoRelativeBooksException e){
			request.setAttribute("NoRelativeBooksException", e.getMessage());
			request.getRequestDispatcher("searchOut.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
