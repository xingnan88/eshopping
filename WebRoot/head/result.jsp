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

		<title>搜索结果</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index.css">

	</head>

	<body>
		<center>
			<div style="width: 1200px;">
				<jsp:include page="top.jsp" />
				<jsp:include page="left.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
					</span>
				</div>
				<div>
					搜索结果
				</div>
				<div style="margin-top: 10px;">
					<table style="border: 1px #CCCCCC solid; width: 1050">
						<s:if test="merchantables!=null">
						<s:iterator value="merchantables">
							<tr>
								<td valign="top">

									<div
										style="float: left; margin: 20px 0px 20px 20px; border: 1px #CCCCCC solid;">
										<img src="${merPicture}" width=100px height=130px border="1" />
									</div>

								</td>
								<td>
									<div style="float: left; margin: 30px 0px 10px 20px;">
										商品名称:${merName}
										<br />
										<br />
										单价:
										<s:if test="merDiscount == null">
												￥${merPrice }
											</s:if>
										<s:else>
											￥${merPrice*merDiscount*0.1}
											</s:else>
									</div>
								</td>
								<td>
									<input type="button" value="查看详情" onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'"/>
								</td>
							</tr>
						</s:iterator>
						</s:if>
						<s:else>
							<tr><td>无此商品</td></tr>
						</s:else>
					</table>
					<br />
				</div>
			</div>
		</center>
	</body>
</html>
