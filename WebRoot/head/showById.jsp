<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

		<title>商品</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link   rel= "Shortcut   Icon "   href= "top.png ">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<script type="text/javascript" src="js/index.js">
</script>
		<script type="text/javascript" src="fckeditor/fckeditor.js">
</script>
		<script type="text/javascript" src="js/feckEdit.js"></script>

	</head>

	<body>
		<center>
			<div style="width: 1200px; text-align: center;">
				<jsp:include page="top.jsp" />
				<jsp:include page="left.jsp" />
				<div style="">
					<div class="title" align="left">
						<a href="head/index.action">首页</a>
						&nbsp;&nbsp;
						<s:if test="#session.member == null">
							<a href="head/login.jsp">登录</a>&nbsp;&nbsp;
							<a href="head/regist.jsp">注册</a>
						</s:if>
						<s:else>
							<a href="/e_shop/head/member/myaccount.jsp">我的账户</a>
							&nbsp;&nbsp;
							<a href="head/member/mycart.jsp">我的购物车</a>
						</s:else>
					</div>
					<!-- 中 -->
					<div>
						<div
							style="float: left; border: 1px #CCCCCC solid; width: 300px; height: 300px; padding-top: 20px;">
							<img alt="" src="${merchantable.merPicture}" width="200"
								height="260">
						</div>
						<div style="float: left;">
							<div
								style="float: left; background-image: url(img/1.jpg); margin-left: 20px; padding: 5px 0px 0px 5px; text-align: left; width: 440px; height: 33px; border: 1px #dffadb solid">
								${merchantable.merName}
								<input type="hidden" id="merName"
									value="${merchantable.merName}" />
								<input type="hidden" id="price" value="${merchantable.merPrice}" />
								<input type="hidden" id="id" value="${merchantable.merId}" />
							</div>
							<div
								style="padding: 20px 0px 0px 20px; clear: both; text-align: left; font-size: 17px; width: 450px; float: left;">
								商&nbsp;城&nbsp;价:&nbsp;
								<font size="6" color="red">￥${merchantable.merPrice*merchantable.merDiscount*0.1}</font>&nbsp;元
								<br />
								<br />
								<s:if test="merchantable.merDiscount != null">	
								市&nbsp;场&nbsp;价:&nbsp;￥${merchantable.merPrice}元&nbsp;&nbsp;(为您节省￥<fmt:formatNumber value="${merchantable.merPrice- merchantable.merPrice*merDiscount*0.1-merchantable.merPrice*merchantable.merDiscount*0.1}" pattern="#.#" minFractionDigits="1" />元)<br />
									<br />
								</s:if>
								我&nbsp;要&nbsp;买:&nbsp;
								<input type="text" size="1" value="1" id="num" />
								&nbsp;件
								<br />
								<br />
								已&nbsp;售&nbsp;出:&nbsp;${merchantable.merNum}&nbsp;件
								<br/>
								<br/>
								生产厂家:&nbsp;${merchantable.merProducter}
								<br />
								<br />
								<img title="加入购物车 " src="img/3.jpg" style="cursor: hand;"
									onclick="add()" />
							</div>
						</div>


						<div
							style="border: 2px #dffadb solid; width: 278px; float: right; height: 645px;">
							<div
								style="background-image: url(img/1.jpg); width: 278px; height: 35px; padding-top: 10px;">
								<font color="red">${sessionScope.member.memName}</font>的购物车
							</div>
							<div id="cart" style="overflow: scroll; width: 270px; height: 470px; text-align: left;">
								<s:if test="carts != null">
									<s:iterator value="carts" id="cart">
										名称:${merchantable.merName}<br />
										<s:if test="merchantable.merDiscount != null">
										单价:${merchantable.merPrice*merchantable.merDiscount*0.1}&nbsp;元<br />
										数目:${cartNum}<br />
										合计:${(merchantable.merPrice*merchantable.merDiscount*0.1)*cartNum}&nbsp;元<br />
										</s:if>
										<s:else>
										单价:${merchantable.merPrice};&nbsp;元<br />
										数目:${cartNum}<br />
										合计:${merchantable.merPrice*cartNum}&nbsp;元<br />
										</s:else>
										<br />
									</s:iterator>
								</s:if>
								<s:else>购物车为空</s:else>

							</div>
							<div style="padding-top: 10px;">
								<input type="button" value="修改购物车" onclick="javascript:location.href='/e_shop/head/member/mycart.action'"/>
							</div>
							<div style="padding-top: 10px;">
								<input type="button" value="进入结算中心" onclick="javascript:location.href='/e_shop/head/member/order.action'"/>
							</div>
							<div
								style="background-image: url(img/7.jpg); width: 278px; height: 30px; padding-top: 10px; border: 1px #dffadb solid;"></div>
						</div>
						<div id="showmer"
							style="text-align: left; margin: 10px 5px 0px 5px; width: 770px; height: 296px; float: right;">
							<div style="height: 40px; padding-top: 10px;">
								相关物品:
							</div>
							<DIV id="t0"
								style="OVERFLOW: hidden; WIDTH: 770px; COLOR: #ffffff">
								<TABLE border=0 cellPadding=0 cellSpacing=0>
									<TBODY>
										<TR>
											<TD id="t1" vAlign=top>
												<TABLE cellSpacing=0 cellPadding=2 border=0>
													<TBODY>
														<TR>
															<s:iterator value="merchantables">
																<td>
																	<div
																		style="float: left; text-align: center; overflow: hidden; width: 150px; height: 200px;">
																		<img src="${merPicture}" width="100" height="100"
																			style="cursor: hand"
																			onclick="javascript:location.href='/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}'" />
																		<br />
																		名称:
																		<a
																			href="/e_shop/head/merchantable!showById?id=${merId}&type=${types.typeId}"
																			style="cursor: hand">${merName}</a>
																		<br />
																		价格:${merPrice}
																	</div>

																</td>
															</s:iterator>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
											<TD id="t2" vAlign=top></TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<SCRIPT>
								var speed=20
								t2.innerHTML=t1.innerHTML
								function Marquee(){
								if(t2.offsetWidth-t0.scrollLeft<=0)
								t0.scrollLeft-=t1.offsetWidth
								else{
										t0.scrollLeft++
									}
								}
								var MyMarleft=setInterval(Marquee,speed)
								t0.onmouseover=function() {clearInterval(MyMarleft)}
								t0.onmouseout=function() {MyMarleft=setInterval(Marquee,speed)}
							</SCRIPT>
							<div style="padding-top: 10px; clear: left;">
							</div>
						</div>
					</div>
					<div style="clear: both; border: 1px #CCCCCC solid;">
						<div style="text-align: left;">
							商品描述:${merchantable.merDesc}
						</div>
						<div style="text-align: left; margin-top: 20px;">
							<input type="button" value="用户评介" title="点击查看用户评价"
								onclick="javascript:evaluation()" />
							&nbsp;&nbsp;
							<input type="button" value="添加评介" title="点击添加评价"
								onclick="javascript:addEval()" />
							<div id="eva">
							</div>
						</div>
					</div>
					<div id="addeval" style="margin-top: 10px; display: none">

						<div style="width: 330px; float: left; text-align: left;">
							<ul>
								<li>
									<b>感谢你的分享！</b>
									<br />
									如果你要发表的是购买此商品时遇到的一些问题（如产品规格），或寻求帮助或建议，请在该商品的用户论坛里发表，其它购物过程中发生的问题请查看帮助中心或联系客服中心获取帮助。

									如果你的评论涉及电影、剧集或小说的结局和关键情节，请勾选左下角的“有关键情节透露”，以免没有看过的人扫兴。
								</li>
								<li>
									<b>什么是好的评论？</b>
									<br />

									本站提倡真实、有具体见解的评论。评论应集中详细叙述商品的特性或使用感受。好的评论是不但要表明你的观点，还要说明原因，可以包括相关商品比较。

									用户评论必须为作者原创（如需转载，请提交在该商品的用户论坛里，并请注明原文作者和出处）。建议每篇评论的字数在50字以上，三言两语的内容，建议你在该商品的用户论坛里发表。
								</li>
							</ul>
						</div>
						<div style="text-align:left; margin:10px 0px 0px 10px; ">
							<form id="form1" name="form1" method="post">
								<textarea cols="50" rows="20" id="content"></textarea><br/>
								<input type="button" value="提交" onclick="addData(content.value)">
								<input type="reset" value="取消" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</center>
		<br />
		<jsp:include page="bottom.jsp" />
	</body>
</html>
