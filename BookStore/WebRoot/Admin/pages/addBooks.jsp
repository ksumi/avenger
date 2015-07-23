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

		<title>添加书籍</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<script type="text/javascript">
		var req;
		function getSuperType() {
			var url = "getSuperType";
			sendSuperTypeRequest(url);
		}
		function sendSuperTypeRequest(url) {
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
		function getSubType() {
			var id;
			var superType = document.getElementById("superTypeId");
			for(var i=0;i<superType.options.length;i++) {
				if(superType.options[i].selected) {
					id = superType.options[i].value;
				}
			}
			var url = "getSubTypeBySuperTypeId?superTypeId="+id;
			sendRequest(url);
		}
		function sendRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = showSub;
			req.open("get",url,true);
			req.send(null);
		}
		function clearSubType() {
			 var subType = document.getElementById("subTypeId");
			 for(var i = subType.options.length - 1;i>=0;i--) {
			 	subType.options[i].parentNode.removeChild(subType.options[i]);
			 }
			 subType.style.width = "";
		}
		function showSub() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var subTypeXml = req.responseXML;
					clearSubType();
					var subTypes = subTypeXml.getElementsByTagName("subType");
					var subType = document.getElementById("subTypeId");
					var typeDiv = document.getElementById("typeDiv");
					if(subTypes.length > 0) {
						for(var i=0;i<subTypes.length;i++) {
							var subTypeId = subTypes[i].getElementsByTagName("subTypeId").item(0).firstChild.data;
							var subTypeName = subTypes[i].getElementsByTagName("subTypeName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",subTypeId);
							var txt = document.createTextNode(subTypeName);
							op.appendChild(txt);
							subType.appendChild(op);
							subType.style.width = "auto";
							typeDiv.innerHTML = "√";
						}
					} else {
						typeDiv.innerHTML = "*";
					}
				}
			}
		}
		var bookName_IsExist;
		function checkBookNameIsExist() {
			var bookName = document.getElementById("bookName");
			var url = "checkBookNameIsExist?bookName="+bookName.value;
			sendBookName(url);
		}
		function sendBookName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = bookNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function bookNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var bookNameDiv = document.getElementById("bookNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						bookName_IsExist = true;
					} else {
						bookName_IsExist = false;
					}
					bookNameDiv.innerHTML = content;
				}
			}
		}
		function checkBookName() {
			var bookName = document.getElementById("bookName");
			var bookNameDiv = document.getElementById("bookNameDiv");
			if(bookName.value == "") {
				bookNameDiv.innerHTML = "书名不能为空";
			} else {
				checkBookNameIsExist();
			}
		}
		
		var ISBN_IsExist;
		function checkISBNIsExist() {
			var isbn = document.getElementById("ISBN");
			var url = "checkISBNIsExist?ISBN="+isbn.value;
			sendISBN(url);
		}
		function sendISBN(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = ISBNIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function ISBNIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var ISBNDiv = document.getElementById("ISBNDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						ISBN_IsExist = true;
					} else {
						ISBN_IsExist = false;
					}
					ISBNDiv.innerHTML = content;
				}
			}
		}
		function checkISBN() {
			var isbn = document.getElementById("ISBN");
			var isbnDiv = document.getElementById("ISBNDiv");
			if(isbn.value == "") {
				isbnDiv.innerHTML = "ISBN号码不能为空";
			} else {
				checkISBNIsExist();
			}
		}
		
		var checkPages_;
		function checkPages() {
			var pages = document.getElementById("pages");
			var pagesDiv = document.getElementById("pagesDiv");
			var pattern = /^[1-9]\d*$/;
			if(pages.value == "") {
				pagesDiv.innerHTML = "书的页数不能为空";
				checkPages_ = false;
			} else if(pattern.test(pages.value)) {
				pagesDiv.innerHTML = "√";
				checkPages_ = true;
			} else {
				pagesDiv.innerHTML = "格式不对";
				checkPages_ = false;
			}
		}
		var checkPublisher_;
		function checkPublisher() {
			var publisher = document.getElementById("publisher");
			var publisherDiv = document.getElementById("publisherDiv");
			if(publisher.value == "") {
				publisherDiv.innerHTML = "出版社不能为空";
				checkPublisher_ = false;
			} else {
				publisherDiv.innerHTML = "√";
				checkPublisher_ = true;
			}
		}
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "作者不能为空";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "√";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "原价不能为空";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "√";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "格式不对";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "现价不能为空";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "√";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "格式不对";
				checkNowPrice_ = false;
			}
		}
		var checkBooksNum_;
		function checkBooksNum() {
			var booksNum = document.getElementById("booksNum");
			var booksNumDiv = document.getElementById("booksNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(booksNum.value == "") {
				booksNumDiv.innerHTML = "数量不能为空";
				checkBooksNum_ = false;
			} else if(pattern.test(booksNum.value)) {
				booksNumDiv.innerHTML = "√";
				checkBooksNum_ = true;
			} else {
				booksNumDiv.innerHTML = "格式不对";
				checkBooksNum_ = false;
			}
		}
		function add() {
			var s1 = document.getElementById("superTypeId");
			var s2 = document.getElementById("subTypeId");
			var typeDiv = document.getElementById("typeDiv");
			if(s1.value == "0" || s2.value == "0" || s2.value == "") {
				typeDiv.innerHTML = "请匹配大类和小类";
			} else if(!bookName_IsExist && !ISBN_IsExist && checkPages_ && checkPublisher_ && checkAuthor_ && checkPrice_ && checkNowPrice_ && checkBooksNum_) {
				var oForm = document.getElementsByTagName("form")[0];
				oForm.submit();
			}
		}
	</script>

		<link rel="stylesheet" type="text/css" href="Admin/css/body.css">
		<link rel="stylesheet" type="text/css"
			href="Admin/css/td_fontSize.css">
		<style type="text/css">
select {
	font-size: 12px;
}

div {
	color: red;
}

#t1 {
	height: 350px;
	width: 649px;
	text-align: center;
}

.introduce {
	vertical-align: top;
}

input {
	border: solid 1px #cadcb2;
}
</style>
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
								<table id="t1" align="center">
									<tr>
										<td>
											<form action="addBookServlet" method="get">
												<table>
													<tr>
														<td>
															选择类别:
														</td>
														<td>
															大类
															<select id="superTypeId" name="superTypeId"
																onchange="getSubType()">
																<option value="0">
																	--选择大类--
																</option>
																<c:forEach var="superType" items="${superTypes }">
																	<option value="${superType.superTypeId }">
																		${superType.typeName }
																	</option>
																</c:forEach>
															</select>
														</td>
														<td>
															小类
															<select id="subTypeId" name="subTypeId">
																<option value="0">
																	--选择小类--
																</option>
															</select>
														</td>
														<td>
															<div id="typeDiv"></div>
														</td>
													</tr>
													<tr>
														<td>
															书名:
														</td>
														<td>
															<input type="text" id="bookName" name="bookName"
																onblur="checkBookName()" />
														</td>
														<td>
															<div id="bookNameDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															ISBN号:
														</td>
														<td>
															<input type="text" id="ISBN" name="ISBN"
																onblur="checkISBN()" />
														</td>
														<td>
															<div id="ISBNDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td class="introduce">
															相关介绍:
														</td>
														<td colspan="2">
															<textarea rows="3" cols="20" id="introduce"
																name="introduce"></textarea>
														</td>
													</tr>
													<tr>
														<td>
															书的页数:
														</td>
														<td>
															<input type="text" id="pages" name="pages"
																onblur="checkPages()" />
														</td>
														<td>
															<div id="pagesDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															出版社:
														</td>
														<td>
															<input type="text" id="publisher" name="publisher"
																onblur="checkPublisher()" />
														</td>
														<td>
															<div id="publisherDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															作者:
														</td>
														<td>
															<input type="text" id="author" name="author"
																onblur="checkAuthor()" />
														</td>
														<td>
															<div id="authorDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															原价:
														</td>
														<td>
															<input type="text" id="price" name="price"
																onblur="checkPrice()" />
														</td>
														<td>
															<div id="priceDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															现价:
														</td>
														<td>
															<input type="text" id="nowPrice" name="nowPrice"
																onblur="checkNowPrice()" />
														</td>
														<td>
															<div id="nowPriceDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															图片:
														</td>
														<td colspan="2">
															<input type="file" id="picture" name="picture" />
														</td>
													</tr>
													<tr>
														<td>
															数量:
														</td>
														<td>
															<input type="text" id="booksNum" name="booksNum"
																onblur="checkBooksNum()" />
														</td>
														<td>
															<div id="booksNumDiv">
																*
															</div>
														</td>
													</tr>
													<tr>
														<td>
															类型:
														</td>
														<td colspan="2">
															<input type="checkbox" name="hotBooks" value="1" />
															热卖
															<input type="checkbox" name="newBooks" value="1" />
															新品
															<input type="checkbox" name="saleBooks" value="1" />
															特价
															<input type="checkbox" name="specialBooks" value="1" />
															特种书
														</td>
													</tr>
													<tr>
														<td>
															<input type="button" onclick="add()" value="添加" />
														</td>
														<td>
															<font color="red">${message }</font>
														</td>
														<td>
															<div></div>
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