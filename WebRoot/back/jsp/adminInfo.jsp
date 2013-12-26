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
    
    <title>系统维护</title>
    
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
			width:100px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td2{
			width:150px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td3{
			width:150px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td4{
			width:200px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
	</style>
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
  		<div style="margin-top:10px;">管理信息</div>
  		<div id="message" style="margin-top: 20px;color:red;"><s:actionerror/></div>
  		<div style="text-align:left;margin:20px 0px 0px 230px;">
  			<input type="button" value="添加" onclick="javascript:document.getElementById('new').style.display='block';"/>
  			<input type="button" value="收起" onclick="javascript:document.getElementById('new').style.display='none';"/>
  		</div>
  		<div id="new" style="display:none;">
  			<form method="post" action="/e_shop/back/jsp/admin!save" onsubmit="return validate()">
  			管理员名:<input type="text" name="adminName" id="adminName"/>
  			<select name="adminType">
  				<option value="1">商品管理员</option>
  				<option value="2">订单管理员</option>
  				<option value="3">会员管理员</option>
  				<option value="4">系统管理员</option>
  			</select>
  			<input type="submit" value="保存"/>
  			密码默认为:123
  			</form>
  		</div>
  		<table style="margin-top:20px;border:1px #CCCCCC solid;text-align:center;border-spacing:0px;">
  			<tr>
				<th class="td1">编号</th>
				<th class="td2">管理员名</th>
				<th class="td3">管理员类别</th>
				<th class="td4">操作</th>
  			</tr>
  			<s:iterator value="admins">
  			<tr>
  				<td class="td1">${adminId}</td>
  				<td class="td2">${adminName}</td>
  				<s:if test="adminType == 1">
  					<td class="td3">商品管理员</td>
  				</s:if>
  				<s:elseif test="adminType == 2">
  					<td class="td3">订单管理员</td>
  				</s:elseif>
  				<s:elseif test="adminType == 3">
  					<td class="td3">会员管理员</td>
  				</s:elseif>
  				<s:elseif test="adminType == 4">
  					<td class="td3">系统管理员</td>
  				</s:elseif>
  				<td class="td4">
  					<input type="button" value="删除" onclick="javascript:if(confirm('确定删除此会员'))location.href='/e_shop/back/jsp/mem!delMem?memId=${memId}&page=1'"/>
  					<input type="button" value="修改" onclick="javascript:window.open('/e_shop/back/jsp/modifyAdmin.jsp?adminName=${adminName}&adminType=${adminType}&adminId=${adminId}','修改管理员','width=300,height=300,top=250,left=500')"/>
  				</td>
  			</tr>
  			</s:iterator>
  		</table>
  		<div style="margin-top:40px;">${pageBean.ctrlInfo}</div>
  	</center>
  </body>
</html>
