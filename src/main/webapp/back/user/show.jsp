<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<html>
	<head>
		<link rel="stylesheet" href="${path }/back/css/btn.css" />
	</head>
	<body style="background-color: #f0f9fd;">
		<div align=center style="font-size:25px">用户管理</div><hr/>
		<table bordercolor='#898E90' align='center' border='3px' cellpadding='10px' cellspacing="0px">
			<tr bgcolor='lightblue' align='center'>
				<td>Id</td>
				<td>昵称</td>
				<td>邮箱</td>
				<td>状态</td>
				<td>注册时间</td>
			
			</tr>
			<c:forEach items="${requestScope.list}" var="user">
			<tr align='center'>
				<td>${user.id }</td>
				<td>${user.nickName }</td>
				<td>${user.email }</td>
				<c:if test="${user.status==1 }">
				<td><input class="button" onclick="location.href='${path}/user/modifyUserStatus?id=${user.id }'" value="正常 &raquo;" /></td>
				</c:if>
				<c:if test="${user.status==0 }">
				<td><input class="button" onclick="location.href='${path}/user/modifyUserStatus?id=${user.id }'" value="冻结 &raquo;" /></td>
				</c:if>
				<c:if test="${user.status==2 }">
				<td>未激活</td>
				</c:if>
				<td><fmt:formatDate value="${user.registTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
			</tr>
			</c:forEach>
		</table>
	</body>  
</html>



