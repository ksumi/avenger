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
		<title>管理图书</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="Admin/css/body.css">
		<link rel="stylesheet" type="text/css"
			href="Admin/css/td_fontSize.css">
		<link rel="stylesheet" type="text/css" href="Admin/css/tab.css">
		<style type="text/css">
table {
	text-align: center;
	margin: 0px;
	padding: 0px;
}
</style>
		<script type="text/javascript">
		function selectAll() {
			var deletes =document.getElementsByName("delete");
			var selectAll = document.getElementById("selectAll");
			for(var i = 0;i<deletes.length;i++) {
				if(selectAll.checked == true) {
				 	deletes[i].checked = true;
				}
				else {
					deletes[i].checked = false;
				}
			}
		}
		
		function removeBook(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var books = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					books.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("还没有选中删除项");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteBookServlet?bookIds="+books+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
		function searchBook(pageOffset,pageSize) {
			var bookName = document.getElementById("bookName");
			var searchDiv = document.getElementById("searchDiv");
			var oform = document.getElementsByTagName("form")[0];
			if(bookName.value != "") {
				oform.action = "getBookByBookNameServlet?bookName="+bookName.value;
				oform.submit();
			} else {
				searchDiv.innerHTML = "请输入关键字";
			}	
		}
	</script>
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

								<div align="left">
									按书名查询:
									<input type="text" id="bookName" name="bookName">
									<input type="button" value="查询"
										onclick="searchBook(${bookPager.pageOffset},${bookPager.pageSize})">
									<div id="searchDiv" style="display: inline"></div>
								</div>

								<table width="99%" border="0" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#c0de98">
									<tr>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											图书ID
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											图书名
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											介绍
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											原价
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											现价
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											新商品
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											打折商品
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											热卖商品
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											数量
										</th>
										<th background="Admin/images/tab_14.gif" class="STYLE1">
											<input type="checkbox" id="selectAll" onclick="selectAll()">
											全/反选
										</th>
									</tr>
									<form method="post" name="deleteForm">
										<c:forEach var="book" items="${ bookList}">
											<tr>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.bookId }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.bookName }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													<textarea rows="4" cols="20">${book.introduce }</textarea>
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.price }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.nowPrice }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.newBooks }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.saleBooks }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.hostBooks }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													${book.bookNum }
												</td>
												<td bgcolor="#FFFFFF" class="STYLE2">
													<input type="checkbox" name="delete"
														value="${book.bookId }">
												</td>
											</tr>
										</c:forEach>
									</form>
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
										<td>
											<pg:pager items="${bookPager.totalNum }"
												maxPageItems="${bookPager.pageSize}"
												export="currentPageNo = pageNumber"
												url="getBookPagerServlet">
												<pg:param name="pageSize" value="${bookPager.pageSize }" />
												<pg:param name="pageNo" value="${currentPageNo}" />
												<pg:first>
													<a href="${pageUrl}"><img src="Admin/images/first.gif"
															border="0">
													</a>
												</pg:first>
												<pg:prev>
													<a href="${pageUrl}"><img src="Admin/images/back.gif"
															border="0" />
													</a>
												</pg:prev>
												<pg:pages>
													<c:choose>
														<c:when
															test="${bookPager.pagecurrentPageNo eq pageNumber}">
															<font color="red">${pageNumber}</font>
														</c:when>
														<c:otherwise>
															<a href="${pageUrl}">${pageNumber}</a>
														</c:otherwise>
													</c:choose>
												</pg:pages>
												<pg:next>
													<a href="${pageUrl}"><img src="Admin/images/next.gif"
															border="0" />
													</a>
												</pg:next>
												<pg:last>
													<a href="${pageUrl}"><img src="Admin/images/last.gif"
															border="0" />
													</a>
												</pg:last>
											</pg:pager>
										</td>
										<td colspan="1" align="right">
											<input type="button" value="删除"
												onclick="removeBook(${bookPager.pageOffset},${bookPager.pageSize})">
										</td>
										<td width="14">
											<img src="Admin/images/tab_22.gif" width="14" height="29" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>

</html>
