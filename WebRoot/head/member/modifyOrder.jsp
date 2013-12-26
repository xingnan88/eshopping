<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

		<title>历史清单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link   rel= "Shortcut   Icon "   href= "top.png ">
		<style type="text/css">
.left {
	padding: 10px 0px 0px 10px;
}
</style>
	</head>

	<body>
		<center>
			<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
					&nbsp;&nbsp;<a href="/e_shop/head/member/myaccount.jsp">我的账户</a>
					</span>
				</div>
				<div
					style="font-size: 30px; color: red; float: left; margin-left: 10px;">
					修改清单
				</div>
				<div style="margin-top: 80px;">
				<s:iterator value="orders" id="order">
					<table style="border:1px #CCCCCC solid; width:1195">
						<tr>
							<td style="border-right:1px #CCCCCC solid;width:300px;">
								<div class="left">
									订购日期:${orderDate}
								</div>
								<div class="left">
									收件人:${member.memName}
								</div>
								<div class="left">
									付款方式:货到付款
								</div>
							</td>
							<td valign="top">
								<div>所购商品:</div>
								<s:iterator value="records">
									<div style="margin:20px 0px 20px 0px;clear:left;">
										<div style="float:left;margin:20px 0px 20px 20px;border:1px #CCCCCC solid;"><img src="${merchantable.merPicture}" width=100px height=130px border="1"/></div>
										<div style="float:left;margin:30px 0px 10px 20px;">
											商品名称:${merchantable.merName}<br/><br/>
											数量:${recordMerNum}<br/><br/>
											单价:<s:if test="merchantable.merDiscount == null">
												￥${merchantable.merPrice }
											</s:if>
											<s:else>
											￥${merchantable.merPrice*merchantable.merDiscount*0.1}
											</s:else>
										</div>
									</div>
								</s:iterator>
							</td>
							<td>
								<div style="float:right;padding-top:80px;padding-right:80px;">
											<input type="button" value="删除定单" onclick="javascript:if(confirm('确定删除订单')){location.href='/e_shop/head/member/order!deleteOrder?orderId=${orderId}'}"/>
										</div>
							</td>
						</tr>
					</table>
					<br/>
					</s:iterator>
				</div>
			</div>
		</center>
		<br/><br/>
		<jsp:include page="../bottom.jsp"/>
	</body>
</html>
