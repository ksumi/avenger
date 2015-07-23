<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'findAnswer.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function checkAnswer(){
			var answer = document.getElementById("answer");
			if(answer.value==""){
				alert("答案不能为空！");
			}else{
				document.f1.submit();
			}
		}
	</script>
  </head>
  
  <body>
  	  	<div id="wrap">
		<%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
       		
       		<form action="findAnswer" method="get" name="f1">
       			<table>
       				<tr>
       					<td class="form_row"><strong> 你的安全问题是：${user.question}</strong></td>
       					<td class="form_row"></td>
       				</tr>
       				
       				<tr>
       					<td class="form_row">请输入你的答案：</td>
       					<td class="form_row"><input type="text" id="answer" name="answer" class="contact_input" /></td>
       				</tr>
       				<tr>
       					<td>&nbsp;</td>
       					<td id="checkName">&nbsp;</td>
       				</tr>
       				<tr>
       					<td>&nbsp;</td>
       					<td class="form_row"><input type="button" class="register" value="提交" onclick="checkAnswer()" /></td> 
       				</tr>
       			</table>  
		    </form>
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
