<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.CartItem" />
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.Cart" />
<%@include file="common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'buy.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="CSS/link.css">

		<style type="text/css">
table th {
	background-color: "#F0F0F0"
}

#last {
	background-color: "#F0F0F0"
}

#cartImage {
	text-align: center
}

#cart {
	text-align: center
}

#go {
	text-align: center
}
</style>
	</head>

	<body>
		<div id="cartImage">
			<img src="Image/cartnow.gif" />
		</div>
		<div id="cart">
			<br>
			<table border="1px">
				<tr>
					<th>
						书籍ID
					</th>
					<th>
						书籍名称
					</th>
					<th>
						购买数量
					</th>
					<th>
						单价
					</th>
					<th>
						总价
					</th>
					<th>
						操作1
					</th>
					<th>
						操作2
					</th>
				</tr>
				<%
					Collection<CartItem> ci = (Collection) session.getAttribute("ci");
					if (ci.size() == 0) {
						out.print("购物车中还没有商品！");
				%>
				<a href="showBooks"><img src="Image/goon.jpg" /> </a>
				<%
					} else {
						Iterator<CartItem> it = ci.iterator();
						while (it.hasNext()) {
							CartItem cartItem = it.next();
				%>
				<form
					action="updateBookCount?bookId=<%=cartItem.getBook().getBookId()%>"
					method="post">
				<tr>
					<td><%=cartItem.getBook().getBookId()%></td>
					<td><%=cartItem.getBook().getBookName()%></td>
					<td>
						<input type="text" name="count" value="<%=cartItem.getCount()%>" />
					</td>
					<td><%=cartItem.getBook().getNowPrice()%></td>
					<td><%=cartItem.getItemPrice()%></td>
					<td>
						<a
							href="deleteItemServlet?bookId=<%=cartItem.getBook().getBookId()%>"><img
								src="Image/sc.jpg" /> </a>
					</td>
					<td>
						<input type="image" value="submit" src="Image/xiugai.jpg">
					</td>
				</tr>
			
				<%
					}
					}
				%>
				<tr id="last">
					<td>
						合计
					</td>
					<%
						Cart c = (Cart) session.getAttribute("cart");
						if (c != null) {
					%>
					<td><%=c.getTotalPrice()%></td>
					<%
						}
					%>
					<td>
						<a href="checkLogin">下订单</a>
					</td>
					<td>
						-
					</td>
					<td>
						-
					</td>
					<td>
						-
					</td>
					<td>
						-
					</td>
				</tr>
			</table>

		</div>
		<div id="go">
			<br>
			<a href="showBooks"><img src="Image/goon.jpg" /> </a>
		</div>
	</body>
</html>
