<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有贷款逾期记录</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- bootstroop文件引入 -->
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">    
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
function searchGrade(){
	$('#dg').datagrid('load',{
		coendyear:$('#s_coendyear').val(),	   
	});		
}

</script>
</head>
<body>
<table id="dg" title="申请还款" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
 pagination="true" rownumbers="true" fit="true" fitColumns="true" nowrap="true"   
url="findAllOverdueInformation.action"
 > 

	<thead>
	<tr >
	        <th field="cb" checkbox="true" >序号</th>	        
	         <th field="conumber" >合同编号</th>
	         <th field="pname">姓名</th>
	         <th field="pidcard" >身份证号</th>
	         <th field="pphone" >联系电话</th>
	          <th field="cname" >共同借款人</th>
	           <th field="cphone" >联系电话</th>
			<th field="ayear" >贷款学年</th>
			<th field="coaccount" >指定账户</th>
			<th field="amount" >贷款金额</th>
			<th field="coendyear">到期时间</th>
			<th field="nowarrears" >逾期金额</th>								
		</tr>
	</thead>
</table>
<div id="toolbar">		
		</td><td>到期时间<input type="text" name="s_coendyear" id="s_coendyear" style="width: 120px"></td>
		<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		</table> 
	</div>	
</body>
</html>