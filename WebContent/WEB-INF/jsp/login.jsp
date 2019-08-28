<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="icon" href="image/apple (2).png">
<style type="text/css">
#login {
	background-image: url(image/login2.jpg);
	position: static;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}

#left {
	position: relative;
	left: 10%;
	top: 100px;
	height: 300px;
	width: 300px;
	background: #ffe5e5;
	opacity: 0.6;
	text-align: center;
	line-height: 30px;
}

body {
	height: 100%;
	padding: 0;
	margin: 0;
	overflow: hidden;
}



</style>
</head>
<body id="login">

	<div id="left">
		
		<form action="${pageContext.request.contextPath }/login.action"
			method="post">
			<table align="center" style="font-size: 20px;"  >
			    <tr>
			    <td colspan="3" align="center">个人用户登陆<br><br></td>
			    </tr>
				<tr>
					<td>用户名</td>
					<td colspan="2"><input type="text" name="username" style="height: 30px;"
					placeholder="请输入用户名"></td>
				</tr>
				<tr>
					<td>密&nbsp&nbsp&nbsp码</td>
					<td colspan="2"><input type="password" name="password" 
						style="height: 30px" placeholder="请输入密码"></td>
				</tr>
                <tr>
					<td>验证码</td>
                    <td colspan="1"><input type="text"  name="userCode" style="width: 60px;height: 30px"></td> 
					<td align="left" colspan="1"> <img  src="${pageContext.request.contextPath }/imageCode.action"  height="25px" width="80px"   id="img" onclick="changeImage()" /></td>
				</tr>
				<tr>
					<td colspan="3" style="height: 80px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button"
						value="注册" style="height: 40px; width: 60px" onclick="window.open('register.action')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input
						type="submit" value="登录" style="height: 40px; width: 60px"></td>

				</tr>
				<tr>
					<td style="text-align: center;" colspan="3"><font color="red">${msg}</font></td>
				</tr>

			</table>
		</form>
	</div>

	</div>
</body>
<script type="text/javascript">
function changeImage() {
	var image=document.getElementById("img");
	image.src="${pageContext.request.contextPath }/imageCode.action?a="+new Date().getTime();
}
</script>
</html>