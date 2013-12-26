<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商城首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function research(){
			var type = document.getElementById('types').value;
			var keyword = document.getElementById('keyword').value;
			  //var urlEncodeURI = encodeURI("/e_shop/head/merchantable!research?type="+type+"&keyword="+keyword);
			//location.href=urlEncodeURI;
			/*document.write(keyword);*/
			
		}
	</script>
  </head>
  
  <body>
  				<div style="background-color: #eff8ed; height: 100px;">
					<div style="text-align:center; ">
						<img alt="电子商城" src="image/1.gif" width=1200px;>
					</div>
					<div style="padding-top: 10px; text-align: right; ">
					<form  method="post">
					<select id="types">
						<option value="0" ${(param.type=='0')? 'selected':''}>
							所有类别
						</option>
						<s:iterator value="#session.types" id="type">
							<option value="${typeId}" ${(param.type==typeId)? 'selected':''}>
								${typeName}
							</option>
						</s:iterator>
					</select>
					&nbsp;
					<input type="text" size="50" id="keyword" style="height: 25px;" />
					&nbsp;
					<input type="button" value="搜索" onclick="research()"/>
					&nbsp;
					<!--<span><a href="#">高级搜索</a> &nbsp;</span>
					--></form>
					</div>
				</div>
  </body>
</html>
