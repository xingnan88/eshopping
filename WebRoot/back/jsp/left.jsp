<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywo--rds" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="../../css/admin_css.css" type=text/css rel=Stylesheet>
	</head>

	<body style="background-color:#7f9354;">
		<div id="left">
			<div id="top1" style="width: 129px; height: 75px">
				<ul>
					<li>
						<table>
							<tr>
								<td>
									<img alt="首页" src="../../img/top_2.gif">
								</td>
								<td>
									<a href="" class="A1"
										onclick="window.top.location.href='/e_shop/back/jsp/index.jsp'">首页</a>
								</td>
								<td>
									<img alt="退出" src="../../img/top_7.gif">
								</td>
								<td>
									<a href="" class="A1"
										onclick="window.top.location.href='/e_shop/back/jsp/admin!exit'">&nbsp;退出</a>
								</td>
							</tr>
						</table>
					</li>
					<li>
						用户名称：${admin.adminName}
					</li>
					<li>
						欢迎进入商城后台管理 
					</li>
				</ul>
			</div>
			<div id="menu" style="background-color: ">
				<ul id="nav">
					<s:if test="#session.admin.adminType==1">
					<li>
						<a href="left.jsp#Menu=Menu1" onClick="DoMenu('Menu1')"><strong>商品信息管理</strong>
						</a>
						<ul id="Menu1" class="collapsed">
							<li>
								<a href="mer!showAllMer?page=1" target="main">商品信息</a>
							</li>
							<li>
								<a href="addMerType!getAllType" target="main">商品添加</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="left.jsp#Menu=Menu5" onClick="DoMenu('Menu5')"><strong>商品分类管理</strong>
						</a>
						<ul id="Menu5" class="collapsed">
							<li>
								<a href="typeInfoType!getAllType" target="main">分类信息</a>
							</li>
						</ul>
					</li>
					</s:if>
					<s:if test="#session.admin.adminType==2">
					<li>
						<a href="left.jsp#Menu=Menu2" onClick="DoMenu('Menu2')"><strong>订单管理</strong>
						</a>
						<ul id="Menu2" class="collapsed">
							<li>
								<a href="orders!showOrders?page=1"
									target="main">订单信息</a>
							</li>
						</ul>
					</li>
					</s:if>
					<s:if test="#session.admin.adminType==3">
					<li>
						<a href="left.jsp#Menu=Menu3" onClick="DoMenu('Menu3')"><strong>会员管理</strong>
						</a>
						
						<ul id="Menu3" class="collapsed">
							<li>
								<a href="mem!showMem?page=1"
									target="main">会员信息</a>
							</li>
						</ul>
						
					</li>
					</s:if>
					<li>
						<a href="left.jsp#Menu=Menu4" onClick="DoMenu('Menu4')"><strong>后台用户管理</strong>
						</a>
						<ul id="Menu4" class="collapsed">
							<li>
							<s:if test="#session.admin.adminType==4">
								<a href="admin?page=1"
									target="main">后台用户信息</a>
							</s:if>
								<a href="modifyPwd.jsp"
									target="main">管理员密码修改</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<script src="../../js/leftButton.js"></script>
			<div id="bottom"></div>
		</div>
	</body>
</html>