<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>free-css-templates-211</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function enable(){
		var terms = document.getElementById("terms");
		var register = document.getElementById("register");
		if(terms.checked){
			register.disabled=false;
		}
	}
	function checkName(){
		var patrn=/^[^`~!@#$%^&*()+-=|\\\[\]\{\}:;\'\,.<>/? 0-9]{2,19}$/; 
		if (!patrn.exec(s)){
			 
			 return false;
		}else{	 
			 return true;
		}
	}
	function checkAll(){
		document.register_form.register.submit();
	}
</script>
</head>
<body>
<div id="wrap">
		
		<%@include file="header.jsp" %>    
       <div class="center_content">
       	<div class="left_content">
       		<div class="crumb_nav">
           		 <a href="index.jsp">首页</a> &gt;&gt; 注册
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>注册账号</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            
            </p>
            	
              	<div class="contact_form">
                <div class="form_subtitle">创建新账号</div>
                 <form name="register_form" action="register" method="post">          
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input type="text" id="name" name="name" class="contact_input" />
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input type="password" id="password1" name="password" class="contact_input" />
                    </div> 
					
					<div class="form_row">
                    <label class="contact"><strong>确认密码:</strong></label>
                    <input type="password" id="password2" name="password" class="contact_input" />
                    </div> 
					
                    <div class="form_row">
                    <label class="contact"><strong>电子邮件:</strong></label>
                    <input type="text" id="email" name="email" class="contact_input" />
                    </div>

					<div class="form_row">
                    <label class="contact"><strong>真实姓名:</strong></label>
                    <input type="text" id="trueName" name="trueName" class="contact_input" />
                    </div>
					
					<div class="form_row">
                    <label class="contact"><strong>性别:</strong></label>
                    <input type="radio" name="sex" checked="checked"/>男
                    <input type="radio" name="sex"  />女
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>出生日期:</strong></label>
                    <input type="text" id="birthday" name="birthday" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>地址:</strong></label>
                    <input type="text" id="address" name="address" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>邮政编码:</strong></label>
                    <input type="text" id="mailCode" name="mailcode" class="contact_input" />
                    </div>
					
                    <div class="form_row">
                    <label class="contact"><strong>固定电话:</strong></label>
                    <input type="text" id="phone" name="phone" class="contact_input" />
                    </div>
                    
                     <div class="form_row">
                    <label class="contact"><strong>移动电话:</strong></label>
                    <input type="text" id="mphone" name="mphone" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>密码问题提示:</strong></label>
                    <input type="text" id="question" name="question" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>问题答案:</strong></label>
                    <input type="text" id="answer" name="answer" class="contact_input" />
                    </div>                  

                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" id="terms" name="terms" onclick="enable()" />
                        我同意你的所有 <a href="">条款</a>                        </div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="button" id="register" name="register" class="register" value="注册" disabled="disabled" onclick="checkAll()" />
                    </div>   
                  </form>     
                </div>           
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