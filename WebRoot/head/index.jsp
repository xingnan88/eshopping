<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eshop.tool.SubString"%>
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

		<title>电子商城</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link   rel= "Shortcut   Icon "   href= "top.png ">
		<script type="text/javascript" src="js/index.js"/></script>
		<script type="text/javascript" src="js/feckEdit.js"></script>
	</head>

	<body >
		<center>
			<div style="width: 1200px; text-align: center; height: 1000px;">
				<!-- 顶部 -->
				<jsp:include page="top.jsp"/>
				<!-- 左边 -->
				<div style="float:left;width:140px; ">
					<jsp:include page="left.jsp"/>
				</div>
				<!-- 中间 -->
				<div style="float: left;width: 746px;">
					<div>
						<div class="title" >
							各类商品
						</div>
						<div>
							<div>
							<div class="subtitle">
								<b>新鲜货</b>
							</div>
							<s:iterator value="merchantables" status="merchantable">
								<div class="mer">
								<table>
									<tr>
										<td>
											<img src="${merPicture}" width="100" style="cursor:hand"
										height="130" title="${merName}" border="1" onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'"/>
										</td>
									</tr>
									<tr>
										<td>
										<a href="head/merchantable!showById?id=${merId}&type=${types.typeId}" title="${merName}">${subMerName}</a>
										</td>
									</tr>
									<tr>
										<td>
										<span style="text-decoration: line-through;font-size:13px;"><s:if test="merDiscount == null"></s:if><s:else>￥${merPrice}</s:else></span>&nbsp;<span style="font-size:13px;">￥${merPrice*merDiscount*0.1}</span>
										</td>
									</tr>
								</table>
								</div>
							</s:iterator>
							<div style="clear: left;"><a href="#"><br/></a></div>
							</div>
							<s:iterator value="recommends" id="mer">
							<div>
							<div class="subtitle">
								<b><s:property value="#mer.get(0).types.typeName"/>推荐</b>
							</div>
							<s:iterator value="#mer" status="merchantable">
								<div class="mer">
								<table>
									<tr>
										<td>
											<img src="${merPicture}" width="100" style="cursor:hand"
										height="130" title="${merName}" border="1" onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'"/>
										</td>
									</tr>
									<tr>
										<td>
										<a href="head/merchantable!showById?id=${merId}&type=${types.typeId}" title="${merName}">${subMerName}</a>
										</td>
									</tr>
									<tr>
										<td>
										<span style="text-decoration: line-through;font-size:13px;"><s:if test="merDiscount == null"></s:if><s:else>￥${merPrice}</s:else></span>&nbsp;<span style="font-size:13px;">￥${merPrice*merDiscount*0.1}</span>
										</td>
									</tr>
								</table>
								</div>
							</s:iterator>
							<div style="clear: left;"><a href="head/merchantable!showByType?type=<s:property value="#mer.get(0).types.typeId"/>"><br/>更多</a></div>
							</div>
							</s:iterator>
						</div>
					</div>
				</div>
				<!-- 右边 -->
				<div
					style="width: 310px; height: 160px; float: left;">
					<div class="title">会员登录	</div>
					<div style=" padding-top:8px;"> <jsp:include page="loginblock.jsp"/></div>
					<div style="height:500px;">
					<div style="margin-top:10px; width:310px;">
						<div style="margin:10px 0px 10px 0px;"><b>商品销售排行榜</b></div>
						<table cellspacing="5px">
						<s:iterator value="merchantables2" status="mer">
							<tr>
								<td width="80" align="center">
									<img src="${merPicture}" title="${merName}" style="cursor:hand;" width="50" height="70" onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'"/>
								</td>
								<td>
									<b><s:property value="#mer.count"/>.</b>&nbsp;
										<a href="head/merchantable!showById?id=${merId}&type=${types.typeId}" title="${merName}">${merName}</a>
									<br/>
									<span style="text-decoration: line-through;font-size:13px;"><s:if test="merDiscount == null"></s:if><s:else>￥${merPrice}</s:else></span>&nbsp;<span style="font-size:13px;">￥${merPrice*merDiscount*0.1}</span><br/>
									销售数量:<font color="red" size="2">${merNum}</font>
								</td>
							</tr>
						</s:iterator>
						</table>
						</div>
					</div>
				</div>
			</div>
		</center>
		<jsp:include page="bottom.jsp"/>
	</body>
</html>
