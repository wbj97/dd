<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
			window.parent.location.href = "${path}/front/user/login_form.jsp";
	</script>
</head>
	<body>
	</body>
</html>

