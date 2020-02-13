<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var = "path" value = "${pageContext.request.contextPath }" scope="request"></c:set>
<!DOCTYPE html>
<html>
  <head>
    <title>order</title>
	<link rel="stylesheet" href="${path}/back/css/btn.css" />
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
  </head>
  <body style="background-color: #f0f9fd;text-align: center">
  <div align=center style="font-size:25px">订单详细信息</div><hr/>
  	 <table bordercolor='#898E90' align='center' border='3px' cellpadding='5px' cellspacing="0px">
          <tr bgcolor="lightblue" align="center"> 
             <td>订单号：${sessionScope.order.orderNumber }</td>
             <td colspan="2">订单金额：¥：${sessionScope.order.totalPrice }</td>
             <td colspan="2">订单状态：${sessionScope.order.status }</td>
          </tr>
          <c:forEach items="${requestScope.itemList }" var="item">
			<tr align='center'> 
				 <td>${item.bookName }</td>
				 <td style="width: 100px;"><img style="width:32px;height: 20px" src="${path }/upload/${item.bookSrc}"></td>
				 <td style="width: 180px;">单价：¥${item.price }</td>
				 <td style="width: 200px;">小计：¥${item.amount }</td>
				 <td style="width: 100px;">${item.count }本</td>
			</tr>
			</c:forEach>
     </table> 
	<input class="button btn-p" value="返回上级" onclick="history.go(-1);" style="margin-top: 10px"/>
  </body>
</html>
