<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改完善个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">
  function test(){
    var cc = document.getElementById("tu");
    var slecCC= document.getElementById("tuid").value;
        cc.src = slecCC ;
  }
  
  //电话号码批对
  function checkpp(){
   var patten = /^\d{11}$/;
	     var phone = document.getElementById("phone").value ;
	     var phoneDiv = document.getElementById("phoneDiv1");
	         phoneDiv.style.color ="red" 
	         if(phone==""){
	          return true ;
	         }else if (patten.test(phone)){
	            phoneDiv.innerHTML = "√";
	             return true ;
	         }else{
	            phoneDiv.innerHTML = "格式不对";
	             return false ;
	         }
  }
  
	  function checkPhone(){
	     var patten = /^\d{11}$/;
	     var phone = document.getElementById("mphone").value ;
	     var phoneDiv = document.getElementById("phoneDiv");
	         phoneDiv.style.color ="red" 
	         if(phone==""){
	          return true ;
	         }else if (patten.test(phone)){
	            phoneDiv.innerHTML = "√";
	             return true ;
	         }else{
	            phoneDiv.innerHTML = "格式不对";
	             return false ;
	         }
	  }
	  //邮编批对
	  function checkPcode(){
	     var patton =/^\d{6}$/ ;
	     var pcode = document.getElementById("postcode").value ;
	     var pcodeDiv = document.getElementById("pcodeDiv");
	         pcodeDiv.style.color = "black";
	     if(pcode==""){
	       return true ;
	     }else if(patton.test(pcode)){
	         pcodeDiv.innerHTML = "√";
	           return true ;
	     }else {
	           pcodeDiv.innerHTML ="格式不对";
	             return false ;
	     }
	  }
	    //刷新验证码
	  function checkSrc(){
	    var srcImg = document.getElementById("src");
	    srcImg.src = "src";
	  }
	  
	   //验证码AJAX
	  function checkcodeIsText(){
	   if(window.XMLHttpRequest){
	       req = new XMLHttpRequest();
	     }else if (window.ActiveXObject){
	       req = new ActiveXObject("Microsoft.XMLHTTP");
	     }
	     req.onreadystatechange = callBackBycode;
	     var code = document.getElementById("code").value;
	     url = "checkcode?code="+code;
	      req.open("get",url,true);
	     req.send(null);
	  }
	  function callBackBycode(){
	     var dom = req.responseXML;
	     var text = dom.getElementsByTagName("text");
	     var va =  text[0].firstChild.data;
	    document.getElementById("idDiv").innerHTML = va ;
	    if(va=='√'){
	       return true ;
	    }else{
	      return false ;
	    }
	  }
	    //验证码批对
	  function checkCode(){
	  var ptton = /^\d{4}$/;
	  var cc = document.getElementById("code").value ;
	  var codeDiv = document.getElementById("idDiv");
	      codeDiv.style.color="white";
	       if(cc==""){
	        return true ;
	   }else if(ptton.test(cc)){
	       checkcodeIsText();
	   }else{
	         codeDiv.innerHTML = "验证码格式不对";
	   }    
	  }
	  
	  function checkForm(){
	   if(checkpp()&& checkPhone() && checkPcode() && checkCode()){
	     document.form.submit();
	  }
	  }
</script>
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
         
         <div>
         	<form action="updateUserTwo" method="post" id="form" name="form" >
    <div align="center">
      <fieldset>
        <legend>会员资料修改表</legend>
        <table>
        <tr>
          <td>积分： </td>
           <td>${user.score}</td>
        </tr>
          <tr>
            <td>用户名：</td>
              <td>${user.name} </td>
           </tr>
          <tr>
            <td>密 码：</td>
            <td>${user.password}</td>
           </tr>
          <tr>
            <td>E-mail：</td>
              <td><input type="text" name="email" value="${user.email}"  /> </td>
           </tr>
          <tr>
            <td>真 名：</td>
            <td><input type="text" name="trueName" value="${user.trueName}"  /> </td>
           </tr>
          <tr>
            <td>性 别：</td>
              <td>
                 <input type="radio" name="sex" value="男" checked="checked" />男${user.sex}
                 <input type="radio" name="sex" value="女"  />女            
              </td>
           </tr>
          <tr>
            <td>生 日：</td>
              <td><input type="text" name="birthday" value="${user.birthday}"  /> </td>
           </tr>
          <tr>
            <td>地 址：</td>
              <td><input type="text" name="address" value="${user.address}"  /> </td>
           </tr>
          <tr>
            <td>邮 编：</td>
              <td><input type="text" name="postcode" id="postcode" value="${user.postcode}" onblur="checkPcode()" /><div id="pcodeDiv">请正确输入6位邮编</div></td>
           </tr>
          <tr>
            <td>座 机：</td>
              <td><input type="text" name="phone" id="phone" value="${user.phone} " onblur="checkpp()" /> <div id="phoneDiv1">请正确输入区号和电话号码</div> </td>
           </tr>
          <tr>
            <td>手 机：</td>
             <td><input type="text" name="mphone" id="mphone"  value="${user.mphone}" onblur="checkPhone()" /><div id="phoneDiv">请正确输入11位数的手机号码</div> </td>
           </tr>
          <tr>
            <td>安全问题：</td>
              <td><select name="question">
              		<option value="${user.question}">${user.question }</option>
                  	<option value="我是谁" />我是谁
                    <option value="我的生日是" />我的生日是
                  </select>              </td>
           </tr>
          <tr>
            <td>安全答案：</td>
            <td><input type="text" name="answer" value="${user.answer}"  /> </td>
           </tr>
          <tr>
            <td>验证码：<img src="code" alt="验证码" onclick="checkSrc()" /> </td>
              <td><input type="text" name="code" size="6" id="code" onblur="checkCode()" /><div id="idDiv">点击刷新</div></td>
           </tr>
          <tr>
            <td><input type="button" value=" 确定" onclick="checkForm()" /> </td>
              <td><input type="reset" value=" 取消" /></td>
           </tr>
        </table>
      </fieldset>
    </div>
  </form>
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
