package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.exception.NameNotFound;
import com.lovo.cq.shopping10_1.exception.PasswordError;
import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Admin;

public class AdminLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = new Admin();
		admin.setName(name);
		admin.setPassword(password);
		Model model = new Model();
		try {
			if(model.login(admin)) {
				ServletContext context = this.getServletContext();
				List adminList = (List) context.getAttribute("adminList");
				System.out.println(adminList.size());
				if(!adminList.contains("admin")) {
					request.getSession().setAttribute("admin", admin);
					response.sendRedirect("Admin/pages/adminConter.jsp");
				} else {
					request.setAttribute("message","ÒÑµÇÂ¼");
					request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
				}
				//request.getRequestDispatcher("Admin/pages/admin.htm").forward(request, response);
			}
		} catch(NameNotFound nnf) {
			request.setAttribute("message", nnf.getMessage());
			request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
		} catch(PasswordError pe) {
			request.setAttribute("message", pe.getMessage());
			request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
