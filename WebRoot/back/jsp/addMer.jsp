<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/addMerValidate.js"></script>
  </head>
  
  <body>
	<center>
		<div style="margin-top:10px;">商品信息</div>
		<s:actionmessage/>
		<form method="post" action="back/jsp/mer!saveMer" enctype="multipart/form-data" onsubmit="return validate()">
		<table style="margin-top:40px;border-spacing:0px;width:420px;">
			<tr>
				<td width="100px">商品类别:</td>
				<td width="300px">
					<select name="type">
						<s:iterator value="types">
							<option value="${typeId}">${typeName}</option>
						</s:iterator>
					</select>
					&nbsp;<font color="red">*</font>
				</td>
			</tr>
			
			<tr>
				<td>商品名称:</td>
				<td ><input type="text" name="merName" id="merName" onfocus="javascript:document.getElementById('merNameMessage').innerHTML='';"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merNameMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品价格:</td>
				<td><input type="text" name="merPrice" id="merPrice" onfocus="javascript:document.getElementById('merPriceMessage').innerHTML=''"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merPriceMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品折扣:</td>
				<td ><input type="text" name="merDiscount" id="merDiscount" onfocus="javascript:document.getElementById('merDiscountMessage').innerHTML=''"/>
					<div style="display:inline;" id="merDiscountMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品图片:</td>
				<td><input type="file" name="upload" id="upload" style="width:155px;" onfocus="javascript:document.getElementById('merUploadMessage').innerHTML=''"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merUploadMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品产地:</td>
				<td><input type="text" name="merPlace" id="merPlace" onfocus="javascript:document.getElementById('merPlaceMessage').innerHTML=''"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merPlaceMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品厂家:</td>
				<td><input type="text" name="merProducter" id="merProducter" onfocus="javascript:document.getElementById('merProducterMessage').innerHTML=''"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merProducterMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>出厂时间:</td>
				<td><input type="text" name="merLeaveDate" id="merLeaveDate" onfocus="javascript:document.getElementById('merLeaveDateMessage').innerHTML=''"/>&nbsp;<font color="red">*</font>
					<div style="display:inline;" id="merLeaveDateMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品描述:</td>
				<td>
					<textarea rows="10" cols="20" name="merDesc" id="merDesc"></textarea>
					<div style="display:inline;" id="merDescMessage"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定"/>
					<input type="reset" value="取消"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<br/>
					<div style="color: red;">说明：* 为必填内容，其中上传文件只能为图片，大小不能超过20KB,最好为100*132pix</div>
				</td>
			</tr>
		</table>
		</form>
	</center>
  </body>
</html>
