package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.vo.Cart;

public class UpdateBookCount extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = 0;
		int count = 0;
		String str_bookId = request.getParameter("bookId");
		String str_count = request.getParameter("count");
		if(str_bookId != null&&str_count!=null){
			bookId = Integer.parseInt(str_bookId);
			count = Integer.parseInt(str_count);
		}
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.updateBookCount(bookId, count);
		response.sendRedirect("buyBooksServlet");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
