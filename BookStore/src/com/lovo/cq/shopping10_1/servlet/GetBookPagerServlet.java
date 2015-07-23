package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.BookPager;
import com.lovo.cq.shopping10_1.po.InformPager;

public class GetBookPagerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageOffset_str = request.getParameter("pager.offset");
		String pageSize_str = request.getParameter("pageSize");
		int pageOffset = 0;
		int pageSize = 5;
		int pagecurrentPageNo = 0;
		if(pageOffset_str != null && pageSize_str != null) {
			pageOffset = Integer.parseInt(pageOffset_str);
			pageSize = Integer.parseInt(pageSize_str);
		}
		Model model = new Model();
		BookPager bookPager = model.getBookPager(pageOffset, pageSize);
		if(bookPager.getBookMap().size() == 0 && pageOffset != 0) {
			pageOffset -= pageSize;
			bookPager = model.getBookPager(pageOffset, pageSize);
		}
		if(pageOffset%pageSize == 0 || pageOffset/pageSize >0) {
			pagecurrentPageNo = pageOffset/pageSize + 1;
		}
		bookPager.setPageOffset(pageOffset);
		bookPager.setPageSize(pageSize);
		bookPager.setPagecurrentPageNo(pagecurrentPageNo);
		request.setAttribute("bookPager", bookPager);
		request.setAttribute("bookList", bookPager.getBookMap().values());
		request.getRequestDispatcher("Admin/pages/manageBooks.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
