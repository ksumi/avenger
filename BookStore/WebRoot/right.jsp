<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@include file="common.jsp" %>
   	 <div class="right_content">
   	 			<div id="news">
   	 				<marquee direction="up" height="130px;" style="padding-top: 20px;" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" >
   	 					<ul>
   	 						<c:choose>
   	 							<c:when test="${empty informList }">
   	 								<font color="red">暂时还没有广告</font>
   	 							</c:when>
   	 							<c:otherwise>
   	 								<c:forEach var="inform" items="${informList}">
   	 									<li><a href="#">主题：${inform.informTitle}</a>&nbsp;&nbsp;&nbsp;&nbsp;[${inform.informTime}]</li>
   	 								</c:forEach>
   	 							</c:otherwise>
   	 						</c:choose>	
   	 					</ul>
   	 				</marquee>
   	 			</div>
              <div>
              	 <img src="images/border.gif" />
              </div> 
                <div class="loginDiv">
                 <form name="login" action="login" method="post">          
					<fieldset>
						<legend id="loginTitle">账号登录</legend>
						<table>
							<tr>
								<td>账号：</td>
								<td><input type="text" name="name" /></td>
							</tr>
							<tr>
								<td>密码：</td>
								<td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="cookie" />记住密码</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><input type="submit" class="register" value="登录" /></td>
								<td><a class="register" href="register.jsp">注册</a></td>
							</tr>
							<tr>
								<td style="padding-left: 55px;"><img src="images/mail.png" name="mail" /></td>
								<td><a href="PwdIndex.jsp">忘记密码?点击这里找回密码.</a></td>
							</tr>
						</table>
					</fieldset>    
                  </form>     
                </div> 
              <div>
              	 <img src="images/border.gif" />
              </div> 
             <div class="right_box">
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>特价书&nbsp;&nbsp;<a href="page?type=3" class="more">-更多-</a></div> 
                   <c:forEach var="flag" items="${saleList}">
                    <div class="new_prod_box">
                        <a href="details.jsp">${flag.bookName}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="showBookByIdServlet?bookId=${flag.bookId}"><img src="${flag.picture}" alt="" title="" class="thumb" border="0" /></a>
                        <p class="price">原价：￥${flag.price}</p>
                 		<p class="nowPrice">现价：￥${flag.nowPrice}</p>
                        </div>           
                    </div>
                   </c:forEach>
             </div>
             
             <div class="right_box">
             	<div class="title"><span class="title_icon"><img src="images/categories.gif" alt="" title="" /></span>书籍分类</div> 
                <div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>外语书籍</div> 
                <ul class="list">
                <li><a href="">基础英语</a></li>
                <li><a href="">高级英语</a></li>
                <li><a href="">商务英语</a></li>
                <li><a href="">英语口语</a></li>
                <li><a href="">其它英语</a></li>                                           
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>文学艺术</div> 
                
                <ul class="list">
                <li><a href="">港台文学</a></li>
                <li><a href="">外国文学</a></li>
                <li><a href="">青春文学</a></li>
                <li><a href="">文学评论  </a></li>                      
                </ul>      
				<p>&nbsp;</p>
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>IT技术</div> 
                
                <ul class="list">
                <li><a href="">软件工程</a></li>
                <li><a href="">程序设计</a></li>
                <li><a href="">操作系统</a></li>
                <li><a href="">图形图像</a></li>                      
                </ul>      
            </div>  