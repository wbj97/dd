<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>登录 - 当当网</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${path }/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${path}/front/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		function checkEmail(){
		var email = "^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$";
			if($("#txtEmail").val()==""){
				$("#emailInfo").html("<font style = 'color:red'>邮箱不可以为空</font>");
				return false;
			}else if(!$("#txtEmail").val().match(email)){
				$("#emailInfo").html("<font style='color:red'>邮箱格式不正确</font>");
				return false;
			}else{
				$("#emailInfo").html("<font style = 'color:green'>验证通过</font>");
				return true;
			}
		}
		
			function checkPassword(){
				/* 判断密码的正则表达式 */
					var password = "^[\u4E00-\u9FA5A-Za-z0-9]+$";
					/*判断密码是否合法  */
					if($("#txtPassword").val() == ""){
						$("#passwordInfo").html("<font style = 'color:red'>密码不可以为空</font>");
					}else{
						if(!$("#txtPassword").val().match(password)){
							$("#passwordInfo").html("<font style = 'color:red'>密码不合法</font>");
						}else{
							if($("#txtPassword").val().length<6 || $("#txtPassword").val().length >20){
								$("#passwordInfo").html("<font style = 'color:red'>密码长度不再规定范围内</font>");
								return false;
							}else{
								$("#passwordInfo").html("<font style = 'color:green'>验证通过</font>");
								return true;
							}
						}
					}			
				}	
		function checkForm(){
			if(checkEmail() & checkPassword())
				return true;
			return false;
		}
	</script>
	</head>
	<body>


		<%@include file="../common/head1.jsp"%>

		<div class="enter_part">

			<%@include file="../common/introduce.jsp"%>

			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
					
					</div>
					<div class="main">
						<h3>
							登录当当网
						</h3>

						<form method="post" onsubmit = "return checkForm()" action="${path }/user/user_loginUserAction?opt=<%=request.getParameter("opt") %>" id="ctl00">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input type="text" name="user.email" onblur = "checkEmail()" id="txtEmail" class="textbox" />
								</li>
									<span id = "emailInfo"></span>
								<li>
									<span class="blank">密码：</span>
									<input type="password" name="user.password" onblur = "checkPassword()" id="txtPassword" class="textbox" />
								</li>
									<span id = "passwordInfo"></span>
								<li>
									<input type="submit" id="btnSignCheck" class="button_enter" value="登 录" />
								</li>
							</ul>
							<strong><font style="color:red">${requestScope.message }</font></strong>
							<a href = "${path }/user/user_getSingCodeAction?user.email=${requestScope.user.email}">若未激活请点击</a>
							<input type="hidden" name="uri" value="${uri}" />
						</form>
					</div>
					<div class="user_new">
						<p>
							您还不是当当网用户？
						</p>
						<p class="set_up">
							<a href="${path }/front/user/register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>

	</body>
</html>

