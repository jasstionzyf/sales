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
			 添加特价商品分类映射
			</div>
			<div class="bac-mbx">
			 ${message}
			</div>
			<div class="table-nr">
			<form:form modelAttribute="catalogMapping" method="POST" action="${basePath}/admin/sp/addCatalogMapping.do">  
				<form:label path="catalogId">天猫分类标识:</form:label>
				<form:input path="catalogId" />
								<form:label path="spCatalogId">淘伴分类标识:</form:label>
				
				<form:select items="${spCatalog}" itemLabel="name" itemValue="id" path="spCatalogId">
			
				</form:select>
		<input type="submit" value="添加"/>
				</form:form>
		
<!-- 添加分类映射 -->
</div>
</div>

</div>
</body>
</html>
