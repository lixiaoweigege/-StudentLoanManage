<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有贷款记录</title>
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
	    pname:$('#s_pname').val(),
	    
	});		
}

function deleteContract(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			var idStr = "";
				//遍历数据
				$(selectedRows).each(function(i){
					idStr+=("id="+selectedRows[i].id+"&");
				});				
				idStr = idStr.substring(0,idStr.length-1);
			$.post("deleteContract.action",idStr,function(result){
				if(result.success){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].gradeName+'</font>'+result.errorMsg);
				}
			},"json");
		}
	});
}
</script>
</head>
 <body>
      <table id="dg" title="贷款审核" class="easyui-datagrid"   autoRowHeight="true" toolbar="#toolbar"
pagination="true" rownumbers="true" fit="true" fitColumns="true" nowrap="true"   url="findAllLoanRecord.action"
 > 

	<thead data-options="frozen:true">
	<tr >
	         <th field="cb" checkbox="true" ></th>
	        <th field="conumber" >合同编号</th>
	        <th field="ayear" >申请学年</th>
			<th field="pname" >申贷人姓名</th>
			<th field="pidcard" >身份证号</th>
			<th field="pphone" >联系电话</th>
			<th field="pcollege" >大学名称</th>	
			<th field="pyear" >入学年份</th>	
	</tr>
	</thead>
	<thead>
	<tr>
			<th field="cname" >共同借款人姓名</th>
			<th field="relative" >关系</th>
			<th field="cidcard" >身份证号</th>
			<th field="caddress" >通讯地址</th>
			<th field="cphone" >联系电话</th>			
			<th field="cobank" >经办分行</th>
			<th field="cobankphone" >联系电话</th>
			<th field="cobankaddress" >详细地址</th>
			<th field="coentrust" >受托机构</th>
			<th field="coentrustcontacts" >联系人</th>	
			<th field="coentrustaddress" >通讯地址</th>
			<th field="coentrustphone" >联系电话</th>
			<th field="amount" >借款金额</th>
			<th field="amountchinese" >金额大写</th>
			<th field="coendyear" >贷款截至日期</th>
			<th field="coaccount" >账号</th>
			<th field="cointerestrate" >利率</th>			
		</tr>
	</thead>
</table>
	<div id="toolbar">
	 
		<div>
		<a href="javascript:deleteContract()" class="easyui-linkbutton" iconCls="icon-remove"plain="true" >删除</a>
		<table><tr><td>身份证号&nbsp; <input type="text" name="s_pidcard" id="s_pidcard" width="20px">&nbsp;
		</td><td>姓名<input type="text" name="s_pname" id="s_pname" style="width: 120px"></td>
		<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		</table> 
		</div>				
	</div>
</body>
<script type="text/javascript">

</script>
</html>