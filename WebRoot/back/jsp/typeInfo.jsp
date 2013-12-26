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
    
    <title>商品分类管理</title>
    
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
			width:200px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td2{
			width:400px;
			border-right:1px #CCCCCC solid;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
		.td4{
			width:250px;
			border-bottom:1px #CCCCCC solid;
			height:40px;
		}
	</style>
	<script type="text/javascript">
		function addType(){
			document.getElementById("add").style.display='block';
			document.getElementById("message").style.display="none";
		}
		function modify(id){
			var typename = "typename"+id;
			var typename2 = document.getElementById(typename);
			typename2.disabled=false;
			typename2.focus();
			var typedesc = "typedesc"+id;
			var typedesc2 = document.getElementById(typedesc);
			typedesc2.disabled=false;
			var operat = 'operat'+id;
			var operat2 = document.getElementById(operat).innerHTML="<input type='button' value='保存' onclick='saveupdate("+id+")'/> ";
		}
		function saveupdate(id){
			var typename = "typename"+id;
			var typename2 = document.getElementById(typename).value;
			var typedesc = "typedesc"+id;
			var typedesc2 = document.getElementById(typedesc).value;
			location.href="/e_shop/back/jsp/updateType!updateType?id="+id+"&typeName="+typename2+"&typeDesc="+typedesc2;
		}
	</script>
  </head>
  
  <body>
  	<center>
  		<div style="margin-top:10px;text-align:center;">商品分类</div>
  		<div id="message" style="color: red;text-align:center;"><s:actionerror/></div>
  		<div style="margin: 20px 0px 0px 110px;text-align:left;	"><input type="button" value="添加类别" onclick="addType()"/><input type="button" value="收起" onclick="javascript:document.getElementById('add').style.display='none';"/></div>
  		<div id="add" style="margin-left:110px; display: none;">
  				<form method="post" action="back/jsp/addType!addType">
  				<div style="float:left;">名称:&nbsp;<input type="text" name="typeName" size=20px; /></div>
  				<div style="float:left;">&nbsp;&nbsp;描述:&nbsp;<input type="text" name="typeDesc" size=50px;/></div>
  				<div style="float:left;">&nbsp;&nbsp;<input type="submit" value="保存"/></div>
  				</form>
  		</div>
  		<table style="clear:both;margin-top:20px;border:1px #CCCCCC solid;text-align:center;border-spacing:0px;">
  			<tr>
				<th class="td1">类别名称</th>
				<th class="td2">描述</th>
				<th class="td4">操作</th>
  			</tr>
  			<s:iterator value="types">
  			<tr>
  				<td class="td1"><input type="text" id="typename${typeId}" value="${typeName}" disabled=true style="border:0px; width:200px;text-align:center;height:40px;font-size:14px;" /></td>
  				<td class="td2"><input type="text" id="typedesc${typeId}" value="${typeDesc}" disabled=true style="border:0px; width:400px;text-align:center;height:40px;font-size:14px;" /></td>
  				<td class="td4" >
  					<div id="operat${typeId}">
  					<input type="button" value="删除" onclick="javascript:if(confirm('确定删除')){location.href='back/jsp/delType!deleteType?id=${typeId}'}"/>
  					<input type="button" value="修改" onclick="modify(${typeId})"/>
  					<s:if test="typeRecommend == 0">
  						<input type="button" value="推荐种类" onclick="javascript:location.href='/e_shop/back/jsp/delType!recommend?id=${typeId}'"/>
  					</s:if>
  					<s:else>
  						<input type="button" value="取消推荐" onclick="javascript:location.href='/e_shop/back/jsp/delType!cancelRecommend?id=${typeId}'"/>
  					</s:else>
  					</div>
  				</td>
  			</tr>
  			</s:iterator>
  		</table>
  	</center>
  </body>
</html>