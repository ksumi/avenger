<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'userManager.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
table {
	text-align: center;
}
</style>
	</head>

	<body>
		当前用户：
		<font color="red"> <c:out value="${user.name}"></c:out> </font>&nbsp;
		<c:choose>
			<c:when test="${empty userList}">
				<h1>
					<font color="red">没有注册用户</font>
				</h1>
			</c:when>
			<c:otherwise>
				<table border="1" bordercolor="maroon" align="center">
					<thead>
						<h3>
							用户管理
						</h3>
					</thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							用户名
						</th>
						<th>
							删除操作
						</th>
					</tr>
					<c:forEach var="user" items="${page.pageList}">
						<tr>
							<td>
								${user.id}
							</td>
							<td>
								${user.name}
							</td>
							<td>
								<a href="delete?id=${user.id}">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<pg:pager items="${page.totalNum}" url="page" maxPageItems="3">
			<pg:first>
				<a href="${pageUrl}">首页</a>
			</pg:first>
			<pg:prev>
				<a href="${pageUrl}">前页</a>
			</pg:prev>
			<pg:pages>
				<a href="${pageUrl}">${pageNumber}</a>
			</pg:pages>
			<pg:next>
				<a href="${pageUrl}">后页</a>
			</pg:next>
			<pg:last>
				<a href="${pageUrl}">尾页</a>
			</pg:last>
		</pg:pager>
	</body>
</html>
