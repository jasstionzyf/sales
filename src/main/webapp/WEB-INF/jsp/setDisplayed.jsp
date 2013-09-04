<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
<script>
alert("hello!");
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
</head>
<body>
<div>
<c:forEach var="sp" items="${requestScope.sps}">
    <div><a href="${sp.link }" >title:${sp.spName} </a> <img src="${sp.pictureUrl}"/> 价格:${sp.price } 原价${sp.oprice } 折扣:${sp.discount} 销量:${sp.orderedNumber}
    
    
    </div>
</c:forEach>


</div>
</body>
</html>