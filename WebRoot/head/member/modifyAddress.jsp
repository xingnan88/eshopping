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

		<title>修改地址</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<script type="text/javascript">
			function validate(){
				var memTel = document.getElementById('memTel').value;
				var memPost = document.getElementById('memPost').value;
				var memEmail = document.getElementById('memEmail').value;
				var memAddress = document.getElementById('memAddress').value;
				var memTelMessage = document.getElementById('memTelMessage');
				var memPostMessage = document.getElementById('memPostMessage');
				var memEmailMessage = document.getElementById('memEmailMessage');
				var memAddressMessage = document.getElementById('memAddressMessage');
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
			<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
						&nbsp;&nbsp;<a href="/e_shop/head/member/myaccount.jsp">我的账户</a> </span>
				</div>
				<div
					style="font-size: 30px; color: red; float: left; margin-left: 10px;">
					用户地址修改:
				</div>
				<div style="margin-top: 80px;">
					<s:actionmessage />
					<form  method="post" action="head/login!modifyAddress" onsubmit="return validate()">
						<table>
							<tr>
								<td>
									电&nbsp;话:
									<input type="text" name="memTel" id="memTel" 
										value="${sessionScope.member.memTel}" onfocus="javascript:document.getElementById('memTelMessage').innerHTML='';"/>
								</td>
								<td width="200">
									<div style="display:inline;" id="memTelMessage" ></div>
								</td>
							</tr>
							<tr>
								<td>
									邮&nbsp;编:
									<input type="text" name="memPost" id="memPost" 
										value="${sessionScope.member.memPost}" onfocus="javascript:document.getElementById('memPostMessage').innerHTML='';"/>
								</td>
								<td>
									<div style="display:inline;" id="memPostMessage"></div>
								</td>
							</tr>
							<tr>
								<td>
									Email:
									<input type="text" name="memEmail"  id="memEmail"
										value="${sessionScope.member.memEmail}" onfocus="javascript:document.getElementById('memEmailMessage').innerHTML='';"/>
								</td>
								<td>
									<div style="display:inline;" id="memEmailMessage"></div>
								</td>
							</tr>
							<tr>
								<td>
									地&nbsp;址:
									<input type="text" name="memAddress" id="memAddress"
										value="${sessionScope.member.memAddress}" onfocus="javascript:document.getElementById('memAddressMessage').innerHTML='';"/>
								</td>
								<td>
									<div style="display:inline;" id="memAddressMessage"></div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" value="确定" />
									<input type="reset" value="取消" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</center>
		<br />
		<br />
		<br />
		<br />
		<jsp:include page="../bottom.jsp" />
	</body>
</html>
