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
    
    <title>显示订单</title>
    
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
			width:250px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td5{
			width:200px;
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
			width:150px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
	</style>
  </head>
  
  <body>
  	<center>
  		<div style="margin-top:10px;">订单信息</div>
  		<div><s:actionerror/></div>
  		<table style="margin-top:40px;border:1px #CCCCCC solid;text-align:center;border-spacing:0px;">
  			<tr>
				<th class="td1">订单编号</th>
				<th class="td2">订单时间</th>
				<th class="td3">订货会员</th>
				<th class="td4">订单发送时段</th>
				<th class="td5">价格合计</th>
				<th class="td6">备注</th>
				<th class="td7">操作</th>
  			</tr>
  			<s:iterator value="pageBean.list">
  			<tr>
  				<td class="td1">${orderId}</td>
  				<td class="td2">${orderDate}</td>
  				<td class="td3">${member.memName}</td>
  				<td class="td4">${time}</td>
  				<td class="td5">${sum}元</td>
  				<td class="td6">${remark}</td>
  				<td class="td7">
  					<s:if test="orderStatus == 0">
  						<input type="button" value="确认发货" onclick="javascript:location.href='/e_shop/back/jsp/orders!submit?orderId=${orderId}&page=1'"/>
  					</s:if>
  					<s:else>
  						已确认
  					</s:else>
  				</td>
  			</tr>
  			</s:iterator>
  		</table>
  		<div style="margin-top:40px;">${pageBean.ctrlInfo}</div>
  	</center>
  </body>
</html>
