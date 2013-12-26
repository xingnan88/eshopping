<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
	
  <frameset rows="103,*" frameborder="no">
  	<frame src="back/jsp/top.html" scrolling="no" noresize="noresize" />
  	<frameset cols="180,*">
  		<frame src="back/jsp/left.jsp" scrolling="no" frameborder="1">
  		<frame src="back/jsp/main.jsp" name="main">
  	</frameset>
  </frameset>  
	
</html>
