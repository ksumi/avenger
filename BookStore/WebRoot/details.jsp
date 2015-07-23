<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书籍的详细介绍</title>

<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" href="lightbox.css" type="text/css" media="screen" />
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
</head>
<body>
<div id="wrap">
		<%@include file="header.jsp" %>
		<!-- begin of center_content -->
       <div class="center_content">
       
       <!-- begin of left_content -->
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="index.jsp">首页</a> &gt;&gt; 详细介绍
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>书籍介绍</div>
        	<div class="feat_prod_box_details">
            	<div class="prod_img"><a href="details.jsp"><img src="${book.picture }" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="images/big_pic.jpg" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">基本信息</div>
						<table>
							<tr>
								<td>书籍名称</td>
								<td>${book.bookName}</td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td>${book.ISBN}</td>
							</tr>
							<tr>
								<td>页数</td>
								<td>${book.pages}</td>
							</tr>
							<tr>
								<td>作者</td>
								<td>${book.author}</td>
							</tr>
							<tr>
								<td>出版社</td>
								<td>${book.publisher}</td>
							</tr>
							<tr>
								<td>原价</td>
								<td>${book.price}</td>
							</tr>
							<tr>
								<td>现价</td>
								<td>${book.nowPrice}</td>
							</tr>	
						</table>
                    </div>
                    <a href="buyBooksServlet?bookId=${book.bookId}" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    <div class="box_bottom"></div>                 
                </div>    
            <div class="clear"></div>
            </div>	                    
            <div id="demo" class="demolayout">
                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="">-了解更多-</a></li>
                <li><a class="" href="">-相关书籍-</a></li>
                </ul>
             </div>   
            <div class="tabs-container">
                    <div style="display: block;" class="tab" id="tab1">
                         <p class="more_details"></p>
                            <ul class="list">
                            <li><a href="#">${book.introduce}</li>
                            <li><a href="#">${book.introduce}</a></li>                                       
                            </ul>
                        <p class="more_details"></p>                           
                   </div>	
                   <div style="display: none;" class="tab" id="tab2">
                   
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                                        
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>    
                                    
                   <div class="clear"></div>
               </div>	
            </div>
        <div class="clear"></div>
       
        </div><!--end of left content-->
      	<%@include file="right.jsp" %>
     	 <!--end of center content-->
     	 </div>
   	    <%@include file="footer.jsp" %>    
	</div>
</body>
<script type="text/javascript">
 var tabber1 = new Yetii({
 id: 'demo'
 });
 </script>
</html>