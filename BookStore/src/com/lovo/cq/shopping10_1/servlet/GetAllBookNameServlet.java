package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;

public class GetAllBookNameServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		Model model = new Model();
		List bookNameList = model.getAllBookName();
		out.println("<books>");
		for(int i=0;i<bookNameList.size();i++) {
			String bookName = (String) bookNameList.get(i);
			out.println("<book>");
			out.println("<bookName>"+bookName+"</bookName>");
			out.println("</book>");
		}
		out.println("</books>");
		System.out.println(bookNameList.size());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
