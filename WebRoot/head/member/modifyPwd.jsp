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

		<title>修改密码</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link   rel= "Shortcut   Icon "   href= "top.png ">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	</head>
	<script type="text/javascript">
		function validate(){
				var username = document.getElementById('username').value;
				var password = document.getElementById('password').value;
				var newpwd = document.getElementById('newpwd').value;
				var renewpwd = document.getElementById('renewpwd').value;
				var usernameMessage = document.getElementById('usernameMessage');
				var passwordMessage = document.getElementById('passwordMessage');
				var newpwdMessage = document.getElementById('newpwdMessage');
				var renewpwdMessage = document.getElementById('renewpwdMessage');
				if(username == "" || username == null){
					usernameMessage.innerHTML="用户名不能为空";
					return false;
				}
				if(password == "" || password == null){
					passwordMessage.innerHTML="密码不能为空";
					return false;
				}
				if(newpwd == "" || newpwd == null){
					newpwdMessage.innerHTML="新密码不能为空";
					return false;
				}
				if(renewpwd == "" || renewpwd == null){
					renewpwdMessage.innerHTML="请再次输入密码";
					return false;
				}
				return true;
		}
	</script>
	<body>
		<center>
			<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
						&nbsp;&nbsp;<a href="/e_shop/head/member/myaccount.jsp">我的账户</a> </span>
				</div>
				<div
					style="font-size: 30px; color: red; float: left; margin-left: 10px;">
					用户名密码修改:
				</div>
				<div style="margin-top:80px;">
				<form action="head/login!modifyPwd" method="post" onsubmit="return validate()">
				<table>
					<tr><td colspan="2" height="30px">
						<s:actionerror cssStyle="color:red;"/>	
					</td></tr>
					<tr>
						<td>
							用户名:
						</td>
						<td>
							<input type="text" name="username" id="username" value="${sessionScope.member.memName}" onfocus="javascript:document.getElementById('usernameMessage').innerHTML='';"/>
						</td>
						<td width="200px">
							<div style="display:inline" id="usernameMessage"></div>
						</td>
					</tr>
					<tr>
						<td>
							原密码:
						</td>
						<td>
							<input type="password" name="password" id="password" onfocus="javascript:document.getElementById('passwordMessage').innerHTML='';"/>
						</td>
						<td width="200px">
							<div style="display:inline" id="passwordMessage"></div>
						</td>
					</tr>
					<tr>
						<td>
							新密码:
						</td>
						<td>
							<input type="password" name="newpwd" id="newpwd" onfocus="javascript:document.getElementById('newpwdMessage').innerHTML='';" />
						</td>
						<td>
							<div style="display:inline" id="newpwdMessage"></div>
						</td>
					</tr>
					<tr>
						<td>
							重新输入:
						</td>
						<td>
							<input type="password" name="renewpwd" id="renewpwd" onfocus="javascript:document.getElementById('renewpwdMessage').innerHTML='';"/>
						</td>
						<td>
							<div style="display:inline" id="renewpwdMessage"></div>
						</td>
					</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="submit" value="确定" />
							<input type="reset" value="取消" />
							</td>
						</tr>
				</table>
				</form>
				</div>
			</div>
		</center>
		<br/><br/><br/><br/>
		<jsp:include page="../bottom.jsp"/>
	</body>
</html>
