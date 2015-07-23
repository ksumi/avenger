package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Book;

public class IndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Model model = new Model();
		List hostList0 = model.showBooks(1, 1);
		List newList0 = model.showBooks(2, 1);
		List saleList0 = model.showBooks(3, 1);
		List specialList0=model.showBooks(4, 1);
		Book book11 = (Book) hostList0.get(0);
		Book book12 = (Book) hostList0.get(1);	
		Book book2 = (Book) newList0.get(0);
		Book book3 = (Book) specialList0.get(0);
		
		List<Book> hostList = new ArrayList<Book>();
		hostList.add(book11);
		hostList.add(book12);
		List<Book> newList = new ArrayList<Book>();
		newList.add(book2);
		List<Book> specialList = new ArrayList<Book>();
		specialList.add(book3);
		List<Book> saleList = new ArrayList<Book>();
		for(int i=0;i<3;i++){
			Book book = (Book) saleList0.get(i);
			saleList.add(book);
		}
		
		List informList = model.getAllInform();
		System.out.println(informList.size());
		request.getSession().setAttribute("informList", informList);
		request.getSession().setAttribute("hostList", hostList);
		request.getSession().setAttribute("newList", newList);
		request.getSession().setAttribute("saleList", saleList);
		request.getSession().setAttribute("specialList", specialList);
		response.sendRedirect("index.jsp");
		//request.getRequestDispatcher("index.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
