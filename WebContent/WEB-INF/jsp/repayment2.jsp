<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>银行页面所有还款申请</title>
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
		pidcard:$('#s_pidcard').val(),
	    ayear:$('#s_ayear').val(),
	    rapplydate:$('#s_rapplydate').val()
	});		
}

function openEditDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');   
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	
	$("#dlg").dialog("open").dialog("setTitle","编辑还款信息");
	$("#fm").form("load",row);	
	url="updateRactualdate.action?id="+row.id+"&amount="+row.amount+
			"&conumber="+row.conumber+"&total="+row.total+"&ramount="+row.ramount;
	
}

function closeAddDialog(){
	$("#dlg").dialog("close");
	resetValue();
}

function resetValue(){
	$("#ractualdate").val("");	
}
function saveGrade(){
	$("#fm").form("submit",{
		url:url,
		onSubmit: function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
		}
	});
}
</script>
</head>
<body>
<table id="dg" title="申请还款" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
 pagination="true" rownumbers="true" fit="true" fitColumns="true" nowrap="true"   
url="findAllRepaymentInformation.action"
 > 

	<thead>
	<tr >
	        <th field="cb" checkbox="true" >序号</th>
	        <th field="id" >还款编号</th>
	         <th field="conumber" >合同编号</th>
	         <th field="pname">姓名</th>
	          <th field="pidcard" >身份证号</th>
			<th field="ayear" >贷款学年</th>
			<th field="coaccount" >指定账户</th>
			<th field="amount" >贷款金额</th>
			<th field="total" >应还本息</th>
			<th field="ramount" >实际还款</th>		
			<th field="rapplydate" >申请日期</th>	
			<th field="ractualdate" >扣款日期</th>				
		</tr>
	</thead>
</table>
	<div id="toolbar">
		<div>		
			<a href="javascript:openEditDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">填写扣款日期</a>				   
		</div>
		<div>
		<table><tr><td>身份证号&nbsp; <input type="text" name="s_pidcard" id="s_pidcard" width="20px">&nbsp;
		</td><td>贷款学年<input type="text" name="s_ayear" id="s_ayear" style="width: 120px"></td>
		</td><td>申请日期<input type="text" name="s_rapplydate" id="s_rapplydate" style="width: 120px"></td>
		<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		</table> 
	</div>					
	</div>	
	<div id="dlg" class="easyui-dialog" padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
		<td>请选择日期</td>
		<td><input class="easyui-datebox" name="ractualdate"id="ractualdate" /></td>			
		</form>		
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>