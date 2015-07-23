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

public class DetailSearch extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageSize = 6; //每页显示书籍数
		int currentPage = 0;//当前页码
		String str_pageroffset = request.getParameter("pager.offset");
		System.out.println("str_pageroffset="+str_pageroffset);
		String superTypeId_str = null;
		String subTypeId_str = null;
		String searchMethod = null;
		String content = null;
		String price = null;
		String upLoadTime = null;
		
		if(str_pageroffset != null){
			currentPage = Integer.parseInt(str_pageroffset);
		}
		if(currentPage == 0 && str_pageroffset==null) {
			System.out.println("？？");
			superTypeId_str = request.getParameter("superType");
			subTypeId_str = request.getParameter("subT");
			searchMethod = request.getParameter("searchMethod");
			content = request.getParameter("content");
			price = request.getParameter("prices");
			upLoadTime = request.getParameter("upLoadTime");
			request.getSession().setAttribute("superType", superTypeId_str);
			request.getSession().setAttribute("subT", subTypeId_str);
			request.getSession().setAttribute("searchMethod", searchMethod);
			request.getSession().setAttribute("content", content);
			request.getSession().setAttribute("price", price);
			request.getSession().setAttribute("upLoadTime", upLoadTime);
			
		}else {
			System.out.println("!!!");
			superTypeId_str = (String)request.getSession().getAttribute("superType");
			subTypeId_str =(String)request.getSession().getAttribute("subT");
			searchMethod = (String)request.getSession().getAttribute("searchMethod");
			content = (String)request.getSession().getAttribute("content");
			price = (String)request.getSession().getAttribute("price");
			upLoadTime = (String)request.getSession().getAttribute("upLoadTime");
		}
		//用变量将参数保存
		int superTypeId = Integer.parseInt(superTypeId_str);
		int subTypeId = Integer.parseInt(subTypeId_str);
		System.out.println("superTypeId="+superTypeId);
		System.out.println("subTypeId="+subTypeId);
		System.out.println("searchMethod="+searchMethod);
		System.out.println("content="+content);
		System.out.println("price="+price);
		System.out.println("upLoadTime="+upLoadTime);
		Model model = new Model();
		String str = null;
		if(price.equals("noChoice")){	
			str =searchMethod+"="+content;
		}else {
			str =searchMethod+"="+price;
		}
		System.out.println("str="+str);
		try{
			Page page = model.doPageByConditons(superTypeId, subTypeId,str, upLoadTime, currentPage, pageSize);
			request.setAttribute("page", page);
			request.getRequestDispatcher("detailSearchOut.jsp").forward(request, response);
			}catch(NoRelativeBooksException e){
				request.setAttribute("NoRelativeBooksException", e.getMessage());
				request.getRequestDispatcher("detailSearchOut.jsp").forward(request, response);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
