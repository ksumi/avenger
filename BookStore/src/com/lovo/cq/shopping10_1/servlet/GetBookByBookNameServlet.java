package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.BookPager;

public class GetBookByBookNameServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		//查询多少条数据
		String pageSize_str = request.getParameter("pageSize");
		int offset = 0;
		int pagecurrentPageNo = 1;
		int pageSize = 5;
		if(pageSize_str != null) {
			pageSize = Integer.parseInt(pageSize_str);
		}
		String bookName_str = request.getParameter("bookName");
		if(bookName_str != null) {
			byte[] buf = bookName_str.getBytes("iso8859-1");
			String bookName = new String(buf);
			Model model = new Model();
			BookPager bookPager = model.searchBook(bookName);
			bookPager.setPageOffset(offset);
			bookPager.setPagecurrentPageNo(pagecurrentPageNo);
			bookPager.setPageSize(pageSize);
			request.setAttribute("bookPager", bookPager);
			request.setAttribute("bookList", bookPager.getBookMap().values());
			request.getRequestDispatcher("Admin/pages/manageBooks.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
