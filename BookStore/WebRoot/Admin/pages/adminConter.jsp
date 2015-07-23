<%@ page language="java" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>主页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="Admin/css/admin.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="Admin/js/admin.js"></script>
	</head>

	<body>
		<jsp:include flush="true" page="adminTop.jsp"></jsp:include>
		<div id="container">
			<div id="middle">
				<div id="left-column">
					<div class="left-column-box">
						<img class="left-column-title"
							src="Admin/images/manageUserDown.jpg"
							onMouseDown="manageUser(this)" />
						<div id="manageUser" style="display: none;">
							<ul>
								<li>
									<a href="getUserPagerServlet" target="contentIframe"
										style="text-decoration: none;">普通用户</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="left-column-box">
						<img class="left-column-title"
							src="Admin/images/manageOrderDown.jpg"
							onMouseDown="manageOrder(this)" />
						<div id="manageOrder" style="display: none;">

							<ul>
								<li>
									<a href="getOrderPagerServlet" target="contentIframe"
										style="text-decoration: none;">查看所有订单</a>
								</li>
								<li>
									<a href="getOrderNotSendPagerServlet" target="contentIframe"
										style="text-decoration: none;">未发货订单</a>
								</li>
								<li>
									<a href="getOrderSendPagerServlet" target="contentIframe"
										style="text-decoration: none;">已发货订单</a>
								</li>
								<li>
									<a href="getOrderFreezePagerServlet" target="contentIframe"
										style="text-decoration: none;">已冻结订单</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="left-column-box">
						<img class="left-column-title"
							src="Admin/images/manageProductDown.jpg"
							onMouseDown="manageProduct(this)" />
						<div id="manageProduct" style="display: none;">
							<ul>
								<li>
									<a href="Admin/pages/addSuperType.jsp" target="contentIframe"
										style="text-decoration: none;">添加大类</a>
								</li>
								<li>
									<a href="Admin/pages/addSubType.jsp" target="contentIframe"
										style="text-decoration: none;">添加小类</a>
								</li>
								<li>
									<a href="Admin/pages/addBooks.jsp" target="contentIframe"
										style="text-decoration: none;">添加商品</a>
								</li>
								<li>
									<a href="getBookPagerServlet" target="contentIframe"
										style="text-decoration: none;">查看商品</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="left-column-box">
						<img class="left-column-title"
							src="Admin/images/manageInformDown.jpg"
							onMouseDown="manageInform(this)" />
						<div id="manageInform" style="display: none;">
							<ul>
								<li>
									<a href="Admin/pages/addInform.jsp" target="contentIframe"
										style="text-decoration: none;">添加公告</a>
								</li>
								<li>
									<a href="getInformPagerServlet" target="contentIframe"
										style="text-decoration: none;">查看公告</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="left-column-box">
						<img class="left-column-title"
							src="Admin/images/manageLiuyanDown.jpg"
							onMouseDown="manageLiuyan(this)" />
						<div id="manageLiuyan" style="display: none;">
							<ul>
								<li>
									<a href="getNotePagerServlet" target="contentIframe"
										style="text-decoration: none;">查看留言</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="content"
					style="background-image: url(Admin/pages/beijing.jpg)">
					<iframe name="contentIframe" scrolling="auto" frameborder="0"
						width="100%" height="100%"></iframe>
				</div>
			</div>
			<div id="footer">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="24" background="Admin/images/main_47.gif">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="29" height="24">
										<img src="Admin/images/main_45.gif" width="29" height="24" />
									</td>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="369">
													<span class="STYLE1">版本 项目十部1组成员 </span>
												</td>
												<td width="814" class="STYLE1">
													&nbsp;
												</td>
												<td width="185" nowrap="nowrap" class="STYLE1">
													<div align="center">
														<img src="Admin/images/main_51.gif" width="12" height="12" />
														如有疑问请与技术人员联系
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td width="14">
										<img src="Admin/images/main_49.gif" width="14" height="24" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
