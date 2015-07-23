package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.ModelOrder;

public class SonOrder extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
          int orderid = 0 ;
          String id = request.getParameter("id");
          if(id!=null){
        	  orderid = Integer.parseInt(id);
          }
          ModelOrder model = new ModelOrder();
                  List list =   model.selectOrderIt(orderid);
                  System.out.println(list.size());
	        request.getSession().setAttribute("list", list);
	        response.sendRedirect("sonOrder.jsp");
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
this.doGet(request, response);
	}

}
