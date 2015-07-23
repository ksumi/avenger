<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'adminLogin.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="Admin/css/adminLogin.css">
		<script type="text/javascript">
	function login(){
		var name = document.getElementById("Name");
		var password = document.getElementById("Password");
		var area1 = document.getElementsByTagName("area");
		area1.setAttribute("href","adminloginserlvet?name="+name+",password="+password);
		
	}	
		
	</script>
	</head>

	<body>
		<form action="adminLoginServlet" method="post">
			<table width="100%" height="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td bgcolor="#e5f6cf">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height="608" background="Admin/images/login_03.gif">
						<table width="862" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="266" background="Admin/images/login_04.gif">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="95">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="424" height="95"
												background="Admin/images/login_06.gif">
												&nbsp;
											</td>
											<td width="183" background="Admin/images/login_07.gif">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="21%" height="30">
															<div align="center">
																<span class="STYLE3">”√ªß</span>
															</div>
														</td>
														<td width="79%" height="30">
															<input type="text" name="Name" id="Name"
																style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
														</td>
													</tr>
													<tr>
														<td height="30">
															<div align="center">
																<span class="STYLE3">√‹¬Î</span>
															</div>
														</td>
														<td height="30">
															<input type="password" name="Password" id="Password"
																style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
														</td>
													</tr>
													<tr>
														<td colspan="2" align="center" style="color: red;"></td>
													</tr>
													<tr>
														<td height="30">
															&nbsp;
														</td>
														<td height="30" style="color: red; font-size: 13px;">
															<input type="submit" value="µ«¬Ω">
															${loginnotfound }
														</td>
													</tr>
												</table>
											</td>
											<td width="255" background="Admin/images/login_08.gif">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="247" valign="top"
									background="Admin/images/login_09.gif">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="22%" height="30">
												&nbsp;
											</td>
											<td width="56%"></td>
											<td width="22%">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
											<td height="30">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="44%" height="20">
															&nbsp;
														</td>
														<td width="56%" class="STYLE4">
															∞Ê±æ 2009V1.0
														</td>
													</tr>
												</table>
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#a2d962">
						&nbsp;
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
