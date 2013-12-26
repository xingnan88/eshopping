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

		<title>我的购物车</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="../js/index.js">
</script>
	<link   rel= "Shortcut   Icon "   href= "top.png ">
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<script type="text/javascript">
		function save(cartId){
		var num = document.getElementById(cartId).value;
		if(num == "" ){
			alert("请选择件数");
			return null;
		}
		if(num < 1){
			alert("请至少选择一件");
			return null;
		}
			location.href='/e_shop/head/member/mycart!update?cartId='+cartId+'&num='+num;
		}
		</script>
	</head>

	<body>
		<center>
			<div style="width: 1200px;">
				<jsp:include page="../top.jsp" />
				<jsp:include page="../left.jsp" />
				<div class="title" align="left">
					<span><a href="head/index" style="margin-left: 10px;">首页</a>
					</span>
				</div>
				<div>
					<div style="text-align: left; margin-top: 5px;">
						<span><img src="/e_shop/img/shop-cart.gif" />
						</span>
						<span style="margin-right: 10px; float: right;">
							<input type="button" value="进入结算中心" onclick="javascript:location.href='/e_shop/head/member/order.action'"/>&nbsp;&nbsp;用户:${member.memName}&nbsp;&nbsp; </span>
					</div>
					<div>
						<table style="width: 1050;">
							<tr
								style="height: 40px; width: 1045px; background-color: #d7f9d2; float: right;">
								<td class="tdd" width="500px">
									购物车中的商品
								</td>
								<td class="tdd" width="300px">
									商城价格
								</td>
								<td class="tdd" width="100px">
									数量
								</td>
								<td class="tdd">
									操作
								</td>
							</tr>
							<s:iterator value="carts">
								<tr style="height: 40px; width: 1045px; background-color: #eff9ed; float: right;">
									<td class="tdd" width="500px">
										${merchantable.merName}
									</td>
									<td  class="tdd" width="300px">
										<s:if test="merchantable.merDiscount == null">
										￥${merchantable.merPrice}
									</s:if>
										<s:else>
										￥${merchantable.merPrice*merchantable.merDiscount*0.1}	
									</s:else>
									</td>
									<td  class="tdd" width="100px">
										<input type="text" style="width:30px;" id="${cartId}" value="${cartNum}" />
									</td>
									<td>
										<input type="button" value="保存" onclick="save(${cartId})"/>
										<input type="button" value="删除" onclick="javascript:if(confirm('确定删除!')){location.href='/e_shop/head/member/mycart!delete?cartId=${cartId}'}"/>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
			</div>
		</center>
		<br/>
		<jsp:include page="../bottom.jsp"/>
	</body>
</html>
