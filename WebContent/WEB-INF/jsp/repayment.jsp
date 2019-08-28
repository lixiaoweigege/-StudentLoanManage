<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人还款申请</title>
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
	$("#dlg").dialog("open").dialog("setTitle","编辑还款信息");
	$("#fm").form("load",{conumber:row.conumber,ayear:row.ayear,
		coaccount:row.coaccount,amount:row.amount,total:row.total,ramount:row.total});	
	url="addRepayment.action";
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
<table id="dg" title="申请还款" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
 rownumbers="true" fit="true" fitColumns="true" nowrap="true"   
url="findRepaymentInformation.action?pidcard=${usersession.user_idcard}"
 > 

	<thead>
	<tr >
	        <th field="cb" checkbox="true" ></th>
	        <th field="conumber" width="15%">贷款编号</th>
			<th field="ayear" width="15%">贷款学年</th>
			<th field="coaccount" width="20%">指定账户</th>
			<th field="amount" width="10%">贷款金额</th>
			<th field="gaineddate" width="10%">到款日期</th>
			<th field="coendyear" width="10%">贷款到期时间</th>
			<th field="cointerestrate" width="10%">利息</th>
			<th field="total" width="10%">应还本息</th>		
		</tr>
	</thead>
</table>
	<div id="toolbar">
		<div>		
			<a href="javascript:openEditDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">申请还款</a>				   
		</div>					
	</div>
	
	<div id="dlg" class="easyui-dialog" 
		closed="true" buttons="#dlg-buttons">
		<form id="fm">
		<table>
		<tr><td>贷款编号</td>
		    <td><input type="text" id="conumber" name="conumber" readonly="readonly"/></td>	
		    <td>贷款学年</td>
		    <td><input type="text" id="ayear" name="ayear" readonly="readonly"/></td>		        		    
		</tr>	
		<tr>
		 <td>账户</td>
		    <td><input type="text" id="coaccount" name="coaccount" readonly="readonly"/></td>
		     <td>贷款金额</td>
		    <td><input type="text" id="amount" name="amount" readonly="readonly"/></td>		
		</tr>
		<tr>
		<td>应还本息</td>
			<td><input type="text" id="total" name="total" readonly="readonly"/></td>
		<td>编辑还款金额</td>
		<td><input type="text" id="ramount" name="ramount" /></td>		    		     		      
		</tr>				
		</form>		
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>