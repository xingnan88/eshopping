<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的账户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link   rel= "Shortcut   Icon "   href= "top.png ">
  </head>
  
  <body>
	<center>
		<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
					</span>
				</div>
				<div>
					<span style="float:left; font-size:30px; color:red;">我的账户</span>
					<span style="float:right;">您好!${member.memName}&nbsp;|&nbsp;<a href="/e_shop/head/index!exit">退出</a></span>
				</div>
				<div style="border:1px #CCCCCC solid; height:100px; margin-top:80px;">
					<div style="text-align:left;margin:20px 0px 0px 5px;float:left;width:300px;">
						查看订单<br/><br/>
						查看和修改最近订单
					</div>
					<div style="text-align:left; float:left;margin-top:20px; width:300px;">
						<a href="/e_shop/head/member/order!historyOrder">查看历史记录</a><br/><br/>
						<a href="/e_shop/head/member/order!modifyOrder">修改最近订单</a>
					</div>
					<div style="text-align:left;margin-top:20px;">
						<a href="/e_shop/head/member/mycart.action">查看我的购物车</a>
					</div>
				</div>
				<div style="border:1px #CCCCCC solid; height:100px; margin-top:30px;">
					<div style="text-align:left;margin:20px 0px 0px 5px;float:left;width:300px;">
						个人信息设置<br/><br/>
						密码、地址等个人信息的修改
					</div>
					<div style="text-align:left;margin-top:20px;">
						<a href="/e_shop/head/member/modifyPwd">修改用户名密码</a><br/><br/>
						<a href="/e_shop/head/member/modifyAddress">修改地址</a>
					</div>
				</div>
		</div>
	</center>
	<br/><br/>
	<jsp:include page="../bottom.jsp"/>
  </body>
</html>
