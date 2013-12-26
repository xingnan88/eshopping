<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>后台登录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
				function validate(){
				var username = document.getElementById('username').value;
				var password = document.getElementById('password').value;
				var rand = document.getElementById('rand').value;
				var message = document.getElementById('message');
				if(username == "" || username == null){
					message.innerHTML="用户名不能为空";
					return false;
				}
				if(password == "" || password == null){
					message.innerHTML="密码不能为空";
					return false;
				}
				if(rand == "" || rand == null){
					message.innerHTML="验证码不能为空";
					return false;
				}
				return true;
		}
		</script>
	</head>
	<body style="background-color:white;">
		<center>
		<div style="width:1000px;height:603px;margin-top:100px;background-image:url(/e_shop/img/login.jpg);">
		<div style="padding-top:80px;">
			<table border="0" height="80">
				<tr>
					<td >
					<div id="message" style="color: red;"><s:actionerror/></div>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top:40px;">
		<form action="/e_shop/back/login!valAdmin" onsubmit="return validate()" method="post">
		<table>
			<tr><td>用户名:</td>
				<td><input type="text" name="username" id="username"  style="width:155px;"/></td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;码:</td>
				<td><input type="password" name="password" id="password" style="width:155px;"/></td>
			</tr>
			<tr>
				<td>验证码:</td>
				<td><input type="text"  name="rand" id="rand" style="width:155px;"/></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><img id="img" alt="" src="authImg">
					<span onclick="javascript:document.getElementById('img').src='authImg'" title="点击刷新" style="cursor:hand">刷新</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定" />
					<input type="reset" value="取消"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
		</div>
		</center>
	</body>
</html>