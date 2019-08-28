<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>
<body>
<div>
	<div>
		<form id="fm" action="${pageContext.request.contextPath }/upDatePersonal.action" method="post">
			
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
					<td><input class="easyui-validatebox" style="height: 25px"
						name="pphone" id="pphone" validType="phonevalid"></td>
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
					<td><input class="easyui-validatebox" style="height: 25px"
						name="prphone" id="prphone" validType="phonevalid"/></td>
					<td>身份证号</td>
					<td><input class="easyui-validatebox" style="height: 25px"
						name="pridcard" id="pridcard" validType="idcardvalid"/></td>
				</tr>
				<tr>
					<td>
					<br>高校信息:<br></td>
				</tr>
				<tr>
					<td>高校名称</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pcollege" id="pcollege" /></td>
					<td>院系</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pdept" id="pdept" /></td>
					<td>专业</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pmajor" id="pmajor" /></td>
				</tr>
				<tr>
					<td>入学年份</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="pyear" id="pyear" /></td>
					<td>学号</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="psno" id="psno" /></td>
					<td>毕业时间</td>
					<td><input class="easyui-datebox" style="height: 32px"
						name="pendyear" id="pendyear" /></td>
				</tr>
			</table>
			
			<button type="submit" class="easyui-linkbutton" iconCls="icon-ok">保存</button>		 
			</form>
	</div>	
	
	</div>
</body>
<script type="text/javascript">


$(document).ready(function() { 
		//表单回显
		
		$("#fm").form("load","${pageContext.request.contextPath }/findPersonalByPIdCard.action?user_idcard="+'${usersession.user_idcard}');
		
		
	});
$.extend($.fn.validatebox.defaults.rules, {
	  idcardvalid: {// 验证身份证
        validator: function (value) {           	  
               var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",
              		  23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",
              		  37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",
              		  50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",
              		  63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};                                                             
                if(!value || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[0,1,2])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)?$/i.test(value)){                    	 
              	  return false;                       
                }if(!city[value.substr(0,2)]){                    	
              	 return false;                          
                }//18位身份证需要验证最后一位校验位
                if(value.length == 15){
              	  return true;
                }
                if(value.length == 18){
                        value = value.split('');
                        //∑(ai×Wi)(mod 11)
                        //加权因子
                        var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2,1 ];
                        //校验位
                        var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                        var sum = 0;
                        var ai = 0;
                        var wi = 0;
                        for (var i = 0; i < 17; i++){
                            ai = value[i];
                            wi = factor[i];
                            sum += ai * wi;
                        }
                        var last = parity[sum % 11];
                        if(parity[sum % 11] != value[17]){                           	 
                      	  return false;                                 
                        }else{                            	  
                      	  return true;
  					}
                    } 
        },
                                 
         message: "身份证格式错误"
    },

    phonevalid: {
	validator: function(value){
		var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
		var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
		if(isMob.test(value)||isPhone.test(value)){
		       return true;
		   }
		   else{			   
		       return false;
		   }
	},
	message: "号码格式有误"
}
});

</script>
</html>