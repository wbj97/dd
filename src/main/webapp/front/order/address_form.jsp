<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 当当网</title>
		<link href="${path }/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
		function changeAddress(){
			location.href = "${path}/address/address_queryOneAdressAction?id="+$("#address").val();
		}
		//收件人姓名检查
		function checkName(){
			if($("#receiveName").val() == ""){
				$("#nameErr").text("名字不可以为空");
				return false;
			}else{
				$("#nameErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}	
		
		//判断详细地址
		function checkDetail(){
			if($("#fullAddress").val() == ""){
				$("#detailErr").text("地址不可以为空");
				return false;
			}else{
				$("#detailErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkZipCode(){
			if($("#postalCode").val() == ""){
				$("#zipCodeErr").text("邮编不可为空");
				return false;
			}else{
				$("#zipCodeErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkPhone(){
			if($("#phone").val()==""){
				$("#phoneErr").text("手机不可为空");
				return false;
			}else{
				$("#phoneErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkMobile(){
			if($("#mobile").val()==""){
				$("#mobileErr").text("座机不可为空");
				return false;
			}else{
				$("#mobileErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkForm(){
			if(checkName() & checkDetail() & checkZipCode() & checkMobile() & checkPhone())
				return true;
			return false;
		}
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单骤: 1.确认订单 >
			<span class="red_bold"> 2.填写送货地址</span> > 3.订单成功
		</div>
		<div class="fill_message">
			<p>
				选择地址：
				<select id="address"  onchange = "changeAddress()">
					<option value="0">
						填写新地址
					</option>
					<c:forEach items="${requestScope.list}" var="add">
					<option value="${add.id }"  ${add.id == address.id?'selected':'' } >${add.detail }</option>
					</c:forEach>
				</select>
			</p>
			<form name="ctl00" method="post" onsubmit="return checkForm()" action="${path }/address/address_insertUpdateAddressAction?address.id=${address.id == null ?'0':address.id}" id="f">
				<input type="hidden" name="id" id="addressId" />

				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收件人姓名：
						</td>
						<td>
							<input type="text" class="text_input" name="address.name" onblur="checkName()" id="receiveName" value = "${address.name }"/>
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的收件人姓名
									<span id = "nameErr" style = "color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人详细地址：
						</td>
						<td>
							<input type="text" name="address.detail" class="text_input" onblur="checkDetail()" id="fullAddress" value = "${address.detail }"/>
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的收件人的详细地址
									<span id = "detailErr" style = "color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码
						</td>
						<td>
							<input type="text" class="text_input" name="address.zipCode" onblur="checkZipCode()" id="postalCode" value = "${address.zipCode }"/>
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的收件人的邮政编码
									<span id = "zipCodeErr" style = "color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							电话
						</td>
						<td>
							<input type="text" class="text_input" name="address.phone" onblur="checkPhone()" id="phone" value = "${address.phone }"/>
							<div class="text_left" id="phoneValidMsg">
								<p>
									请填写有效的收件人的电话
									<span id = "phoneErr" style = "color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							手机
						</td>
						<td>
							<input type="text" class="text_input" name="address.mobile" onblur="checkMobile()" id="mobile" value = "${address.mobile }"/>
							<div class="text_left" id="mobileValidMsg">
								<p>
									请填写有效的收件人的手机
									<span id = "mobileErr" style = "color:red"></span>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">
					<a href="${path }/front/order/order_info.jsp">
						<input id="btnClientRegister" class="button_1" name="submit" type="button" value="取消" />
					</a>	
					<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="下一步" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
		<!-- <script type="text/javascript">
			var user = "<c:out value='${sessionScope.currentUser}' />";
			if (user == '')
				location.href = '${path}/front/user/login_form.jsp?opt=2';
			else
				location.href = '${path}/address/address_queryAllAddressAction';
		</script> -->
	</body>
</html>

