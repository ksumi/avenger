package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.daoimpl.NoRelativeBooksException;
import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Page;

public class PageSearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageSize = 6; //每页显示书籍数
		int pageNo = 0;//当前页码
		String str_pageroffset = request.getParameter("pager.offset");
		String keywords = null;
		System.out.println("pager.off="+str_pageroffset);
		if(str_pageroffset != null){
			pageNo = Integer.parseInt(str_pageroffset);
		}
		if(pageNo == 0 && str_pageroffset==null) {
			System.out.println("？？");
			keywords = request.getParameter("keywords");	
			request.getSession().setAttribute("keywords", keywords);	
		}else {
			System.out.println("!!!");	
			keywords = (String)request.getSession().getAttribute("keywords");
		}
		System.out.println(keywords);
		Model model = new Model();
		try{
		Page page = model.doPage(keywords,pageNo, pageSize);
		request.setAttribute("page", page);
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
