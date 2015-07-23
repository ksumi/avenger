package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Book;

public class AddBookServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String str_superTypeId = request.getParameter("superTypeId");
		String str_subTypeId = request.getParameter("subTypeId");
		String bookName = request.getParameter("bookName");             //
		String ISBN = request.getParameter("ISBN");                     //
		String introduce = request.getParameter("introduce");             //
		String pages_str = request.getParameter("pages"); 
		String publisher = request.getParameter("publisher");              //
		String author = request.getParameter("author");                   //
		String str_price = request.getParameter("price");
		String str_nowPrice = request.getParameter("nowPrice");
		String picture = request.getParameter("picture");                 //
		String str_booksNum = request.getParameter("booksNum");        
		String str_newBooks = request.getParameter("newBooks");      
		String str_saleBooks = request.getParameter("saleBooks");
		String str_hostBooks = request.getParameter("hostBooks");
		String str_specialBooks = request.getParameter("specialBooks");
		byte[] bookName_buf = bookName.getBytes("iso8859-1");
		byte[] ISBN_buf = ISBN.getBytes("iso8859-1");
		byte[] introduce_buf = introduce.getBytes("iso8859-1");
		byte[] publisher_buf = publisher.getBytes("iso8859-1");
		byte[] author_buf = author.getBytes("iso8859-1");
		byte[] picture_buf = picture.getBytes("iso8859-1");
		int superTypeId = Integer.parseInt(str_superTypeId);
		int subTypeId = Integer.parseInt(str_subTypeId);
		float price = Float.parseFloat(str_price);
		float nowPrice = Float.parseFloat(str_nowPrice);
		int booksNum = Integer.parseInt(str_booksNum);
		int newBooks = 0;
		int saleBooks = 0;
		int hostBooks = 0;
		int specialBooks = 0;
		int pages = 0;
		if(str_newBooks != null)
			newBooks = Integer.parseInt(str_newBooks);
		if(str_saleBooks != null)
			saleBooks = Integer.parseInt(str_saleBooks);
		if(str_hostBooks != null)
			hostBooks = Integer.parseInt(str_hostBooks);
		if(str_specialBooks != null)
			specialBooks = Integer.parseInt(str_specialBooks);
		if(pages_str != null) {
			pages = Integer.parseInt(pages_str);
		}
		Model model = new Model();
		Book book = new Book();
		book.setSuperTypeId(superTypeId);
		book.setSubTypeId(subTypeId);
		book.setBookName(new String(bookName_buf));
		book.setISBN(new String(ISBN_buf));
		book.setIntroduce(new String(introduce_buf));
		book.setPages(pages);
		book.setPublisher(new String(publisher_buf));
		book.setAuthor(new String(author_buf));
		book.setPrice(price);
		book.setNowPrice(nowPrice);
		book.setPicture(new String(picture_buf));
		book.setNewBooks(newBooks);
		book.setSaleBooks(saleBooks);
		book.setHostBooks(hostBooks);
		book.setSpecialBooks(specialBooks);
		book.setBookNum(booksNum);
		if(model.addBook(book)) {
			request.setAttribute("message", "添加成功");
		} else {
			request.setAttribute("message", "添加失败");
		}
		request.getRequestDispatcher("Admin/pages/addBooks.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
