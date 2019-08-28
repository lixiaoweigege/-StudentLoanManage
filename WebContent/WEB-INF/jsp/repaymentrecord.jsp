<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人还款记录</title>
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
		conumber:$('#s_conumber').val(),
	    ayear:$('#s_ayear').val(),
	   
	});		
}

function openEditDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');   
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑审核信息");
	$("#fm").form("load",row);
	$("#GradeFile").form("load",row);
	url="updateAstate.action?id="+row.id;
}
function openContract(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	//实现页面的跳转
	   window.location.href='openContract.action?id='+row.id;
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
<table id="dg" title="还款记录" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
pagination="true" rownumbers="true" fit="true" fitColumns="true" nowrap="true"  
 url="findRepaymentRecord.action?pidcard=${usersession.user_idcard}"
 > 

	<thead>
	<tr >
	        <th field="cb" checkbox="true" ></th>
	        <th field="id" width="7%">还款编号</th>
	        <th field="conumber" width="15%">合同编号</th>
	        <th field="ayear" width="13%">贷款学年</th>			
			<th field="coaccount" width="17%">指定账户</th>
			<th field="amount" width="8%">贷款金额</th>
			<th field="total" width="8%">本息</th>
			<th field="ramount" width="8%">还款金额</th>
			<th field="nowarrears" width="8%">欠款</th>
			<th field="rapplydate" width="8%">申请日期</th>
			<th field="ractualdate" width="8%">扣款日期</th>		
		</tr>
	</thead>
</table>
	<div id="toolbar">
		
		<div>
		<table><tr><td>合同编号&nbsp; <input type="text" name="s_conumber" id="s_conumber" width="20px">&nbsp;
		</td><td>贷款学年<input type="text" name="s_ayear" id="s_ayear" style="width: 120px"></td>
		
		<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		</table> 
		</div>				
	</div>
	
	<div id="dlg" class="easyui-dialog" padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="GradeFile" action="findGradeFile.action" method="post"><table>
		<tr><td><input type="text" id="pname" name="pname" style="display: none;"/></td>
		    <td><input type="text" id="pidcard" name="pidcard" style="display: none;"/></td>
		     <td><input type="text" id="ayear" name="ayear" style="display: none;"/></td>
		</tr>
		<tr><td>查看并保存诚信考试成绩单：<input type="submit" value="查看"></td>
			</table>		
		</form>
		<form id="fm" method="post">
			<table style="line-height: 40px">						
			<tr><td>审核意见:</td> <td><select name="astate" id="astate" style="width: 100%;height: 100%;">   
         <option value="待审核">待审核</option><option value="驳回申请">驳回申请</option><option value="通过审核">通过审核</option>   
        </select></tr>										
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>