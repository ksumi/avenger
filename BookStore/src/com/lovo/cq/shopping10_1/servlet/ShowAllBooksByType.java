package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;

public class ShowAllBooksByType extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer type = (Integer)request.getAttribute("type");
//		if(str_type != null){
//			type = Integer.parseInt(str_type);
//		}
		System.out.println("typeinshow="+type);
		Model model = new Model();
		List bookList = model.showBooks(type, 1);
		request.setAttribute("type", type);
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
