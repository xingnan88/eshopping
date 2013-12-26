<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>注册</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<script type="text/javascript">
			function validate(){
				var username = document.getElementById('username').value;
				var password = document.getElementById('password').value;
				var repassword = document.getElementById('repassword').value;
				var usernameMessage = document.getElementById('usernameMessage');
				var passwordMessage = document.getElementById('passwordMessage');
				var repasswordMessage = document.getElementById('repasswordMessage');
				var memTel = document.getElementById('memTel').value;
				var memPost = document.getElementById('memPost').value;
				var memEmail = document.getElementById('memEmail').value;
				var memAddress = document.getElementById('memAddress').value;
				var memTelMessage = document.getElementById('memTelMessage');
				var memPostMessage = document.getElementById('memPostMessage');
				var memEmailMessage = document.getElementById('memEmailMessage');
				var memAddressMessage = document.getElementById('memAddressMessage');
				if(username == "" || username == null){
					usernameMessage.innerHTML="用户名不能为空";
					return false;
				}
				if(password == "" || password == null){
					passwordMessage.innerHTML="密码不能为空";
					return false;
				}
				if(repassword == "" || repassword == null){
					repasswordMessage.innerHTML="请再次输入密码";
					return false;
				}
				if(memTel == "" || memTel == null){
					memTelMessage.innerHTML="联系电话不能为空";
					return false;
				}
				if(!isDigit(memTel)){
					memTelMessage.innerHTML="联系电话应为纯数字";
					return false;
				}
				if(memPost == "" || memPost == null){
					memPostMessage.innerHTML="邮编不能为空";
					return false;
				}
				if(!isPostalCode(memPost)){
					memPostMessage.innerHTML="邮编格式不正确";
					return false;
				}
				if(memEmail == "" || memEmail == null){
					memEmailMessage.innerHTML="邮箱不能为空";
					return false;
				}
				if(!isEmail(memEmail)){
					memEmailMessage.innerHTML="邮箱格式不正确";
					return false;
				}
				if(memAddress == "" || memAddress == null){
					memAddressMessage.innerHTML="地址不能为空";
					return false;
				}
				return true;
			}
			function isDigit(s)
			{
				var patrn=/^[0-9]{1,20}$/;
				if (!patrn.exec(s)) 
					return false
				return true
			}
			function isEmail(str){
 			    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
      			return reg.test(str);
			}
			function isPostalCode(s)
			{
				var patrn=/^[a-zA-Z0-9 ]{3,12}$/;
				if (!patrn.exec(s)) 
					return false
				return true
			}
		</script>
	</head>

	<body>
		<center>
			<div style="width: 1200px; text-align: center;">
				<jsp:include page="top.jsp" />
				<jsp:include page="left.jsp" />
				<div style="">
					<div class="title" align="left">
						<a href="head/index.action">首页</a>
					</div>
					<div>
						用户注册
					</div>
					<div>
						<s:actionerror/>
					</div>
					<div style="margin-top:20px;">
						<center>
						<form method="post" action="head/login!regist" onsubmit="return validate()">
						<table>
							<tr>
								<td>用户名:</td>
								<td><input type="text" name="username" id="username" onfocus="javascript:document.getElementById('usernameMessage').innerHTML='';"/></td>
								<td width="155">
									<div id="usernameMessage"></div>
								</td>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp;码:</td>
								<td><input type="password" name="password" id="password" style="width:155px;" onfocus="javascript:document.getElementById('passwordMessage').innerHTML='';"/></td>
								<td>
									<div id="passwordMessage"></div>
								</td>
							</tr>
							<tr>
								<td>重&nbsp;&nbsp;复:</td>
								<td><input type="password" name="repassword" id="repassword" style="width:155px;" onfocus="javascript:document.getElementById('repasswordMessage').innerHTML='';"/></td>
								<td>
									<div id="repasswordMessage"></div>
								</td>
							</tr>
							<tr>
								<td>电&nbsp;&nbsp;话:</td>
								<td><input type="text" name="memTel" id="memTel" onfocus="javascript:document.getElementById('memTelMessage').innerHTML='';"/> </td>
								<td>
									<div id="memTelMessage"></div>
								</td>
							</tr>
							<tr>
								<td>邮&nbsp;&nbsp;编:</td>
								<td><input type="text" name="memPost" id="memPost" onfocus="javascript:document.getElementById('memPostMessage').innerHTML='';"/></td>
								<td>
									<div id="memPostMessage"></div>
								</td>
							</tr>
							<tr>
								<td>Email:</td>
								<td>
									<input type="text" name="memEmail" id="memEmail" onfocus="javascript:document.getElementById('memEmailMessage').innerHTML='';"/>
								</td>
								<td>
									<div id="memEmailMessage"></div>
								</td>
							</tr>
							<tr>
								<td>地&nbsp;&nbsp;址:</td>
								<td><input type="text" name="memAddress" id="memAddress" onfocus="javascript:document.getElementById('memAddressMessage').innerHTML='';"/></td>
								<td>
									<div id="memAddressMessage"></div>
								</td>
							</tr>
							<tr align="center">
								<td colspan="3">
									<s:submit value="确定" theme="simple" />
									<s:reset value="取消" theme="simple" />
								</td>
							</tr>
						 </table>
						</form>
						</center>
					</div>
				</div>
			</div>
		</center>
		<br/>
		<br/>
		<br/>
		<jsp:include page="bottom.jsp"/>
	</body>
</html>
