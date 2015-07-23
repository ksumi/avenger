<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<div id="wrap">

			<%@include file="header.jsp"%>
			<div class="center_content">
				<div class="left_content">
					<font color="red">${name} ${loginMessage} ${LoginOutMessage}
						${pleseLoggin}&nbsp;</font> 欢迎你！
					<div class="title">
						<span class="title_icon"><img src="images/tbtj.gif"
								width="490" alt="" title="" />
						</span>
					</div>
					<c:forEach var="flag" items="${specialList}">
						<div class="feat_prod_box">
							<div class="prod_img">
								<a href="showBookByIdServlet?bookId=${flag.bookId}"><img
										src="${flag.picture}" alt="" title="" border="0" />
								</a>
								<p class="price">
									原价：￥${flag.price}
								</p>
								<p class="nowPrice">
									现价：￥${flag.nowPrice}
								</p>
							</div>
							<div class="prod_det_box">
								<div class="box_top"></div>
								<div class="box_center">
									<div class="prod_title">
										内容简介
									</div>
									<p class="details">
										${flag.introduce}
									</p>
									<a href="page?type=4" class="more">- 更多 -</a>
									<a href="showBookByIdServlet?bookId=${flag.bookId}"
										class="more">-详细-</a>
									<div class="clear"></div>
								</div>

								<div class="box_bottom"></div>
							</div>
							<div class="clear"></div>
						</div>
					</c:forEach>
					<div class="title">
						<span class="title_icon"><img src="images/new.gif"
								width="490" alt="" title="" />
						</span>
					</div>
					<c:forEach var="flag" items="${newList}">
						<div class="feat_prod_box">
							<div class="prod_img">
								<a href="showBookByIdServlet?bookId=${flag.bookId}"><img
										src="${flag.picture}" alt="" title="" border="0" />
								</a>
								<p class="price">
									原价：￥${flag.price}
								</p>
								<p class="nowPrice">
									现价：￥${flag.nowPrice}
								</p>
							</div>

							<div class="prod_det_box">
								<div class="box_top"></div>
								<div class="box_center">
									<div class="prod_title">
										内容简介
									</div>
									<p class="details">
										${flag.introduce}
									</p>
									<a href="page?type=2" class="more">- 更多 -</a>
									<a href="showBookByIdServlet?bookId=${flag.bookId}"
										class="more">-详细-</a>
									<div class="clear"></div>
								</div>

								<div class="box_bottom"></div>
							</div>
							<div class="clear"></div>
						</div>
					</c:forEach>

					<div class="title">
						<span class="title_icon"><img src="images/host.gif"
								width="490" alt="" title="" />
						</span>
					</div>
					<c:forEach var="flag" items="${hostList}">
						<div class="feat_prod_box">

							<div class="prod_img">
								<a href="showBookByIdServlet?bookId=${flag.bookId}"><img
										src="${flag.picture }" alt="" title="" border="0" />
								</a>
								<p class="price">
									原价：￥${flag.price}
								</p>
								<p class="nowPrice">
									现价：￥${flag.nowPrice}
								</p>
							</div>

							<div class="prod_det_box">
								<div class="box_top"></div>
								<div class="box_center">
									<div class="prod_title">
										内容简介
									</div>
									<p class="details">
										${flag.introduce }
									</p>
									<a href="page?type=1" class="more">- 更多 -</a>
									<a href="showBookByIdServlet?bookId=${flag.bookId}"
										class="more">-详细-</a>
									<div class="clear"></div>
								</div>

								<div class="box_bottom"></div>
							</div>
							<div class="clear"></div>
							<p>
								&nbsp;
							</p>
						</div>
					</c:forEach>
				</div>
				<!--end of left content-->
				<%@include file="right.jsp"%>
				<!--end of right content-->

				<div class="clear"></div>
			</div>
			<!--end of center content-->

			<%@include file="footer.jsp"%>
		</div>

	</body>
</html>