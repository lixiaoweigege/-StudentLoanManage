<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贷款发放确认</title>
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
	    astate:$('#s_astate').val()
	});		
}

function openEditDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');   
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑贷款信息");
	$("#fm").form("load",row);
	url="updateAstate.action?id="+row.id;
}
function closeAddDialog(){
	$("#dlg").dialog("close");
	resetValue();
}

function resetValue(){
	$("#gradeName").val("");
	$("#gradeDesc").val("");
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
<table id="dg" title="贷款发放" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
pagination="true" rownumbers="true" fit="true" fitColumns="true" nowrap="true"   url="findAllLoanApply.action"
 > 

	<thead>
	<tr >
	        <th field="cb" checkbox="true" ></th>
	        <th field="id" width="5%">ID</th>
			<th field="pname" width="10%">审贷人姓名</th>
			<th field="pidcard" width="15%">身份证号</th>
			<th field="pcollege" width="10%">大学名称</th>
			<th field="pmajor" width="10%">专业</th>
			<th field="ayear" width="13%">申贷学年</th>
			<th field="aterm" width="7%">贷款期限</th>
			<th field="amount" width="10%">金额</th>
			<th field="astate" width="10%">贷款状态</th>	
			<th field="gaineddate" width="10%">到款日期</th>	
		</tr>
	</thead>
</table>
	<div id="toolbar">
		<div>		
			<a href="javascript:openEditDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">贷款发放记录</a>
			</div>
		<div>
		<table><tr><td>身份证号&nbsp; <input type="text" name="s_pidcard" id="s_pidcard" width="20px">&nbsp;
		</td><td>贷款学年<input type="text" name="s_ayear" id="s_ayear" style="width: 120px"></td>
		</td><td>审核状态<input type="text" name="s_astate" id="s_astate" style="width: 120px"></td>
		<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		</table> 
		</div>				
	</div>
	
	<div id="dlg" class="easyui-dialog" padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		
		<form id="fm" method="post">
			<table style="line-height: 40px">							
			<tr><td>确认贷款是否发放:</td> <td><select name="astate" id="astate" style="width: 100%;height: 100%;">   
         <option value="已发放">已发放</option><option value="未发放">未发放</option>   
        </select></tr>
        <tr><td>到款日期</td><td><input class="easyui-datebox" style="height: 32px"
						name="gaineddate" id="gaineddate"></td>										
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>