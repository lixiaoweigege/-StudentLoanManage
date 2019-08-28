<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- bootstroop文件引入 -->
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
input{border: none;}
table input{height: 100%;width: 100%;}
</style>
</head>
<body>
<a href="auditing.action">返回审核页面<<</a>
	<div style="width: 794px;height: 1123px;padding: 27px;background-color:  #e5fff5" >
	${msg}
		<!--startprint-->
		<form id="fm" method="post" enctype="multipart/form-data">
	<h6>合同编号:${msg2}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	贷款学年<input type="text"  id="ayear" name="ayear"></h6>
	 <h2 style="text-align: center;">高校助学贷款借款合同</h2> <br>
			<table border="1" style="text-align: center;">
			甲方(借款学生)：<tr><td width="120px">姓名</td><td width="140px"><input type="text" width="50px" id="pname" name="pname"> </td> 
			          <td width="90px">身份证号</td><td><input type="text"  id="pidcard" name="pidcard"></td>
			           <td >联系电话：</td><td width="150px"><input type="text"   id="pphone" name="pphone"></td>
			</tr>
			<tr><td>就读高校名称</td><td colspan="3""><input type="text" width="50px" id="pcollege" name="pcollege"> </td> 
			          <td width="90px">入学年份</td><td><input type="text"  id="pyear" name="pyear"></td>			          
			</tr>			
			</table>
			<table border="1" style="text-align: center;">
			甲方(共同借款人)：<tr><td width="120px">姓名</td><td width="140px"><input type="text" width="50px" id="cname" name="cname"> </td> 
			          <td width="90px">身份证号</td><td><input type="text"  id="cidcard" name="cidcard"></td>
			           <td >与学生关系</td><td width="150px"><input type="text"   id="relative" name="relative"></td>
			</tr>
			<tr><td>详细通讯地址</td><td colspan="3""><input type="text" width="50px" id="caddress" name="caddress"> </td> 
			          <td width="90px">联系电话</td><td><input type="text"  id="cphone" name="cphone"></td>			          
			</tr>			
			</table>
			<table border="1" style="text-align: center;">
			乙方(国家开发银行)：<tr><td width="120px">经办分行</td><td width="280px"><input type="text" width="50px" id="cobank" name="cobank"> </td> 
			          <td width="90px">联系电话</td><td width="280px"><input type="text"  id="cobankphone" name="cobankphone"></td>
			         
			</tr>
			<tr><td>详细通讯地址</td><td colspan="3"><input type="text" width="50px" id="cobankaddress" name="cobankaddress"> </td> 			           
			</tr>			
			</table>
			<table border="1" style="text-align: center;">
			丙方(受托机构)：<tr><td width="120px">受托机构名称</td><td width="280px"><input type="text" width="50px" id="coentrust" name="coentrust"> </td> 
			          <td width="90px">联系人</td><td colspan="2" width="280px"><input type="text"  id="coentrustcontacts" name="coentrustcontacts"></td>
			         
			</tr>
			<tr><td>详细通讯地址</td><td colspan="2"><input type="text" width="50px" id="coentrustaddress" name="coentrustaddress"> </td>
			<td width="100px">联系电话</td><td><input type="text" width="50px" id="coentrustphone" name="coentrustphone"> </td> 			           
			</tr>			
			</table>
			<h5 style="text-align: center;">正文</h5>
			<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp根据中华人民共和国法律、法规及相关政策，经各方协商一致，订立本借款合同(简称“本合同”)。除本合同另有说明外，甲方指借款学生和共同借款人双方。</p>
		    <h5>第一条 借款及期限</h5>
		<p>借款金额：人民币<input height="20px" type="text" id="amount" name="amount">元(大写：<input type="text" id="amountchinese" name="amountchinese">);借款期限：借款发放日起，至<input type="text" id="coendyear" name="coendyear" value="${coendyear}" readonly="readonly" width="60px">年9月20日止。 </p>
		     <h5>第二条 账户开立</h5>
		   <p>甲方委托乙方为其开立支付宝账户(简称“指定账户”)用于乙方借款发放、资金划付和本息回收。指定账户：<input type="text" id="coaccount" name="coaccount">。</p>  
		<h5>第三条 借款用途</h5>
		<p>借款用途：限于甲方(借款学生)在高校就读期间支付学费、住宿费，剩余部分可用于生活废，不得挪用。</p>
		<h5>第四条 借款利率</h5>
		<p>按照借款发放时中国人民银行公布的人民币贷款同期同档次基准利率<input type="text" id="cointerestrate" name="cointerestrate"> (每年12月21日根据最新基准利率调整一次。乙方不再另行通知)，甲方在校学习期间利息由国家财政贴息，自毕业(或结业)当年9月1日起自己负担利息。</p>
		<h5>第五条 违约责任</h5>
		<p>甲方未按本合同约定期限足额归还借款本息的，乙方将根据逾期金额和逾期天数计收罚息，罚息利率为本合同借款利率的130%</p>
		<h3>签字</h3>
		<p>本合同签字各方特此声明并已确认完整阅读并充分理解本合同的全部条款及内容：  </p>
		<table>
		<tr><td colspan="2" width="360px">甲    方：</td><td width="180px">乙方（合同专用章）：</td><td width="180px">丙方（公章）：</td> </tr>
		<tr><td>借款学生：<br>（签字）</td><td>借款学生：<br>（签字）</td><td>法定代表人：<br> &nbsp</td> <td>法定代表人：<br> &nbsp</td></tr>
		<tr><td><br> 日期：</td><td><br>日期：</td><td><br>日期：</td><td><br>日期：</td></tr>
		</table>		
		</form>
		<!--endprint-->
	</div>
	<button id="button1">打印</button>
	<a href="javascript:saveGrade()" class="easyui-linkbutton"
			iconCls="icon-ok">保存合同</a>
</body>
<script type="text/javascript">
$(document).ready(function(){//表单回显	
	$("#fm").form("load","${pageContext.request.contextPath }/findPersonalAndConloanerById.action?id="+'${msg}');
});
	function saveGrade() {
		var myform = document.getElementById("fm"); //获得form表单对象
		for (var i = 0; i < myform.length; i++) { //循环form表单
			if (myform.elements[i].value == "") { //判断每一个元素是否为空
				alert(myform.elements[i].title + "表格不能为空！");
				myform.elements[i].focus(); //元素获得焦点
				return;
			}
		}
		$("#fm").form("submit", {
			url : "${pageContext.request.contextPath }/addContract.action?id="+'${msg}'+"&conumber="+"${msg2}",
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(data) {
				data = eval("(" + data + ")");
				if (data.success) {
					$.messager.alert("提示", "提交成功", "info");
				} else {
					$.messager.alert("提示", "提交失败：" + data.msg, "error");
				}
			}
		});
	}

	$("#button1").click(function() {
		//绑定数据
		bindData()

		//备份body
		var body = window.document.body.innerHTML;
		//备份title
		var title = document.getElementsByTagName('title')[0].innerHTML;
		//获取要打印的内容
		bdhtml = window.document.body.innerHTML;
		//alert(bdhtml);
		sprnstr = "<!--startprint-->"; //开始打印标识字符串有17个字符
		eprnstr = "<!--endprint-->"; //结束打印标识字符串
		prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17); //从开始打印标识之后的内容
		prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//截取开始标识和结束标识之间的内容
		window.document.body.innerHTML = prnhtml;
		window.print();
		window.document.body.innerHTML = bdhtml;
	});
	//将表单中手动填写的数据进行绑定，便于html()的时候获取到
	function bindData() {
		//搞定 type=text, 同时如果checkbox,radio,select>option的值有变化, 也绑定一下, 这里忽略button
		$("input,select option").each(function() {
			$(this).attr('value', $(this).val());
		});

		//搞定 type=checkbox,type=radio 选中状态
		$("input[type='checkbox'],input[type='radio']").each(function() {
			if ($(this).attr('checked'))
				$(this).attr('checked', true);
			else
				$(this).removeAttr('checked');
		});

		//搞定select选中状态
		$("select option").each(function() {
			if ($(this).attr('selected'))
				$(this).attr('selected', true);
			else
				$(this).removeAttr('selected');
		});

		//搞定 textarea
		$("textarea").each(function() {
			$(this).html($(this).val());
		});

	}
</script>
</html>