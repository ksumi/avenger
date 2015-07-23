package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.common.DbUtil;
import com.lovo.cq.shopping10_1.po.User;

public class UpdataPwd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	        System.out.println("∏ƒ√‹¬Î¡À");
	 	   User user= (User) request.getSession().getAttribute("user");
		   String name=(String)user.getName();
	       String password=request.getParameter("password");
	       PreparedStatement stat=null;
	        DbUtil db=new DbUtil();
	        String sql="update tb_user set password=? where name=?";
	        try {
				stat=db.getCon().prepareStatement(sql);
				stat.setString(1, password);
				stat.setString(2, name);
				stat.executeUpdate();
				response.sendRedirect("index.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
}
