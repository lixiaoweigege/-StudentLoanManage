<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贷款记录</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- bootstroop文件引入 -->
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">    
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
div{float: left;}
</style>
</head>
<body>
 <table id="dg" title="个人贷款记录" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
 rownumbers="true" fit="true" nowrap="false"  url="loanrecordfindAll.action?pidcard=${usersession.user_idcard}"
 > 

	<thead>
	<tr>
	        
					
			<th field="ayear" width="15%">申贷学年</th>
			<th field="aterm" width="10%">贷款期限</th>
			<th field="amount" width="10%">金额</th>
			<th field="cname" width="10%">共同借款人</th>
			<th field="cphone" width="25%">借款人联系方式</th>
			<th field="astate" width="40%">贷款状态</th>
		</tr>
	</thead>
</table>
</body>
</html>