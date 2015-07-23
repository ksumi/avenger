<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.CartItem"/>
<jsp:directive.page import="com.lovo.cq.shopping10_1.vo.Cart"/>
<%@include file="common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">

  </head>
  
  <body>
   	<form action="addOrderServlet" method="post" name="orderForm">
<table width="800" border="1" cellspacing="1" cellpadding="1">
  <tr>
    <td height="35" colspan="2" bgcolor="#999999">用户名：${user.name}</td>
  </tr>
  <tr>
    <td width="112" height="35" bgcolor="#CCCCCC">移动电话：</td>
    <td width="675" height="35" bgcolor="#CCCCCC"><input type="text" name="mphone" size="20" /></td>
  </tr>
  <tr>
    <td height="35" bgcolor="#CCCCCC">固定电话：</td>
    <td height="35" bgcolor="#CCCCCC"><input type="text" name="phone" size="20" /></td>
  </tr>
  <tr>
    <td height="35" bgcolor="#CCCCCC">收货地址：</td>
    <td height="35" bgcolor="#CCCCCC"><input type="text" name="address" size="20" /></td>
  </tr>
  <tr>
    <td height="35" bgcolor="#CCCCCC">邮政编码：</td>
    <td height="35" bgcolor="#CCCCCC"><input type="text" name="postcode" size="20" /></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="600" border="1" cellspacing="1" cellpadding="1">
  <tr>
    <td width="120" height="30" bgcolor="#CC9966">书籍编号</td>
    <td width="120" height="30" bgcolor="#CC9966">书籍名</td>
    <td width="120" height="30" bgcolor="#CC9966">单价</td>
    <td width="110" height="30" bgcolor="#CC9966">数量</td>
    <td width="130" height="30" bgcolor="#CC9966">价格</td>
  </tr>
  <%
	Collection<CartItem> ci = (Collection)session.getAttribute("ci");
	Iterator<CartItem> it= ci.iterator();
    while(it.hasNext()){
    	CartItem cartItem = it.next();
    %>
    <tr>
    <td width="120" height="30" bgcolor="#FFCC99"><%=cartItem.getBook().getBookId()%></td>
    <td height="30" bgcolor="#FFCC99"><%=cartItem.getBook().getBookName() %></td>
    <td height="30" bgcolor="#FFCC99"><%=cartItem.getBook().getNowPrice() %></td>
    <td height="30" bgcolor="#FFCC99"><%=cartItem.getCount() %></td>
    <td height="30" bgcolor="#FFCC99"><%=cartItem.getItemPrice() %></td>
  </tr>
  <%
    }
 %>
  	 <tr>
    	 <td>-</td><td>-</td><td>-</td><td>-</td> 
    	 	<%
    	 	   Cart c = (Cart)session.getAttribute("cart");
    	 	   if(c != null){
    	 	   	%>
    	 	   	  <td>总价：<%=c.getTotalPrice()%></td>
    	 	   	<%
    	 	   }
    	 	 %>
    </tr>
</table>
<p>&nbsp;</p>
<table width="600" height="30" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td width="300" bgcolor="#FF9966"><div align="center">返回购物车</div></td>
    <td width="300" bgcolor="#FF9966"><input type="submit" value="提交订单"/></td>
  </tr>
</table>
</form>
  </body>
</html>
