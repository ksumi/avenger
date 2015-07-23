<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@include file="common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书高级搜索</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="style.css" />
  <script type="text/javascript">
  	var req;
		function selectedSuper(){
			if(window.XMLHttpRequest){//Mozillia
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){//IE
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置回调函数
			req.onreadystatechange = callback;
			var superTypeId = document.getElementById("superType").value;
			var url = "showSubTypeServlet?superTypeId="+superTypeId;
			req.open("get",url,true);
			var price1 = document.getElementById("price1");
  			var price2 = document.getElementById("price2");
  			var other = document.getElementById("other");
  			other.style.visibility = "hidden";
  			price1.style.visibility = "hidden";
  			price2.style.visibility = "hidden";
			req.send(null);
		}
		function clearSubType(){
			var subT = document.getElementById("subT");
			subT.length=0;
		}
		function callback(){
			var state = req.readyState;
			var subT = document.getElementById("subT");
			if(state==4 && req.status==200){
			clearSubType();
			var dom = req.responseXML;
			var subType = dom.getElementsByTagName("subType");
			for(i=0;i<subType.length;i++){
				var subTypeId = subType[i].getElementsByTagName("subTypeId")[0];
				var subTypeName = subType[i].getElementsByTagName("subTypeName")[0];
				var subValue = subTypeId.firstChild.data;
				var subText = subTypeName.firstChild.data;
				subT[i] = new Option(subText,subValue);
			}
			}
		}
  	function getSM(){
  		var searchMethod = document.getElementById("searchMethod").value;
  		if(searchMethod=="noChoice"){
  			alert("请选择查询方式");
  		}else if(searchMethod=="price"){
  			var price1 = document.getElementById("price1");
  			var price2 = document.getElementById("price2");
  			var other = document.getElementById("other");
  			other.style.visibility = "hidden";
  			price1.style.visibility = "visible";
  			price2.style.visibility = "visible";
  		}else {
  			var price1 = document.getElementById("price1");
  			var price2 = document.getElementById("price2");
  			var other = document.getElementById("other");
  			other.style.visibility = "visible";
  			price1.style.visibility = "hidden";
  			price2.style.visibility = "hidden";
  		}
  	}
	function checkDetails(){
		var superType = document.getElementById("superType");
		var subT = document.getElementById("subT");
		var upLoadTime = document.getElementById("upLoadTime");
		var searchMethod = document.getElementById("searchMethod");

		if(superType.value != "noChoice" && subT.value != "noChoice" && searchMethod.value != "noChoice" && upLoadTime.value != "noChoice"){
			if(searchMethod.value=="price"){
				var prices = document.getElementById("prices");
				if(prices.value != "noChoice"){
					document.detailSearch.submit();
				}
			}else {
				var content = document.getElementById("content");
				if(content.value != "noChoice"){
					document.detailSearch.submit();
				}
			}
		}else {
			alert("请选择好你的查询条件!!");
		}
	}
  </script>
  </head>
  
  <body>
    		<div id="wrap"> 
		 
			<!-- the begin of header -->
			<%@include file="header.jsp"%>
			<!-- the end of header -->
			
			<!-- the begin of content -->
			<div class="center_content">
				<!-- the begin of left -->
					<div>
						<div>图书高级搜索</div>
						<div>
						<form action="detailSearch" method="post" name="detailSearch">
							<table>
								<tr>
									<td>所属大类：</td>
									<td>
										<select id="superType" name="superType" onchange="selectedSuper()">
											<option value="noChoice">--请选择大类--</option>
											<c:forEach var="flag" items="${superList}">
						  					<option value="${flag.superTypeId}">${flag.typeName}</option>
						  					</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>所属小类：</td>
									<td>
										<select id="subT" name="subT">
											<option value="noChoice">--请选择小类--</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>请选择查询方式</td>
									<td>
										<select name="searchMethod" id="searchMethod" onchange="getSM()">
											<option value="noChoice">--请选择查询方式--</option>
											<option value="bookName">按书名查询</option>
											<option value="author">按作者查询</option>
											<option value="publisher">按出版社查询</option>
											<option value="ISBN">按ISBN查询</option>
											<option value="price">按价格查询</option>
										</select>
									</td>
									<td id="other" style="visibility: hidden;"><input type="text" name="content" id="content" /></td>
									<td style="visibility:hidden" id="price1">定价：</td>
									<td style="visibility: hidden;" id="price2">
										<select id="prices" name="prices">
											<option value="noChoice">--请选择价格范围--</option>
											<option value="0-50">50元以下</option>
											<option value="50-100">50-100元</option>
											<option value="100-200">100-200元</option>
											<option value="大于200">200元以上</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>上架时间：</td>
									<td>
										<select id="upLoadTime" name="upLoadTime">
											<option value="noChoice">--请选择上架时间--</option>
											<option value="3">近三天</option>
											<option value="7">近一个星期</option>
											<option value="15">近半个月</option>
											<option value="30">近一个月</option>
											<option value="大于30">一个月以上</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="button" value="提交" onclick="checkDetails()" /></td>
								</tr>
							</table>
						</form>
						</div>
					</div>
				<div class="clear"></div>
			</div>
			
			
			<!--end of center content-->
			<%@include file="footer.jsp"%>
		</div>
  </body>
</html>
