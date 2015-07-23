<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.Cart" />
<%@include file="common.jsp"%>
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.CartItem" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的购物车</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<div id="wrap">

			<%@include file="header.jsp"%>
			<div class="center_content">
				<div class="left_content">
					<div class="title">
						<span class="title_icon"><img src="images/bullet1.gif"
								alt="" title="" /> </span>My cart
					</div>

					<div class="feat_prod_box_details">
						<table class="cart_table">
							<tr class="cart_title">
								<td>
									图片
								</td>
								<td>
									书籍名
								</td>
								<td>
									单价
								</td>
								<td>
									数量
								</td>
								<td>
									总价
								</td>
								<td>
									修改
								</td>
								<td>
									删除
								</td>
							</tr>
							<%
								Collection ci = (Collection) request.getSession()
										.getAttribute("ci");
								if (ci.size() <= 0) {
									out.print("购物车中没有商品！！");
							%>
							<a href="index.jsp" class="continue">继续购物</a>
							<%
								} else {
									Iterator<CartItem> it = ci.iterator();
									while (it.hasNext()) {
										CartItem cartItem = it.next();
							%>
							<form
								action="updateBookCount?bookId=<%=cartItem.getBook().getBookId()%>"
								method="post" name="cartForm">
							<tr>
								<td>
									<img src="<%=cartItem.getBook().getPicture()%>" />
								</td>
								<td><%=cartItem.getBook().getBookName()%></td>
								<td><%=cartItem.getBook().getNowPrice()%></td>
								<td>
									<input type="text" name="count"
										value="<%=cartItem.getCount()%>" size="4" />
								</td>
								<td><%=cartItem.getItemPrice()%></td>
								<td>
									<a
										href="deleteItemServlet?bookId=<%=cartItem.getBook().getBookId()%>"><img
											src="Image/sc.jpg" border="0" /> </a>
								</td>
								<td>
									<input type="image" value="submit" src="Image/xiugai.jpg"
										border="0" />
								</td>
							</tr>
							
							<%
								}
								}
							%>
							<tr>
								<td colspan="4" class="cart_total">
									<span class="red">总价:</span>
								</td>
								<%
									Cart c = (Cart) session.getAttribute("cart");
									if (c != null) {
								%>
								<td><%=c.getTotalPrice()%></td>
								<%
									}
								%>
							</tr>
						</table>
						<a href="index.jsp" class="continue">&lt; 继续购物</a>
						<a href="checkLogin" class="checkout">结算 &gt;</a>
					</div>
					<div class="clear"></div>
				</div>
				<!--end of left content-->
				<%@include file="right.jsp"%>
				<!--end of right content-->

				<div class="clear"></div>
			</div>
			<!--end of center content-->
			<%@include file="footer.jsp"%>
		</div>

	</body>
</html>