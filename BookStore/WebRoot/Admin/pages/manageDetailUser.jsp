<%@ page language="java" pageEncoding="GB18030"%>
<%@ include file="tools.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户详情</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="Admin/css/body.css">
		<link rel="stylesheet" type="text/css"
			href="Admin/css/td_fontSize.css">
	</head>

	<body>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15" height="30">
								<img src="Admin/images/tab_03.gif" width="15" height="30" />
							</td>
							<td width="1101" background="Admin/images/tab_05.gif">
								&nbsp;
							</td>
							<td width="281" background="Admin/images/tab_05.gif">
								<table border="0" align="right" cellpadding="0" cellspacing="0">
									<tr>
										<td width="60">
											<table width="87%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1">
														<div align="center"></div>
													</td>
													<td class="STYLE1">
														<div align="center"></div>
													</td>
												</tr>
											</table>
										</td>
										<td width="60">
											<table width="90%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1">
														<div align="center">
															<br>
														</div>
													</td>
													<td class="STYLE1"></td>
												</tr>
											</table>
										</td>
										<td width="60">
											<table width="90%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1">
														<div align="center">
															<br>
														</div>
													</td>
													<td class="STYLE1">
														<div align="center">
															<br>
														</div>
													</td>
												</tr>
											</table>
										</td>
										<td width="52">
											<table width="88%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1">
														<div align="center">
															<br>
														</div>
													</td>
													<td class="STYLE1">
														<div align="center">
															<br>
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td width="14">
								<img src="Admin/images/tab_07.gif" width="14" height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="9" background="Admin/images/tab_12.gif">
								&nbsp;
							</td>
							<td bgcolor="#f3ffe3">


								<center>
									<table>
										<tr>
											<td>
												用户ID
											</td>
											<td>
												<input type="text" name="id" value="${user.id}" />
											</td>
										</tr>
										<tr>
											<td>
												用户名
											</td>
											<td>
												<input type="text" name="name" value="${user.name }" />
											</td>
										</tr>
										<tr>
											<td>
												密码
											</td>
											<td>
												<input type="text" name="password" value="${user.password }" />
											</td>
										</tr>
										<tr>
											<td>
												Email
											</td>
											<td>
												<input type="text" name="email" value="${user.email }" />
											</td>
										</tr>
										<tr>
											<td>
												真名
											</td>
											<td>
												<input type="text" name="trueName" value="${user.trueName }" />
											</td>
										</tr>

										<tr>
											<td>
												性别
											</td>
											<td>
												<input type="text" name="sex" value="${user.sex }" />
											</td>
										</tr>

										<tr>
											<td>
												生日
											</td>
											<td>
												<input type="text" name="birthday" value="${user.birthday }" />
											</td>
										</tr>
										<tr>
											<td>
												家庭住址
											</td>
											<td>
												<input type="text" name="address" value="${user.address }" />
											</td>
										</tr>
										<tr>
											<td>
												邮编
											</td>
											<td>
												<input type="text" name="postcode" value="${user.postcode }" />
											</td>
										</tr>
										<tr>
											<td>
												固话
											</td>
											<td>
												<input type="text" name="phone" value="${user.phone }" />
											</td>
										</tr>
										<tr>
											<td>
												手机
											</td>
											<td>
												<input type="text" name="mphone" value="${user.mphone }" />
											</td>
										</tr>
										<tr>
											<td>
												问题
											</td>
											<td>
												<input type="text" name="question" value="${user.question }" />
											</td>
										</tr>
										<tr>
											<td>
												答案
											</td>
											<td>
												<input type="text" name="answer" value="${user.answer }" />
											</td>
										</tr>
										<tr>
											<td>
												用户头像
											</td>
											<td>
												<img src="${user.img }" />
											</td>
										</tr>
										<tr>
											<td>
												积分
											</td>
											<td>
												<input type="text" name="score" value="${user.score }" />
											</td>
										</tr>
									</table>
									<a href="getUserPagerServlet">返回</a>
								</center>


							</td>
							<td width="9" background="Admin/images/tab_16.gif">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="29">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15" height="29">
								<img src="Admin/images/tab_20.gif" width="15" height="29" />
							</td>
							<td background="Admin/images/tab_21.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="25%" height="29" nowrap="nowrap">
											&nbsp;
										</td>
										<td width="75%" valign="top" class="STYLE1">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
							<td width="14">
								<img src="Admin/images/tab_22.gif" width="14" height="29" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
