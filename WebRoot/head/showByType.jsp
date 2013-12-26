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

		<title>${merchandise.category.cateName}</title>

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
			<div style="width: 1200px; text-align: center; height: 1000px;">
				<jsp:include page="top.jsp" />
				<jsp:include page="left.jsp" />
				<!-- 中间 -->
				<div style="width: 1060px;float:left;">
					<div class="title" align="left">
						<a href="head/index.action">首页</a>
					</div>
					<div>
						<div style="font-size:29px; text-align:left;margin:5px 0px 10px 0px;">
							<b><s:property value="merchantables.get(0).types.typeName"/>类</b>
						</div>
						<s:iterator value="merchantables">
							<span style="float: left; margin-right:20; margin-bottom:20px;width:240px; height:300px; border: 1px #CCCCCC solid;">
							 <img  src="${merPicture}" title="点击查看详情" style="margin-top:40px; cursor:hand; " width="100" height="130" onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'"><br/>
								<br /> ${merName}<br/>
								<span
									style="text-decoration: line-through;font-size:13px;"><s:if test="price == null"></s:if><s:else>￥${merPrice}</s:else></span>&nbsp;<span style="font-size:13px;">￥${merPrice}</span>
								<br/><br/>
								<span style="text-align:left;"><img title="加入购物篮" src="image/add.png"></span>
							</span>
						</s:iterator>
					</div>
				</div>
			</div>
		</center>
		<jsp:include page="bottom.jsp"/>
	</body>
</html>
