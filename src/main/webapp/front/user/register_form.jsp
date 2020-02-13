<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 当当网</title>
		<link href="${path }/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			function changeImg(){
				$("#imgVcode").prop("src","${path}/user/user_changeImg?xx="+new Date().getTime());
			}
			function checkEmail(){
					/*判断邮箱的正则表达式  */
					var email = "^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$";
					//判断邮箱是否合法
					if($("#txtEmail").val() == ""){
						$("#emailInfo").text("邮箱不可以为空");
					}else{
						if(!$("#txtEmail").val().match(email)){
							$("#emailInfo").text("邮箱填写错误");
							return false;
						}else{
							$("#emailInfo").html("<font style = 'color:green'>验证通过</font>");
							return true;
						} 
					}
				}
			
			
			function checkNickName(){
				/* 判断昵称的正则表达式 */
					var nickName = "^[\u4E00-\u9FA5A-Za-z0-9]+$";
					//判断昵称是否合法
					if($("#txtNickName").val()==""){
						$("#nameInfo").text("昵称不可为空");
					}else{
						if (!$("#txtNickName").val().match(nickName)) {
							$("#nameInfo").text("昵称中含有特殊字符");
						}else{
							if ( $("#txtNickName").val().length < 4 || $("#txtNickName").val().length > 20) {
								$("#nameInfo").text("昵称长度不在规定范围内");
								return false;
							}else {
								$("#nameInfo").html("<font style = 'color:green'>验证通过</font>");
								return true;
							}
						}
					}
				}
				
			function checkPassword(){
				/* 判断密码的正则表达式 */
					var password = "^[\u4E00-\u9FA5A-Za-z0-9]+$";
					/*判断密码是否合法  */
					if($("#txtPassword").val() == ""){
						$("#passwordInfo").text("密码不可以为空");
					}else{
						if(!$("#txtPassword").val().match(password)){
							$("#passwordInfo").text("密码不合法");
						}else{
							if($("#txtPassword").val().length<6 || $("#txtPassword").val().length >20){
								$("#passwordInfo").text("密码长度不再规定范围内");
								return false;
							}else{
								$("#passwordInfo").html("<font style = 'color:green'>验证通过</font>");
								return true;
							}
						}
					}			
				}	
			
			function checkRepeatPass(){
				/* 判断密码的正则表达式 */
					var repeatPass = "^[\u4E00-\u9FA5A-Za-z0-9]+$";
					/*判断密码是否合法  */
					if($("#txtRepeatPass").val()==""){
						$("#password1Info").text("密码不可以为空");
					}else{
						if(!$("#txtRepeatPass").val().match(repeatPass)){
							$("#password1Info").text("密码不合法");
						}else{
							if($("#txtRepeatPass").val().length<6 || $("#txtPassword").val().length >20){
								$("#password1Info").text("密码长度不再规定范围内");
							}else{
								if($("#txtRepeatPass").val()==$("#txtPassword").val()){
									$("#password1Info").html("<font style = 'color:green'>验证通过</font>");
									return true;
								}else{
									$("#password1Info").text("两次密码输入的不一致");
									return false;
								}
							}
						}
					}
			}
			function checkCode(){
				if($("#txtVerifyCode").val()==""){
					$("#numberInfo").text("验证码不可以为空");
					return false;
				}else{
					$("#numberInfo").html("<font style = 'color:green'>验证通过</font>");
					return true;
				}
				
			}
			/* 页面加载后的判定 */
			$(function(){
				/* 邮箱的判定 */
				$("#txtEmail").blur(checkEmail);
				
				/* 昵称的判定 */
				$("#txtNickName").blur(checkNickName);
					
				/* 密码的判定 */
				$("#txtPassword").blur(checkPassword);
				
				/* 判断密码是否一致 */
				$("#txtRepeatPass").blur(checkRepeatPass);
				
				/* 判断验证码是否为空 */
				$("#txtVerifyCode").blur(checkCode);
				
});
		function submitCheck() {
			if (checkEmail() & checkNickName() & checkPassword() & checkRepeatPass() & checkCode())
				return true;
			return false;
		}	
			  
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤:
			<span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="${path}/user/user_registerUserAction" onsubmit="return submitCheck()" id="f">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login" >
					<tr>
						<td valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td>
							<input name="user.email" type="text" id="txtEmail" class="text_input"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
								</p>
									<span id="emailInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在当当网的昵称：
						</td>
						<td>
							<input name="user.nickName" type="text" id="txtNickName"  class="text_input" />
							<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，
								</p>
								<p>
									长度4－20个字符，一个汉字为两个字符。
								</p>
								<span id="nameInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="user.password" type="password" id="txtPassword"  class="text_input" />
							<div class="text_left" id="passwordValidMsg">
								<p>
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</p>
								<span id="passwordInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="password1" type="password" id="txtRepeatPass" class="text_input"/>
							<div class="text_left" id="repeatPassValidMsg">
							<span id="password1Info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							验证码：
						</td>
						<td>
							<img class="yzm_img" id='imgVcode' onclick = "changeImg()" src="${path }/user/user_changeImg" />
							<input name="number" type="text" id="txtVerifyCode" class="yzm_input"/>
							<div class="text_left t1">
								<p class="t1">
									<span id="vcodeValidMsg">请输入图片中的四个字母。</span>
									<span id="numberInfo" style="color:red"></span>
									<a href="javascript:void(0)" id="changeImg" onclick = "changeImg()">看不清楚？换个图片</a>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

					<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="注 册"/>
				</div>
				<strong><font style="color:red">
					<c:if test="${!requestScope.message.equals('success') }">
						${requestScope.message }
					</c:if>
				</font></strong>
			</form>
		
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

