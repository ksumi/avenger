package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Book;
import com.lovo.cq.shopping10_1.vo.Cart;
import com.lovo.cq.shopping10_1.vo.CartItem;

public class BuyBooksServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = 0;
		String str_bookId = request.getParameter("bookId");
		if(str_bookId != null) {
			bookId = Integer.parseInt(str_bookId);
		}
		Model model = new Model();
		Book book = model.showBookById(bookId);
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		if(bookId!=0){
			cart.addItem(bookId, book);
		}
		Collection ci = cart.getItems();	
		request.getSession().setAttribute("ci", ci);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
