<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- bootstroop文件引入 -->
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">    
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div style="background-color: #9fdfbf"><form action="systemSet.action" method="post"> <h2 style="text-align: center;"> 修改个人信息 </h2><br>
 <p> 修改用户名：<input type="text" name="user_name" id="user_name"> </p><br>
<p> 更换邮箱：<input type="text" name="user_email" id="user_email"> </p><br>
<p> 修改密码：<input type="text" name="user_password" id="user_password"> </p><br>
<input type="submit" value="修改">
<input type="hidden" id="user_idcard" name="user_idcard"  value="${usersession.user_idcard}">
        </form>
        </div>
</body>
</html>