package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Page;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageSize = 6;
		int pageNo = 0;
		int type = 0;
		int index = 0;//问号的位置
		String str_type = null;
		String str_pageNo = null;
		String str = request.getParameter("type");
		if((index=str.indexOf("?")) != -1){
			//包含问号
			str_type = str.substring(0,index);
			String strPpageNo = str.substring(index);
		    str_pageNo = strPpageNo.substring(strPpageNo.indexOf("=")+1);
		}else {
			str_type = str;
		}
		//String str_type = str.substring(0,str.indexOf("?"));
		System.out.println("str_type in pageservlet="+str_type);
		if(str_type != null){
			type = Integer.parseInt(str_type);
		}
		if(str_pageNo != null){
			pageNo = Integer.parseInt(str_pageNo);
		}
		Model model = new Model();
		System.out.println("转后：type="+type);
		Page page = model.doPage(type,pageNo, pageSize);
		request.setAttribute("type", type);
		request.setAttribute("page", page);
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
