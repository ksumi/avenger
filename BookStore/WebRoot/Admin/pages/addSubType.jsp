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

		<title>添加小类</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="Admin/css/body.css">
		<link rel="stylesheet" type="text/css"
			href="Admin/css/td_fontSize.css">
		<style type="text/css">
#t2 {
	height: 350px;
	width: 650px;
	text-align: center;
}
</style>
		<script type="text/javascript">
		var req;
		function getSuperType() {
			var url = "getSuperType";
			sendRequest(url);
		}
		function sendRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = showSuper;
			req.open("get",url,true);
			req.send(null);
		}
		function showSuper() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var subTypeXml = req.responseXML;
					var superTypes = subTypeXml.getElementsByTagName("super");
					var superTypeId = document.getElementById("superTypeId");
					if(superTypes.length > 0) {
						for(var i=0;i<superTypes.length;i++) {
							var superId = superTypes[i].getElementsByTagName("superId").item(0).firstChild.data;
							var superName = superTypes[i].getElementsByTagName("superName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",superId);
							var txt = document.createTextNode(superName);
							op.appendChild(txt);
							superTypeId.appendChild(op);
							superTypeId.style.width = "auto";
						}
					} else {
						typeDiv.innerHTML = "还没有大类";
					}
				}
			}
		}
		function checkSubTypeName() {
			var subTypeName = document.getElementById("subTypeName");
			var subTypeNameDiv = document.getElementById("subTypeNameDiv");
			if(subTypeName.value == "") {
				subTypeNameDiv.innerHTML = "小类名不能为空";
			} else {
				checkSubTypeNameIsExist();
			}
		}
		function checkSubTypeNameIsExist() {
			var subTypeName = document.getElementById("subTypeName");
			var url = "checkSubTypeIsExist?subTypeName="+subTypeName.value;
			sendSubTypeName(url);
		}
		function sendSubTypeName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = subTypeNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		var subTypeName_IsExist;
		function subTypeNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var subTypeNameDiv = document.getElementById("subTypeNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						subTypeName_IsExist = true;
					} else {
						subTypeName_IsExist = false;
					}
					subTypeNameDiv.innerHTML = content;
				}
			}
		}
		function addSuperType() {
			var oForm = document.getElementsByTagName("form")[0];
			var subTypeName = document.getElementById("subTypeName");
			var superTypeId = document.getElementsByName("superTypeId")[0];
			var superId;
			for(var i=0;i<superTypeId.length;i++) {
				if(superTypeId[i].selected == true) {
					superId = superTypeId[i].value;
				}
			}
			if(!subTypeName_IsExist) {
				oForm.action = "addSubTypeServlet?superTypeId="+superId+"&subTypeName="+subTypeName.value;
				oForm.submit();
			}
		}
	</script>
	</head>

	<body onload="getSuperType()">
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



								<form action="addSubTypeServlet" method="get">
									<table id="t2">
										<tr>
											<td>
												小类名称:
												<input type="text" id="subTypeName" name="subTypeName"
													onblur="checkSubTypeName()" />
												所属类:
												<select name="superTypeId">
													<c:forEach var="superType" items="${superTypes }">
														<option value="${superType.superTypeId }">
															${superType.typeName}
														</option>
													</c:forEach>
												</select>
												<input type="button" value="添加" onclick="addSuperType()" />
												<font color="red">${message}</font>
												<div id="subTypeNameDiv"></div>
											</td>
										</tr>
									</table>
								</form>


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