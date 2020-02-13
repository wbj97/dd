<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 当当网</title>
		<link href="${path }/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单骤:
			<span class="red_bold">1.确认订单</span> > 2.填写送货地址 > 3.订单成功
		</div>
		<div class="fill_message">

			<table class="tab_login">
				<tr>
					<td valign="top" class="w1" style="text-align: left">
						<b>序号</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品名称</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品单价</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品数量</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>小计</b>
					</td>
				</tr>

				<!-- 订单开始 -->
				<c:set var = "index" value = "0"></c:set>
				<c:forEach items="${sessionScope.cartMap }" var="cartMap" varStatus="s">
					<c:if test="${cartMap.value.status == 1 }">
					<c:set var = "index" value = "${index+1}"> </c:set>
					<tr>
						<td valign="top">
							${index }
						</td>
						<td valign="top">
							${cartMap.value.book.bookName }
						</td>
						<td valign="top">
							${cartMap.value.book.ddPrice }
						</td>
						<td valign="top">
							${cartMap.value.count }
						</td>
						<td valign="top">
							${cartMap.value.subTotal }
						</td>
					</tr>
					</c:if>
					</c:forEach>
				<!-- 订单结束 -->
				<c:if test="${sessionScope.totalPrice !=0 }">
				<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>总价￥${sessionScope.totalPrice }</b>
					</td>
				</tr>
				</c:if>
			</table>
			<br />
			<br />
			<br />
			<div class="login_in">
				<a href="${path }/front/cart/cart_list.jsp">
					<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="取消" />
				</a>
				<c:if test="${sessionScope.currentUser != null }">
				<a href="${path}/address/address_queryAllAddressAction">
					<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="下一步" />
				</a>
				</c:if>	
				<c:if test="${sessionScope.currentUser == null }">
				<a href="${path}/front/user/login_form.jsp?opt=2">
					<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="下一步" />
				</a>
				</c:if>			
			</div>

		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
	
</html>

