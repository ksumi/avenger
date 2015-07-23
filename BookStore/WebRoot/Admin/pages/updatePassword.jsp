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

		<title>修改密码</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<script type="text/javascript">
		var checkPassword_ = false;
		function checkPassword() {
			var password = document.getElementById("password");
			var passwordDiv = document.getElementById("passwordDiv");
			if(password.value == "") {
				passwordDiv.innerHTML = "密码不能为空";
				checkPassword_ = false;
			} else {
				passwordDiv.innerHTML = "";
				checkPassword_ = true;
			}
		}
		var checkRpassword_ = false;
		function checkRpassword() {
			var rpassword = document.getElementById("rpassword");
			var password = document.getElementById("password");
			var rpasswordDiv = document.getElementById("rpasswordDiv");
			if(rpassword.value == "") {
				rpasswordDiv.innerHTML = "确认密码不能为空";
				checkRpassword_ = false;
			} else if(password.value != rpassword.value){
				rpasswordDiv.innerHTML = "密码确认有错";
				checkRpassword_ = false;
			} else {
				rpasswordDiv.innerHTML = "";
				checkRpassword_ = true;
			}
		}
		function update() {
			var oForm = document.getElementsByTagName("form")[0];
			var messageDiv = document.getElementById("messageDiv");
			if(checkRpassword_ && checkPassword_) {
				var name = oForm.name.value;
				var password = oForm.password.value;
				var rpassword = oForm.rpassword.value;
				oForm.action = "adminUpdatePassword?name="+name+"&password="+password+"&rpassword="+rpassword;
				oForm.submit();
			} else {
				messageDiv.innerHTML = "请输入正确的数据";
			}
		}
	</script>

		<link rel="stylesheet" type="text/css" href="Admin/css/body.css">
		<link rel="stylesheet" type="text/css"
			href="Admin/css/td_fontSize.css">
		<style type="text/css">
div {
	color: red;
}

input {
	border: solid 1px #cadcb2;
}
</style>
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
								<table id="t1" align="center">
									<tr>
										<td>
											<form action="" method="post">
												<table>
													<tr>
														<td>
															账号:
														</td>
														<td>
															<input type="text" id="name" name="name"
																value="${admin.name}" readonly="readonly">
														</td>
													<tr>
														<td>
															新密码:
														</td>
														<td>
															<input type="password" id="password" name="password"
																onblur="checkPassword()" />
														</td>
														<td>
															<div id="passwordDiv"></div>
														</td>
													</tr>
													<tr>
														<td>
															确认新密码:
														</td>
														<td>
															<input type="password" id="rpassword" name="rpassword"
																onblur="checkRpassword()" />
														</td>
														<td>
															<div id="rpasswordDiv"></div>
														</td>
													</tr>
													<tr>
														<td>
															<input type="button" value="修改" onclick="update()">
														</td>
														<td>
															<div id="messageDiv">
																${message }
															</div>
														</td>
													</tr>
												</table>
											</form>
										<td>
									</tr>
								</table>
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