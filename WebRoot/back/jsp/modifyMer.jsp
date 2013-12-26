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
		<div style="margin-top:10px;">商品信息修改</div>
		<s:actionmessage/>
		<form method="post" action="back/jsp/mer!updateMer?id=${merchantable.merId}" enctype="multipart/form-data" onsubmit="return validate()">
		<table style="margin-top:40px;border-spacing:0px;">
			<tr>
				<td>商品类别:</td>
				<td>
					<select name="type">
						<s:iterator value="types">
							<option value="${typeId}" ${typeId == merchantable.types.typeId ? 'selected':'' }>${typeName}</option>
						</s:iterator>
					</select>
				</td>
				<td><font color="red">*</font></td>
				<td></td>
			</tr>
			
			<tr>
				<td>商品名称:</td>
				<td><input type="text" name="merName" id="merName" value="${merchantable.merName}" onfocus="javascript:document.getElementById('merNameMessage').innerHTML='';"/></td>
				<td><font color="red">*</font></td>
				<td width="200">
					<div style="display:inline;" id="merNameMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品价格:</td>
				<td><input type="text" name="merPrice" id="merPrice" value="${merchantable.merPrice}" onfocus="javascript:document.getElementById('merPriceMessage').innerHTML='';"/></td>
				<td><font color="red">*</font></td>
				<td>
					<div style="display:inline;" id="merPriceMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品折扣:</td>
				<td><input type="text" name="merDiscount" id="merDiscount" value="${merchantable.merDiscount}" onfocus="javascript:document.getElementById('merDiscountMessage').innerHTML='';"/></td>
				<td>
					<div style="display:inline;" id="merDiscountMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品图片:</td>
				<td><img src="${merchantable.merPicture}" />
					<input type="hidden" value="${merchantable.merPicture}" id="upload" /> 
				</td>
				<td><font color="red">*</font></td>
				<td>
					<div style="display:inline;" id="merUploadMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品产地:</td>
				<td><input type="text" name="merPlace" id="merPlace" value="${merchantable.merPlace}" onfocus="javascript:document.getElementById('merPlaceMessage').innerHTML='';"/></td>
				<td><font color="red">*</font></td>
				<td>
					<div style="display:inline;" id="merPlaceMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品厂家:</td>
				<td><input type="text" name="merProducter" id="merProducter" value="${merchantable.merProducter}" onfocus="javascript:document.getElementById('merProducterMessage').innerHTML='';"/></td>
				<td><font color="red">*</font></td>
				<td>
					<div style="display:inline;" id="merProducterMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>出厂时间:</td>
				<td><input type="text" name="merLeaveDate" id="merLeaveDate" value="${merchantable.merLeaveDate}" onfocus="javascript:document.getElementById('merLeaveDateMessage').innerHTML='';"/></td>
				<td><font color="red">*</font></td>
				<td>
					<div style="display:inline;" id="merLeaveDateMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>商品描述:</td>
				<td>
					<textarea rows="10" cols="20" name="merDesc" id="merDesc">${merchantable.merDesc}</textarea>
				</td>
				<td>
					<div style="display:inline;" id="merDescMessage"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="确定"/>
					<input type="reset" value="取消"/>
				</td>
			</tr>
		</table>
		</form>
	</center>
  </body>
</html>
