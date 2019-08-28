<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link id="themeLink" rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: black
}
</style>
</head>
<body>
	<div class="easyui-layout" style="width: 100%; height: 800px;">
		<div region="north" style="height: 80px; background-color: #E0EDFF ;" >		
		<div style="float: right; margin-right: 10px">当前用户： ${usersession.user_name}</div> 				
		<div id="themesDiv" >
		    <a href="javascript:void(0)" id="mb" class="easyui-menubutton"
					data-options="menu:'#Themesmeus',iconCls:'icon-edit'">切换风格</a><br>
			<a style="float: right; margin-right: 55px" href="${pageContext.request.contextPath }/logout.action">退出系统</a>			
				<div id="Themesmeus" style="width: 150px;">
					<div>default</div>
					<div>gray</div>
					<div>black</div>
					<div>bootstrap</div>
					<div>material</div>
					<div>metro</div>
				</div>
			</div>
			<div style="text-align: center;"><font  size="6px">银行助学贷款管理系统</font></div>
		</div>
		
		<!-- 左边 -->
		<div region="west" style="width: 200px" title="导航菜单" split="true">
			<div id="aa" class="easyui-accordion" style="width: 100%;"
				data-options="border:0,multiple:true">
				<div title="申请" data-options="iconCls:'icon-more'"
					style="overflow: auto">
					<ul style="list-style-type: none; line-height: 30px; margin-left: -25px">						
						<li><a href="javascript:void(0)" pageUrl="applyhelp.action">申请流程</a></li>
						<li><a href="javascript:void(0)" pageUrl="loanapply.action">贷款申请</a></li>
					</ul>
				</div>
				<div title="我的贷款" data-options="iconCls:'icon-more'">
					<ul
						style="list-style-type: none; line-height: 30px; margin-left: -25px">
						<li><a href="javascript:void(0)" pageUrl="loanrecord.action">
								贷款申请记录</a></li>
						<li><a href="javascript:void(0)" pageUrl="repayment.action">还款申请</a></li>
						<li><a href="javascript:void(0)" pageUrl="repaymentrecord.action">还款记录</a></li>
					</ul>
				</div>
				<div title="信息修改" data-options="iconCls:'icon-more',selected:true">
					<ul
						style="list-style-type: none; line-height: 30px; margin-left: -25px">
						<li><a href="javascript:void(0)" pageUrl="personal.action">
								个人信息</a></li>
						<li><a href="javascript:void(0)" pageUrl="conloaner.action">共同借款人信息</a></li>
					</ul>
				</div>
				<ul style="list-style-type: none; line-height: 30px; margin-left: -25px">
						<li ><a href="javascript:void(0)" pageUrl="systemset.action">系统设置</a></li>
				</ul>
				
			</div>
		</div>
		<!-- 中央 -->
	<div region="center">
		<div id="tt" class="easyui-tabs" fit="true" border="false">
			<div title="首页">欢迎使用</div>
	</div>
	<!-- 底部 -->
	<div region="south">南</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){	
		var pidcard="${usersession.user_idcard}";		
		$.ajax({
			url:"findPersonalOverdueInformation.action",
			type:"post",
			data:{"pidcard":pidcard},
			success:function(result){
			if(result>0){
				$.messager.alert('逾期提醒','您有'+result+"条贷款已逾期未还清，逾期将影响您的征信信息，请及时还款",'warning');
			}
		}});
	
});
    $(function(){
	//给a标签绑定时间
	$("a[pageUrl]").click(function(){
		//1.获取pageUrl属性值（需要跳转的页面地址）
		var pageUrl = $(this).attr("pageUrl");
		//获取a标签的内容，标题
		var title = $(this).text();

		//2.判断是否存在指定标题的选项卡
		if( $("#tt").tabs("exists",title)  )  {
			//3.如果存在，则选项该选项卡
			$("#tt").tabs("select",title);				
		}else{
			//4.如果不存在，则添加选项卡
			$("#tt").tabs("add",{
				title:title,
				content:"<iframe src='"+pageUrl+"' width='100%' height='100%' frameborder='0'><iframe>",
				closable:true
			});				
		}
	});
	//点击切换模块菜单的时候，进行切换模块
	$("#Themesmeus").menu({
		onClick:function(item){
			//1.获取需要改变的模块名称
			var themeName = item.text;
			
			//2.获取link标签的href属性
			var href= $("#themeLink").attr("href");
			
			//3.更改href的属性值
			// easyui/themes/default/easyui.css
			href = href.substring(0,href.indexOf("themes"))+"themes/"+themeName+"/easyui.css";
			
			//4.更新link的href属性
			$("#themeLink").attr("href",href);
		}
	});
})
</script>
</html>