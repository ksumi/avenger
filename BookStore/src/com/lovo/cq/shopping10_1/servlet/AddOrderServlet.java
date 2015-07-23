package com.lovo.cq.shopping10_1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lovo.cq.shopping10_1.model.Model;
import com.lovo.cq.shopping10_1.po.Order;
import com.lovo.cq.shopping10_1.po.OrderItem;
import com.lovo.cq.shopping10_1.po.User;
import com.lovo.cq.shopping10_1.vo.CartItem;

public class AddOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user");//得到session中的user
		Order order = new Order();
		//得到用户提交过来的详细的订单信息
		String recvName = request.getParameter("recvName");//收货人姓名
		String email = request.getParameter("email");
		String mphone = request.getParameter("mphone");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String postcode = request.getParameter("postcode");
		user.setMphone(mphone);
		user.setPhone(phone);
		user.setAddress(address);
		user.setPostcode(postcode);
		user.setEmail(email);
		order.setUser(user);
		order.setRecvName(recvName);
		Collection ci = (Collection)request.getSession().getAttribute("ci");
		List<OrderItem> item = new ArrayList<OrderItem>();
		Iterator it = ci.iterator();
		while(it.hasNext()){
			CartItem cartItem = (CartItem) it.next();
			OrderItem order_Item = new OrderItem();
			order_Item.setBookId(cartItem.getBook().getBookId());
			order_Item.setBookName(cartItem.getBook().getBookName());
			order_Item.setBookNum(cartItem.getCount());
			order_Item.setPrice(cartItem.getItemPrice());
			item.add(order_Item);
		}
		order.setOrderItem(item);
		Model model = new Model();
		int orderId = model.addOrder(order);
		order.setOrderId(orderId);
		request.getSession().setAttribute("order", order);
		response.sendRedirect("orderSuccess.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
