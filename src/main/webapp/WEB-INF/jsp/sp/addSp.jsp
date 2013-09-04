<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include  file="../common/commons.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘伴后台-产品列表</title>
<script type="text/javascript" src="${basePath }/resources/js/jquery.min1.7.1.js"></script>
<script type="text/javascript"
	src="${basePath}/resources/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/css/bastyle.css"/>
   

</head>

<body>
	<div class="bacontent">
		
		<div class="bac-right">
			<div class="bac-mbx">
			   添加特价商品
			</div>
			<div class="bac-mbx">
			 ${message }
			</div>
			<div class="table-nr">
		<form:form modelAttribute="sp" method="POST" action="${basePath}/admin/sp/addSp.do">  
		<form:label path="link">商品链接:</form:label>
				<form:input path="link" />
				<!-- parentCategoryId -->
						<form:label path="catalogId">请选择分类:</form:label>
				
				<form:select  disabled="false" htmlEscape="false"  items="${spCatalogs}" itemLabel="name" itemValue="id" path="catalogId">
			          
				</form:select>
		<input type="submit" value="添加"/>
				</form:form>
</div>
</div>
</div>
</body>
</html>
