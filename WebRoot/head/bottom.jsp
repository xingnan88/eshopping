<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
    	<table style="clear:both;">
    		<tr align="center">
    			<td><a href="http://www.taobao.com">淘宝网</a></td>
    			<td><a href="http://www.amazon.cn">卓越网</a></td>
    			<td><a href="http://www.dangdang.com">当当网</a></td>
    			<td><a href="http://youa.baidu.com">百度有啊</a></td>
    			<td><a href="http://www.paipai.com">拍拍网</a></td>
    			<td><a href="http://www.360buy.com">京东商城</a></td>
    			<td><a href="http://mall.taobao.com">淘宝商城</a></td>
    		</tr>
    		<tr align="center">
    			<td colspan="7">Copyright&copy;eshop版权所有</td>
    		</tr>
    		<tr align="center">
    			<td colspan="7">经营许可证：湘B2-20080225</td>
    		</tr>
    	</table>
    </center>
  </body>
</html>
