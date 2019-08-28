<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<style type="text/css">
body {
	background-image: url(image/register.jpg);
	position: static;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}

#div1 {
	top: 20%;
	left: 20%;
	position: absolute;
}

input {
	height: 30px;
	width: 200px
}
span{color: red}
</style>
</head>
<body>
	<div id="div1">

		<form action="${pageContext.request.contextPath }/register.action"
			method="post" onsubmit="return checkForm();">
			<table cellpadding="2"  style="line-height: 35px;text-align: center;">
				<tr>
					<td align="right">用户名:</td>
					<td><input type="text" name="user_name" class="textinput"
						id="user_name" onkeyup="checkUsername();" placeholder="2到10位字符"/></td>
					<td colspan="2"><span id="usernameMsg" ></span> </td>
				</tr>
				<tr>
					<td align="right">身份证号:</td>
					<td><input type="text" name="user_idcard" class="textinput"
						id="user_idcard" onkeyup="checkUserId();" placeholder="18位身份证号" /></td>
					<td colspan="2"><span id="useridcardMsg"></span></td>
				</tr>
				<tr>
					<td align="right">邮箱:</td>
					<td><input type="text" name="user_email" id="user_email"
						class="textinput" onkeyup="checkEmail()" placeholder="请输入邮箱账号"/></td>
					<td colspan="2"><span id="emailMsg"></span>
				</tr>
				<tr>
					<td align="right">密码:</td>
					<td><input type="password" name="user_password"
						class="textinput" id="user_password" onkeyup="checkPassword();" placeholder="6~16位字符"/></td>
					<td><span id="passwordMsg"></span> </td>
				</tr>
				<tr>
					<td align="right">确认密码:</td>
					<td><input type="password" name="repassword" class="textinput"
						id="repassword" onkeyup="checkConfirm()" placeholder="请再次输入密码"/></td>
					<td><span id="confirmMsg"></td>
				</tr>


				<tr>
					<td colspan="2"><input style="height: 40px; width: 80px;"
						type="reset" name="reset" value="重置" id="reset" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input
						style="height: 40px; width: 120px;" type="submit" name="submit"
						value="确认并提交" /></td>

				</tr>
			</table>
		</form>

	</div>
</body>
<script type="text/javascript">
	//1、声明变量
	var emailo;
	var usernameo;
	var useridcardo;
	var passwordo;
	var confirmo;
	var emailMsg;
	var usernameMsg;
	var passwordMsg;
	var confirmMsg;
	//2、页面加载后，获取页面中的对象
	
	window.onload = function() {
		emailo = document.getElementById("user_email");
		usernameo = document.getElementById("user_name");
		useridcardo = document.getElementById("user_idcard");
		passwordo = document.getElementById("user_password");
		confirmo = document.getElementById("repassword");
		emailMsg = document.getElementById("emailMsg");
		usernameMsg = document.getElementById("usernameMsg");
		useridcardMsg = document.getElementById("useridcardMsg");
		passwordMsg = document.getElementById("passwordMsg");
		confirmMsg = document.getElementById("confirmMsg");
		//给用户名文本框失去焦点时注册监听事件
		usernameo.onblur = function() {

			//1得到异步对象
			var xmlhttp = createXMLHttpRequest();
			//2打开连接
			xmlhttp.open("POST", "checkUserName.action", true);
			//3设置请求头
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			//4发送请求
			xmlhttp.send("username=" + usernameo.value);

			//5给xmlhttp注册onreadystatechange监听事件
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
					
					if (result==1) {
						var msg= "用户名已被注册";						
						usernameMsg.innerHTML =msg;						
						
					}
				}
			}
		}
		//给身份证号文本框失去焦点时注册监听事件
		useridcardo.onblur = function() {

			//1得到异步对象
			var xmlhttp = createXMLHttpRequest();
			//2打开连接
			xmlhttp.open("POST", "checkUserIdCard.action", true);
			//3设置请求头
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			//4发送请求
			xmlhttp.send("useridcard=" + useridcardo.value);

			//5给xmlhttp注册onreadystatechange监听事件
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
					
					if (result==1) {
						var msg= "身份证号已被注册";						
						useridcardMsg.innerHTML =msg;						
						
					}
				}
			}
		}
	};

	//3、校验整个表单
	function checkForm() {
		var bEmail = checkEmail();
		var bPassword = checkPassword();
		var bUsername = checkUsername();
		var bConfirm = checkConfirm();
		var bCheckUserId = checkUserId();
		return bEmail && bPassword && bUsername && bConfirm && bCheckUserId;
	}
	//4、验证邮箱
	function checkEmail() {
		var regex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;//数字字母下划线+@+.数字字母下划线
		var value = emailo.value;
		var msg = "";//如果emailo为null或“”，!value的值为false，如果不为空则为true
		if (!value)
			msg = "邮箱必须填写";
		else if (!regex.test(value))
			msg = "邮箱格式不对";
		emailMsg.innerHTML = msg;		
		return msg == "";
	}
	//5验证用户名
	function checkUsername() {
		var regex = /^.{2,16}$/;//数字字母下划线4~16位，不能是数字开头
		var value = usernameo.value;
		var msg = "";
		if (!value) {//等价于value1=="";
			msg = "用户名必须填写：";
		} else if (!regex.test(value)) {//如果用户不能匹配正则表达式
			msg = "用户名不合法";
		}
		usernameMsg.innerHTML = msg;//将消息放入span		
		return msg == "";
	}
	//6验证密码
	function checkPassword() {
		var regex = /^.{6,16}$/;
		var value = passwordo.value;
		var msg = "";
		if (value == "") {
			msg = "密码不能为空";
		} else if (!regex.test(value)) {
			msg = "密码格式不对";
		}
		passwordMsg.innerHTML = msg;	
		return msg == "";
	}
	//7确认密码
	function checkConfirm() {
		var passwordValue = passwordo.value;
		var confirmValue = confirmo.value;
		var msg = "";
		if (passwordValue != confirmValue) {
			msg = "两次输入的密码不一致";
		} else if (!confirmValue) {
			msg = "不能为空";
		}
		confirmMsg.innerHTML = msg;
		confirmo.parentNode.parentNode.style.color = msg == "" ? "black"
				: "red";
		return msg == "";

	}
	//8确认身份证号

	function checkUserId() {
		var regex = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;//身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X
		var value = useridcardo.value;
		var msg = "";
		if (value == "") {
			msg = "身份证号不能为空";
		} else if(value.length == 18||value.length == 15){
			msg=IdentityCodeValid(value);			
		}else {
			msg = "身份证号长度不对";
		}
		useridcardMsg.innerHTML = msg;		
		return msg == "";
	}
	//创建异步对象
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();//大多数浏览器
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");//IE6.0
			} catch (e) {
				try {
					new ActiveXObject("Msxml2.XMLHTTP");//IE5.5及更早版本
				} catch (e) {
					alert("哥们，您的浏览器牛逼了，我都识别不出来");
					throw e;
				}
			}
		}
	}//验证身份证号
	 function IdentityCodeValid(code) { 
         var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
         var tip = "";               
         if(!/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[0,1,2])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)?$/i.test(code)){
             tip = "身份证号格式有误";            
         }
         
        else if(!city[code.substr(0,2)]){
             tip = "身份证号格式有误";            
         } 
         else{
             //18位身份证需要验证最后一位校验位
             if(code.length == 18){
                 code = code.split('');
                 //∑(ai×Wi)(mod 11)
                 //加权因子
                 var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                 //校验位
                 var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                 var sum = 0;
                 var ai = 0;
                 var wi = 0;
                 for (var i = 0; i < 17; i++)
                 {
                     ai = code[i];
                     wi = factor[i];
                     sum += ai * wi;
                 }
                 var last = parity[sum % 11];
                 if(parity[sum % 11] != code[17]){
                	 tip = "身份证号格式有误";                     
                 }
             }
         }
        
         return tip;
     }
</script>
</html>