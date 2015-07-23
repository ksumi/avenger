package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.daoimpl.ErrPwdException;
import com.lovo.cq.shopping10_1.daoimpl.NameNotFoundException;
import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.User;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取客户端提交过来的数据
		request.setCharacterEncoding("gb2312");
		String name = request.getParameter("name");
		String password=request.getParameter("password");
		System.out.println(name+".."+password);
		Model model = new Model();
		try {
			User user = model.userLogin(name, password);
			user.setName(name);
			ServletContext context = this.getServletContext();
			List nameList = (List) context.getAttribute("nameList");
			if(!nameList.contains(name)) {
				request.getSession().setAttribute("name", name);
				request.getSession().setAttribute("user", user);
				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("loginMessage","该账号已登录");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			//response.sendRedirect("index.jsp");
			//request.getRequestDispatcher("index.jsp").forward(request, response);
		}catch (NameNotFoundException e) {
			request.setAttribute("NameNotFoundException",e.getMessage() );
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}catch(ErrPwdException e){
			request.setAttribute("ErrPwdException",e.getMessage() );
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
