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
<script type="text/javascript">

</script>
</head>
<body>
<div style="background-color: #9fdfbf">
<form action="authoritySet.action" method="post">请输入用户身份证号：
 <input class="easyui-combobox" name="user_idcard" id="user_idcard" data-options="panelHeight:'auto',
       valueField:'user_id',textField:'user_idcard',method:'get',url:'findUserIdCardList.action'"> 
设置权限：<select name="user_state" id="user_state" style="width:120px;">   
         <option value="学生">学生</option><option value="管理员">管理员</option>   
        </select>
        <input type="submit" value="修改">
        </form> 
        </div>
      
</body>
</html>