<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有学生信息</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div>
	<div>	
	请输入身份证号：<input type="text" id="s_pidcard" name="s_pidcard">
			<td><a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></td> </tr>
		<form id="fm"  method="post">			
			<table style="text-align: right;">
			<tr>基本信息:</tr>
				<tr>
					<td>姓名</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pname" id="pname" ></td>
					<td>身份证号</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pidcard" id="pidcard"  readonly="readonly"></td>
					<td>身份证有效起始日期</td>
					<td><input class="easyui-datebox" name="pscardtart"
						id="pscardtart" /></td>
				</tr>
				<tr>
					<td>身份证有效结束日期</td>
					<td><input class="easyui-datebox" style="height: 32px"
						name="pcardend" id="pcardend"></td>
					<td>性别</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="psex" id="psex"></td>
					<td>民族</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pnation" id="pnation" /></td>
				</tr>
				<tr>
					<td>毕业中学</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="phighschool" id="phighschool"></td>
					<td>户口性质</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="phukou" id="phukou" /></td>
				</tr>
				<tr>
					<td>资助中心</td>
					<td colspan="6"><input class="easyui-textbox"
						style="width: 800px" name="ploanarea" id="ploanarea" /></td>
				</tr>
				<tr>
					<td>家庭地址</td>
					<td colspan="6"><input class="easyui-textbox"
						style="width: 800px" name="paddress" id="paddress" /></td>
				</tr>
				<tr>
					<td><br>通讯信息:</td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pphone" id="pphone"></td>
					<td>邮箱</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pemail" id="pemail" /></td>
				</tr>
				<tr>
					<td>QQ</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pqq" id="pqq" /></td>
					<td>微信</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pweixin" id="pweixin" /></td>

				</tr>
				<tr>
					<td>
					<br>联系人信息:<br></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="prname" id="prname" /></td>
					<td>手机</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="prphone" id="prphone" /></td>
					<td>身份证号</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pridcard" id="pridcard" /></td>
				</tr>									
			</table>		 
			</form>
			<br><br>共同借款人信息：<br><br>
			<form id="conloaner" method="post">
			<table>
				<tr>
					<td>姓名</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="cname" id="cname" value=""></td>
					<td>身份证号</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="cidcard" id="cidcard"></td>
				</tr>
				<tr>
				<td>身份证有效起始日期</td>
					<td><input class="easyui-datebox" name="cscardtart"
						id="cscardtart" /></td>
					<td>身份证有效结束日期</td>
					<td><input class="easyui-datebox" style="height: 32px"
						name="ccardend" id="ccardend"></td>					
				</tr>
				<tr>
					<td>手机</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="cphone" id="cphone"></td>
					<td>身体健康状况</td>
					<td><input type="radio" name="cbody" id="cbody" value="健康">健康 <input
						type="radio" name="cbody" id="cbody" value="良好">良好</td>
				</tr>
				<tr>
					<td>家庭地址</td>
					<td colspan="6"><input class="easyui-textbox"
						style="width: 800px" name="caddress" id="caddress" /></td>
				</tr>
				<tr>
					<td>户籍地址</td>
					<td colspan="6"><input class="easyui-textbox"
						style="width: 800px" name="coaddress" id="coaddress" /></td>
				</tr>
				<tr><td><input type="hidden" name="user_idcard" id="user_idcard"></td></tr>			
			</table>
		</form>
	</div>	
	
	</div>
</body>
<script type="text/javascript">
function searchGrade(){
	
	$("#fm").form("load","${pageContext.request.contextPath }/loanmanage/findPersonalByPIdCard.action?user_idcard="+$('#s_pidcard').val());
	$("#conloaner").form("load","${pageContext.request.contextPath }/loanmanage/findConloanerByuser_idcard.action?user_idcard="+$('#s_pidcard').val());				
	$('#fm').form('clear');
	$('#conloaner').form('clear');
	
}

</script>
</html>