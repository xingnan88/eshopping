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
    
    <title>会员信息</title>
    
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
			width:80px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td2{
			width:100px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td3{
			width:100px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td4{
			width:350px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td5{
			width:80px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td6{
			width:250px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td7{
			width:100px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
			border-right:1px #CCCCCC solid;
		}
		.td8{
			width:100px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
	</style>
  </head>
  
  <body>
  	<center>
  		<div style="margin-top:10px;">用户信息</div>
  		<div><s:actionerror/></div>
  		<table style="margin-top:40px;border:1px #CCCCCC solid;text-align:center;border-spacing:0px;">
  			<tr>
				<th class="td1">用户编号</th>
				<th class="td2">用户名</th>
				<th class="td3">联系电话</th>
				<th class="td4">联系地址</th>
				<th class="td5">邮编</th>
				<th class="td6">Email</th>
				<th class="td7">注册时间</th>
				<th class="td8">操作</th>
  			</tr>
  			<s:iterator value="pageBean.list">
  			<tr>
  				<td class="td1">${memId}</td>
  				<td class="td2">${memName}</td>
  				<td class="td3">${memTel}</td>
  				<td class="td4">${memAddress}</td>
  				<td class="td5">${memPost}</td>
  				<td class="td6">${memEmail}</td>
  				<td class="td7">${memRegistDate}</td>
  				<td class="td8">
  					<input type="button" value="删除" onclick="javascript:if(confirm('确定删除此会员'))location.href='/e_shop/back/jsp/mem!delMem?memId=${memId}&page=1'"/>
  				</td>
  			</tr>
  			</s:iterator>
  		</table>
  		<div style="margin-top:40px;">${pageBean.ctrlInfo}</div>
  	</center>
  </body>
</html>
