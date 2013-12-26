<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>修改管理员</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function validate(){
			var adminName = document.getElementById('adminName').value;
			var message = document.getElementById('message');
			if(adminName == "" || adminName == NULL){
				message.innerHTML = '管理员名不能为空';
				return false;
			}
			return true;
		}
	</script>
	</head>

	<body>
		<center>
		<div style="margin-top:70px;text-align:center;">
			<div id="message" style="display: inline;"></div>
			<form method="post" action="back/jsp/admin!update" onsubmit="return validate()">
				<table>
					<tr height=50px;>
						<td>
							管理员名:&nbsp;<input type="text" name="adminName" id="adminName" value="${param.adminName}"/>
						</td>
					</tr>

					<tr height=50px;>
						<td>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:
							<select name="adminType">
								<option value="1" ${(param.adminType == '1') ? 'selected':''}>
									商品管理员
								</option>
								<option value="2" ${(param.adminType == '2') ? 'selected' : '' }>
									订单管理员
								</option>
								<option value="3" ${(param.adminType == '3') ? 'selected' : '' }>
									会员管理员
								</option>
								<option value="4" ${(param.adminType == '4') ? 'selected' : '' }>
									系统管理员
								</option>
							</select>
						</td>
					</tr>

					<tr height=50px; align="center">
						<td>
							<input type="hidden" name="adminId" value="${param.adminId}"/>
							<input type="submit" value="保存"/>
							<input type="reset" value="取消" />
						</td>
					</tr>
				</table>
			</form>
			</div>
		</center>
	</body>
</html>
