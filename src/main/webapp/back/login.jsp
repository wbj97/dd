<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>登录 - 当当网</title>
<link href="${path }/back/css/login.css" rel="stylesheet" type="text/css" />
<link href="${path }/back/css/pop_cheat.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${path }/back//js/jquery-3.3.1.js"></script>
<script type="text/javascript">
		function changeImage(){
			$("#imgVcode").prop("src","${pageContext.request.contextPath }/admin/admin_changeImg?xx="+Math.random());
		}
		function checkName(){
			if($("#txtUsername").val()==""){
				$("#nameErr").html("<font style='color:red'>用户名不可以为空</font>");
				return false;
			}else{
				$("#nameErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkPassword(){
			if($("#txtPassword").val()==""){
				$("#passErr").html("<font style='color:red'>密码不可以为空</font>");
				return false;
			}else{
				$("#passErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkCode(){
			if($("#txtCode").val()==""){
				$("#codeErr").html("<font style='color:red'>验证码不可以为空</font>");
				return false;
			}else{
				$("#codeErr").html("<font style='color:green'>验证成功</font>");
				return true;
			}
		}
		
		function checkForm(){
			if(checkName() & checkPassword() & checkCode())
				return true;
			return false;
		}
</script>
</head>
<body>
	<div class="head">
		<a href="http://www.dangdang.com"> <img src="${path }/back/images/signin_logo.png" /></a>
		<div class="improve">
			<img src="${path }/back/images/bz.jpg" width="178" height="61" />
		</div>
	</div>

	<div class="login_bg" style="width:960px; margin:0 auto;">
		<img src="http://a.dangdang.com/api/data/cpx/img/38930001/1" style="display: none;">
		<div id="J_cheatProofTop" class="new_tip">
			<div id="component_2747856"></div>
			<div>为保障账户安全，请勿设置与邮箱及其他网站相同的账户登录密码或支付密码，<a href="javascript:;">谨防诈骗</a>！</div>
		</div>
		<div class="set_area clearfix">
			<div class="wrap clearfix">
				<div id="J_loginDiv">
					<form action="${path }/admin/admin_Login" onsubmit="return checkForm()" method="post">
						<span style="color:red;font-size: 21px;margin-left: 45px;">${message}</span>
						<div id="J_loginCoreWrap" class="infro">
							<div class="username" id="username_div">
								 <input class="user" id="txtUsername" name="admin.username" onblur = "checkName()" type="text" />
							</div>
							<span id = "nameErr"></span>
							<br /><br />

							<div class="password" id="password_div">
								<input class="pass" id="txtPassword" name="admin.password" onblur = "checkPassword()" type="password" />
							</div>
							<span id = "passErr"></span> 
							<br /> <br />
							<div id="J_captchVcodeWrap" style="" class="Captcha">
								<div class="code" style="width:100px;">
									<input type="text" name="adminCode" onblur = "checkCode()" id = "txtCode"/>
								</div>
								 <span id = "codeErr"></span> 
								<div class="Captcha-operate">
									<div class="Captcha-imageConatiner">
										<a class="code_pic" id="vcodeImgWrap" name="change_code_img" href="javascript:void(0);">
											<img id="imgVcode" src="${pageContext.request.contextPath }/admin/admin_changeImg" class="Ucc_captcha Captcha-image" onClick="changeImage()">
										</a>
										<a id="vcodeImgBtn" name="change_code_link" class="code_picww" href="javascript:changeImage()">换张图</a> 
										<span id="spn_vcode_ok" class="icon_yes pin_i" style="display: none;"></span> 
										<span id="J_tipVcode" class="cue warn"></span>
									</div>
								</div>
							</div>
							<br /> <br />

							<p class="btn">
								<input id="submitLoginBtn" type="submit" value="登&nbsp;录" />
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>