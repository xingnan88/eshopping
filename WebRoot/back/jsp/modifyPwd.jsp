<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
			function validate(){
				var adminName = document.getElementById('adminName').value;
				var password = document.getElementById('password').value;
				var adminPwd = document.getElementById('adminPwd').value;
				var newPwd = document.getElementById('newPwd').value;
				var adminNameMessage = document.getElementById('adminNameMessage');
				var passwordMessage = document.getElementById('passwordMessage');
				var adminPwdMessage = document.getElementById('adminPwdMessage');
				var newPwdMessage = document.getElementById('newPwdMessage');
				if(adminName == '' || adminName == null){
					adminNameMessage.innerHTML="用户名不能为空";
					return false;
				}
				if(adminPwd == "" || adminPwd == null){
					adminPwdMessage.innerHTML="原密码不能为空";
					return false;
				}
				if(password == "" || password == null){
					passwordMessage.innerHTML="新密码不能为空";
					return false;
				}
				if(newPwd == "" || newPwd == null){
					newPwdMessage.innerHTML="请再次输入密码";
					return false;
				}
				return true;
		}
	</script>
  </head>
  
  <body> 
	<center>
		<div>
			管理员密码修改 
		</div>
		<div style="margin-top:5px; color:red">
			<s:actionerror/>
		</div>
		<div style="margin-top: 30px;">
		<form method="post" action="back/jsp/admin!modifyPwd" onsubmit="return validate()">
			<input type="hidden" name="adminId" value="${sessionScope.admin.adminId}"/>
			<table>
				<tr>
					<td>用户名:</td>
					<td>
						<input type="text" name="adminName" id="adminName" value="${sessionScope.admin.adminName}" onfocus="javascript: document.getElementById('adminNameMessage').innerHTML='';"/>		
					</td>
					<td width="130">
						<div style="display: inline;" id="adminNameMessage"></div>
					</td>
				</tr>
				<tr>
					<td>原密码:</td>
					<td>
						<input type="password" name="adminPwd" id="adminPwd" onfocus="javascript: adminPwdMessage = document.getElementById('adminPwdMessage').innerHTML='';"/>		
					</td>
					<td>
						<div style="display: inline;" id="adminPwdMessage"></div>
					</td>
				</tr>		
				<tr>
					<td>新密码:</td>
					<td>
						<input type="password" name="password" id="password" onfocus="javascript:passwordMessage = document.getElementById('passwordMessage').innerHTML='';"/>		
					</td>
					<td>
						<div style="display: inline;" id="passwordMessage"></div>
					</td>
				</tr>
				<tr>
					<td>再次输入:</td>
					<td>
						<input type="password" name="newPwd" id="newPwd" onfocus="javascript:document.getElementById('newPwdMessage').innerHTML='';"/>						
					</td>
					<td>
						<div style="display:inline;" id="newPwdMessage" ></div>
					</td>
				</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="保存" />
					<input type="reset" value="重置" />
				</td>
			</tr>	
			</table>
		</form>
	</div>
	</center>
  </body>
</html>
