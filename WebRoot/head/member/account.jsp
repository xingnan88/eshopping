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

		<title>结算中心</title>

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
			<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<div class="title" align="left">
					<span> <a href="head/index" style="margin-left: 10px;">首页</a>
					</span>
				</div>
				<div>
					<div style="">
						查看并提交清单
					</div>
					<div style=" width: 1200px;height:500px;">
						<form action="/e_shop/head/member/order!addOrder" method="post">
						<div style="height:500px; float: left; width: 800px; border: 1px #CCCCCC solid; ">
							<div style="height:30px;padding-top:5px;background-color:#8cfcac;">配送明说</div>
							<div style="text-align:left; ">
								<div style="background-color:#e7f9ec;">送货地址:<input type="button" value="修改" onclick="javascript:location.href='/e_shop/head/member/modifyAddress'"/></div>
								<div>${sessionScope.member.memName}</div>
								<div>${sessionScope.member.memAddress}</div>
								<div>${sessionScope.member.memPost}</div>
								<div>${sessionScope.member.memTel }</div>
								<div style="background-color:#e7f9ec;margin-top:10px;padding-top:4px;height:25px;">送货方式: </div>
								<div style="margin-top:10px;">方式:暂只支持货到付款</div>
								<div style="margin-top:10px;">请选择希望送货的时间:</div>
								<div style="margin-top:5px;">
								
									<input type="radio" name="time" value="只工作日送货"/>只工作日送货(双休日不送)(注：写字楼/商用地址客户请选择)<br/>
									<input type="radio" name="time"  value="只双休日、假日送货"/>只双休日、假日送货(工作日不用送)<br/>
									<input type="radio" name="time"  value="晚上送货"/>学校地址/地址白天没人,晚上送货<br/>
									<input type="radio" name="time" checked value="工作日、双休日、假日皆可"/>工作日、双休日、假日皆可<br/>
										<div style="margin:5px 0px 5px 0px;">
											配送相关特殊说明(配送公司会尽量协调):
										</div>
										<textarea rows="7" cols="40" name="remark">无</textarea>
								</div>
								<div style="padding-left:550px;">
								<input type="submit" value="确认定单"/></div>
							</div>
						</div>
						<div style="height:500px; float: left; border: 1px #CCCCCC solid; width: 395px;">
							<div style="padding-top:5px;height:30px;background-color:#8cfcac;">订单价格</div>
							<div style="overflow: scroll;height:400px; margin-top:10px; padding-left:10px;text-align:left; width: 387px">
								<s:iterator value="carts" id="cart">
										名称:${merchantable.merName}<br />
										<s:if test="merchantable.merDiscount != null">
										单价:${merchantable.merPrice*merchantable.merDiscount*0.1}&nbsp;元<br />
										数目:${cartNum}<br />
										小计:${(merchantable.merPrice*merchantable.merDiscount*0.1)*cartNum}&nbsp;元<br />
										</s:if>
										<s:else>
										单价:${merchantable.merPrice};&nbsp;元<br />
										数目:${cartNum}<br />
										小计:${merchantable.merPrice*cartNum}&nbsp;元<br />
										</s:else>
										<br />
								</s:iterator>
							</div>
							<input type="hidden" value="${sum}" name="sum"/>
							<div style="padding-top:20px;">合计：${sum}&nbsp;元 </div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</center>
		<br/>
		<br/>
		<jsp:include page="../bottom.jsp"/>
	</body>
</html>
