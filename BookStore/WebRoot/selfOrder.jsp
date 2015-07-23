<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人订单查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="style.css">

  </head>
  
  <body>
  	
	<div id="wrap">		
		<%@include file="header.jsp" %>    
       <div class="center_content">
       	<div class="left_content">
       		<div class="crumb_nav">
           		 <a href="index.jsp">首页</a> &gt;&gt; 个人信息管理中心
            </div>
            <div id="managerTop">
			<table width="450">
				  <tr>
				    <td height="40" colspan="4"><div align="center" class="STYLE2">个人信息管理中心</div></td>
				  </tr>
				  <tr>
				    <td width="140"><a href="updateUserAll">修改完善个人资料</a></td>
				    <td width="70"><div align="center"><a href="updatePassword.jsp">修改密码</a></div></td>
				    <td width="100"><div align="center"><a href="selectOrder">查看订单</a></div></td>
				    <td width="115" height="30"><div align="center"><a href="index.jsp">返回首页</a></div></td>
				  </tr>
			</table>
          </div>
          <div id="orderInfo">
     <table border="solid 1px;">
        <tr><td>订单id</td>
	        <td>真实姓名</td>
	        <td>详细住址</td>
	        <td>邮编</td> 
	        <td>发货状态</td>
	        <td>查看子订单</td>
	    </tr>
	    <c:forEach var="order" items="${list}">
	    	<tr>
			    <td>${order.orderId}</td>
		        <td>${order.recvName}</td>
		        <td>${order.user.address}</td>
		        <td>${order.user.postcode}</td> 
		        <td>${order.flag}</td>
		        <td><a href="son?id=${order.orderId}">查看</a></td>
	    	</tr>
	    </c:forEach>
	    
     </table>
          </div>
        <div class="clear"></div>
        </div><!--end of left content-->
         <%@include file="right.jsp" %>
         <!--end of right content-->
       <div class="clear"></div>
       </div><!--end of center content-->     
      <%@include file="footer.jsp" %> 
</div>
  </body>
</html>
