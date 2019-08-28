<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- bootstroop文件引入 -->
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">    
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
h2{
		margin:0 auto;
		text-align: center;
	}
td{height: 50px}
input{width: 250px;height: 100%;text-align: center;}	
</style>
</head>
<body>
<div style="background: #e0ebeb">
<form id="fm" method="post" enctype="multipart/form-data">
<table  border="1" style="text-align: center;">
 <tr><td colspan="5"> <h2>助学贷款申请表</h2> </td></tr>
 <tr><td rowspan="6" width="120px">学生</td> </tr>  
    <tr>
      <td width="120px">姓名</td><td><input type="text" name="pname" id="pname" readonly="readonly"></td>
      <td>身份证号</td><td><input type="text" name="pidcard" id="pidcard" readonly="readonly"></td>    
    </tr>
    <tr><td>家庭地址</td>
    <td colspan="4"><input input type="text" name="paddress"  id="paddress"  style="width:100%" readonly="readonly"></td>
    </tr>
    <tr>
      <td>毕业中学</td><td><input type="text" name="phighschool"  id="phighschool" readonly="readonly"></td>
      <td>联系电话</td><td><input type="text" name="pphone" id="pphone" readonly="readonly"></td>
    </tr>
    <tr>
      <td>高校名称</td><td><input type="text" name="pcollege"  id="pcollege" readonly="readonly"></td>
      <td>专业</td><td><input type="text" name="pmajor" id="pmajor" readonly="readonly"></td>
    </tr>
    <tr>
      <td>入学年份</td><td><input type="text" name="pyear"  id="pyear" readonly="readonly"></td>
      <td>毕业年份</td><td><input type="text" name="pendyear" id="pendyear" readonly="readonly"></td>
    </tr>
    <tr><td rowspan="4">共同借款人</td></tr>
    <tr><td>姓名</td><td><input type="text" name="cname"  id="cname" readonly="readonly"></td>
        <td>与学生关系</td><td><input type="text" name="relative"  id="relative" ></td>
    </tr>
    <tr><td>身份证号</td><td><input type="text" name="cidcard"  id="cidcard" readonly="readonly"></td>
        <td>联系电话</td><td><input type="text" name="cphone"  id="cphone" readonly="readonly"></td>
    </tr>
    <tr><td>居住地址</td>
    <td colspan="4"><input input type="text" name="caddress"  id="caddress" style="width:100%" readonly="readonly"></td>
    </tr>
    <tr><td rowspan="4">贷款信息</td></tr>
    <tr><td>贷款金额</td><td><input type="text" name="amount"  id="amount" ></td>
        <td>申贷学年</td><td><input type="text" name="ayear"  id="ayear" readonly="readonly"></td>
    </tr>
    <tr><td>贷款期限</td>
        <td><select name="aterm" id="aterm" style="width: 100%;height: 100%;">   
        <option value="1">1年</option><option value="2">2年</option><option value="3">3年</option>   
        <option value="4">4年</option><option value="5">5年</option> 
        <option value="6">6年</option><option value="7">7年</option><option value="8">8年</option> 
        <option value="9">9年</option><option value="10">10年</option><option value="11">11年</option>
        <option value="12">12年</option><option value="13">13年</option><option value="14">14年</option>           
        </select></td>
        <td>诚信成绩单</td><td><input type="file" name="agrade"  id="agrade"  multiple="multiple"></td>
    </tr>
    <tr>
       <td>申贷原因</td>
       <td colspan="4"><textarea rows="4" cols="3" name="areason" id="areason" style="width: 100%;height: 100%"></textarea></td>
    </tr>
</table>
</form>
</div>
<div align="center"><a href="javascript:saveGrade()" class="easyui-linkbutton"
			iconCls="icon-ok">提交申请</a>
			
</div>
</body>
<script type="text/javascript">
$(document).ready(function() { 
	//表单回显	
	$("#fm").form("load","${pageContext.request.contextPath }/findPersonalAndConloaner.action?user_idcard="+'${usersession.user_idcard}');		
});
function saveGrade() {
	 var myform = document.getElementById("fm");   //获得form表单对象
     for(var i=0;i<myform.length;i++){               //循环form表单
           if(myform.elements[i].value==""){          //判断每一个元素是否为空
                 alert(myform.elements[i].title+"表格不能为空，请填写申请信息，若不能编辑，请完善个人信息！");
                 myform.elements[i].focus();             //元素获得焦点
                 return ;
           }
     }	
	$("#fm").form("submit", {

		url : "${pageContext.request.contextPath }/insertLoanapply.action",
		onSubmit : function() {
			return $(this).form("validate");
		},
		success : function(data) {
			data = eval("("+data+")");
			if(data.success){
			$.messager.alert("提示","提交成功,请在我的贷款查看申请进度","info");
		}else{
				$.messager.alert("提示","提交失败："+data.msg,"error");
			}
		}
	});
}
</script>
</html>