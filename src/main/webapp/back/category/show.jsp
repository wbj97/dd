<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<html>
	<head>
		<link rel="stylesheet" href="${path }/back/css/btn.css" />
		<script type="text/javascript" src="${path }/front/js/lightzoom.js"></script>
		<script type="text/javascript">
		 function checkDelete(id,level){
		 	var bn = window.confirm("确认删除吗？");
		 	if(bn){
				location.href = "${path}/category/removeCategory?id="+id+"&level="+level+"";
		 	}		 
		 }
		</script>
	</head>
	<body style="background-color: #f0f9fd;text-align: center;">

		<div style="font-size:25px">类别管理</div><hr/>
		<div style="margin-bottom: 10px;">
			<div class="button btn-p" onclick="location.href='${path }/back/category/add-first.jsp'">添加一级类别&raquo;</div>
			<span><font color = "red">${requestScope.message }</font></span>
			<div class="button btn-p" onclick="location.href='${path }/category/queryAllLevel'">添加二级类别&raquo;</div>
		</div>
		<table bordercolor='#898E90' align='center' border='3px' cellpadding='10px' cellspacing="0px" >
			<tr bgcolor='lightblue'>
				<td>Id</td>
				<td>类别名</td>
				<td>所属类别</td>
				<td>级别</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${requestScope.list }" var="category">
			<tr>
				<td>${category.id }</td>
				<td>${category.cateName }</td>
				<td>${category.category.cateName }</td>
				<td>${category.levels }</td>
				<td>
				<a href = "javascript:;" onclick = "checkDelete('${category.id }' ,'${category.levels }')">
					<div class="button">删除 &raquo;</div>
				</a>
					<%-- <div class="button" onclick="location.href='${path}/category/category_removeCategory?category.id=${category.id }&category.levels=${category.levels }' ">删除 &raquo;</div>	 --%>
				</td>
			</tr>
		</c:forEach>
			
		</table><br/>
		
	</body>  
</html>



