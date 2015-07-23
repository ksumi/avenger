<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@include file="common.jsp"%>
<div id="leftTop">
	<select id="superType">
		<option value="noSuper">
			--请选择大类--
		</option>
	</select>
	<select id="subType">
		<option value="noSub">
			--请选择小类--
		</option>
	</select>
	<select id="searchMethod">
		<option value="all">
			--请选择查询方式--
		</option>
		<option value="bookName">
			按书籍名称
		</option>
		<option value="author">
			按作者名称
		</option>
		<option value="publisher">
			按出版社名称
		</option>
		<option value="price">
			按价格查询
		</option>
	</select>
</div>