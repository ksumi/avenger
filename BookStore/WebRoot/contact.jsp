<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关于我们1</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">&nbsp; 
 
	   <!-- header -->
	   <%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>联系我们</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            如果你对本店有什么疑问，有什么号的建议或是有什么不满，你都可以通过填写以下信息，把你想说的都说出来，我们一定会回复。让你满意！！
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">所需填写的信息</div>          
                    <div class="form_row">
                    <label class="contact"><strong>真实姓名:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>电子邮件:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>电话:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>公司:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>信息:</strong></label>
                    <textarea class="contact_textarea" ></textarea>
                    </div>

                    
                    <div class="form_row">
                    <a href="http://www.865171.cn" class="contact">发送</a>                    </div>      
                </div>  
            
          </div>	
     
        <div class="clear"></div>
        </div><!--end of left content-->
        <%@include file="right.jsp" %> 
       <div class="clear"></div>
       </div><!--end of center content-->
       <%@include file="footer.jsp"%>  

</div>

</body>
</html>