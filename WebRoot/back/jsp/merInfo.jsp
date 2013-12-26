<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.td1{
			width:300px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td2{
			width:150px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td3{
			width:150px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td4{
			width:250px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
	</style>
  </head>
  
  <body>
  	<center>
  		<div style="margin-top:10px;">商品信息</div>
  		<table style="margin-top:40px;border:1px #CCCCCC solid;text-align:center;border-spacing:0px;">
  			
  			<tr>
				<th class="td1">商品名称</th>
				<th class="td2">价格</th>
				<th class="td3">折扣</th>
				<th class="td4">操作</th>
  			</tr>
  			<s:iterator value="pageBean.list">
  			<tr>
  				<td class="td1">${merName}</td>
  				<td class="td2">${merPrice}</td>
  				<td class="td3">${merDiscount}</td>
  				<td class="td4">
  					<input type="button" value="删除" onclick="javascript:if(confirm('确定删除此商品')){location.href='back/jsp/mer!deleteMer?id=${merId}'}"/>
  					<input type="button" value="修改" onclick="location.href='/e_shop/back/jsp/mer!update?id=${merId}'"/>
  				</td>
  			</tr>
  			</s:iterator>
  		</table>
  		<div style="margin-top:40px;">${pageBean.ctrlInfo}</div>
  	</center>
  </body>
</html>
