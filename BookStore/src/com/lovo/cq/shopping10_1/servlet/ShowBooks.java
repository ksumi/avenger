package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;

public class ShowBooks extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Model model = new Model();
		List hostList = model.showBooks(1, 1);
		List newList = model.showBooks(2, 1);
		List saleList = model.showBooks(3, 1);
		List specialList=model.showBooks(4, 1);
		request.setAttribute("hostList", hostList);
		request.setAttribute("newList", newList);
		request.setAttribute("saleList", saleList);
		request.setAttribute("specialList", specialList);
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
