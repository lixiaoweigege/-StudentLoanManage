<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form id="fm" method="post">
			<table>
				<tr>
					<td>姓名</td>
					<td><input class="easyui-textbox" style="height: 32px"
						name="cname" id="cname" value=""></td>
					<td>身份证号</td>
					<td><input class="easyui-validatebox" style="height: 25px"
						name="cidcard" id="cidcard"  validType="idcardvalid"></td>
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
					<td><input class="easyui-validatebox" style="height: 25px"
						name="cphone" id="cphone"  validType="cphonevalid"></td>
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
	<div>
		<a href="javascript:saveGrade()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() { 
	//表单回显
	
	$("#fm").form("load","${pageContext.request.contextPath }/findConloanerByuser_idcard.action?user_idcard="+'${usersession.user_idcard}');
	$("#fm").refresh();
});

	function saveGrade() {
		
		$("#fm").form("submit", {

			url : "${pageContext.request.contextPath }/updateConloaner.action",
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(data) {
				data = eval("("+data+")");
				if(data.success){
				$.messager.alert("提示","保存成功","info");
			}else{
					$.messager.alert("提示","保存失败："+data.msg,"error");
				}
			}
		});
	}
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
                      }if(value.length == 18){
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
	
	cphonevalid: {
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