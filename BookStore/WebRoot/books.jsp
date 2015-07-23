<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@include file="common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'books.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="CSS/link.css">
	<style type="text/css">
		table td{width="200" height="150"}
	</style>
  </head>
  
  <body>
 	 <img src="Image/host.gif" />
   	<table>
   		<tr>
   			<td>
   			<c:forEach var="flag" items="${hostList}">
   				<table>
   					<tr>
   						<td width="200" height="150"><a href="showBookByIdServlet?bookId=${flag.bookId}"><img src="${flag.picture}" /></a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25"><a href="showBookByIdServlet?bookId=${flag.bookId}">${flag.bookName}</a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25">${flag.nowPrice}</td>
   					</tr>
   				</table>
   				<td>
   			</c:forEach>	
   			</td>
   		</tr>
   	</table>
   	  		<img src="Image/new.gif" />
   	<table>	
   		<tr>
   			<td>
   			<c:forEach var="flag" items="${newList}">
   				<table>
   					<tr>
   						<td width="200" height="150"><a href="showBookByIdServlet?bookId=${flag.bookId}"><img src="${flag.picture}" /></a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25"><a href="showBookByIdServlet?bookId=${flag.bookId}">${flag.bookName}</a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25">${flag.nowPrice}</td>
   					</tr>  			
   				</table>
   				<td>
   			</c:forEach>
   			</td>
   		</tr>
   	</table>
   		<img src="Image/tbtj.gif" />
   	<table>	
   		<tr>
   			<td>
   			<c:forEach var="flag" items="${saleList}">
   				<table>
   					<tr>
   						<td width="200" height="150"><a href="showBookByIdServlet?bookId=${flag.bookId}"><img src="${flag.picture}" /></a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25"><a href="showBookByIdServlet?bookId=${flag.bookId}">${flag.bookName}</a></td>
   					</tr>
   					<tr>
   						<td width="200" height="25">${flag.nowPrice}</td>
   					</tr>	
   				</table>
   				<td>
   			</c:forEach>
   			</td>
   		</tr>
   	</table>
  </body>
</html>
