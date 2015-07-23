package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.User;

public class UpdateUserTrue extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		
		HttpSession session = request.getSession(); 
		String randomCode = (String) session.getAttribute("randomCode");
		  
		User user= new User(); 
		String code = request.getParameter("code");
		if(randomCode.equals(code)){
	     String name = request.getParameter("name");
	      
	      String password= request.getParameter("password") ;
	      String email= request.getParameter("email");
	      String trueName= request.getParameter("trueName");
	      String sex= request.getParameter("sex");
	      String  birthday=request.getParameter("birthday");
	      String address= request.getParameter("address");
	      String postcode =  request.getParameter("postcode");
	      String phone= request.getParameter("phone") ;
	      String mphone = request.getParameter("mphone");
	      String question= request.getParameter("question");
	      String answer= request.getParameter("answer");
	      String img = request.getParameter("tuid");
	      
	       user.setName(name);
	       user.setEmail(email);
	       user.setTrueName(trueName);
	       user.setSex(sex);
	       user.setBirthday(birthday);
	       user.setAddress(address);
	       user.setPostcode(postcode);
	       user.setPhone(phone);
	       user.setMphone(mphone);
	       user.setQuestion(question);
	       user.setAnswer(answer);
	       user.setImg(img);
	
	       Model model = new Model();
			Boolean bo =    model.updateUser(user);
	     
	       if(bo){//修改成功，又将它返回到查看用户资料页面
	    	   session.setAttribute("user", user);
	   	    response.sendRedirect("Web/pages/onePage.jsp");
	       }
		}else{//验证码错误将跳转
			request.setAttribute("codeEnrool", "验证码错误");
			request.getRequestDispatcher("okLoggin/updateUsere.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
this.doGet(request, response);
	}

}
