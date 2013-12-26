<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link   rel= "Shortcut   Icon "   href= "top.png ">
  </head>
  
  <body>
  <center>
  	购买成功!<br/>
  	3秒后返回首页<br/>
  	<a href="/e_shop/head/index.action">若未跳转,请单击</a>
  	<%
  		response.setHeader("refresh","3;url=/e_shop/head/index.action"); 
  	%>
  </center>  
  </body>
</html>
