<%@ page language="java" pageEncoding="GB18030"%>

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
		<title>后台登陆</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}

.STYLE3 {
	color: #528311;
	font-size: 12px;
}

.STYLE4 {
	color: #42870a;
	font-size: 12px;
}
-->
</style>
		<script type="text/javascript">
	function login(self) {
		var name = document.getElementById("name");
		var password = document.getElementById("password");
		if(name.value != "" && password.value != "") {
			self.href = "adminLoginServlet?name="+name.value+"&"+"password="+password.value;
		}
	}
	function reset() {
		var name = document.getElementById("name");
		var password = document.getElementById("password");
		name.value = "";
		password.value = "";
	}
</script>
	</head>

	<body>
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
															<span class="STYLE3">用户</span>
														</div>
													</td>
													<td width="79%" height="30">
														<input type="text" id="name" name="name"
															style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
													</td>
												</tr>
												<tr>
													<td height="30">
														<div align="center">
															<span class="STYLE3">密码</span>
														</div>
													</td>
													<td height="30">
														<input type="password" id="password" name="password"
															style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
													</td>
												</tr>
												<tr>
													<td height="30">
														&nbsp;
													</td>
													<td height="30">
														<img src="Admin/images/dl.gif" width="81" height="22"
															border="0" usemap="#Map">
														<div style="color: red; font-size: 12px; display: inline;">
															${message}
														</div>
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
										<td width="56%">
											&nbsp;
										</td>
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
														版本 2008V1.0
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
		<map name="Map">
			<area shape="rect" coords="3,3,36,19" style="cursor: pointer;"
				onclick="login(this)">
			<area shape="rect" coords="40,3,78,18" onclick="reset()">
		</map>
	</body>
</html>
