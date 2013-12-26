<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginblock.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/feckEdit.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body >
		<s:if test="#session.member != null">
			<div >
				<font color="red">用户：<a
					href="/e_shop/head/member/myaccount.jsp" title="点击进入账户">${sessionScope.member.memName}</a>
				</font> &nbsp;&nbsp;
				<a href="/e_shop/head/index!exit">注销</a>
				&nbsp;&nbsp;<a href="/e_shop/head/member/myaccount.jsp">我的账户</a>
				<br />
			</div>
		</s:if>
		<s:else>
			<div id="message" style="display: inline; color: red;">
				<br/>用户：游客&nbsp;&nbsp;<a href="head/regist.jsp">注册</a>
			</div>
			<br />
			<div id="login" style="padding-top:30px;">
				<form method="post">
					用户名:&nbsp;
					<input type="text" id="username" style="width: 150px;" />
					<br />
					密 &nbsp;&nbsp;码:&nbsp;
					<input type="password" id="password" style="width: 150px;" />
					<br />
					验证码:&nbsp;
					<input type="text" id="rand" style="width: 150px;" />
					<br />
					<div style="margin: 5px 0px 5px 60px;"><img id="img" alt="" src="head/authImg">
						&nbsp;<span onclick="javascript:document.getElementById('img').src='head/authImg'" title="点击刷新" style="cursor:hand">刷新</span>
					</div>
					<input type="button" value="登录 "
						onclick="javascript:validateUser()" />
					<input type="reset" value="取消" />
				</form>
			</div>
		</s:else>
			<br />
  </body>
</html>
