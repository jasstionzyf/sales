<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include  file="../common/commons.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘伴后台-产品列表</title>

<script type="text/javascript" src="${basePath }/resources/js/jquery.min1.7.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


<script type="text/javascript"
	src="${basePath}/resources/DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/css/bastyle.css"/>
   
<script type="text/javascript">
$(document).ready(function(){
	$("#listTable").children("tbody").sortable({
		cursor : 'pointer',
		delay : 200,
		bakctound : 'red' ,
		stop : function(){
			$("tbody>tr:odd").removeAttr("class").addClass("w-bgcolor");
			$("tbody>tr:even").removeAttr("class").addClass("g-bgcolor");
		}
	});
	
	

	
		
		
})
function closeDialog(){
	 $("#bigImg").dialog( "close" );
}
function bigShow(imgUrl){

	 $("#bigImgUrl").attr('src',imgUrl);
	 $( "#bigImg" ).dialog();
}
function setPriority(){
	var ids='';

	$("td.id").each(function() {
		ids=ids+"spId="+this.textContent+"&";
		
	});
	//alert(ids);
	$.ajax({
 	   type: "POST",
 	   url: "${basePath}/admin/sp/setPriority",
 	   data: ids,
 	   success: function(msg){
 		   alert(msg);
 		  location.reload();
 	   }
 	 });
	
	
}


</script>
</head>

<body>
	
			<div class="bac-mbx">
			  商品排序
			</div>
			<!-- 商品列表 -->
			<form:form modelAttribute="spQueryPara" method="get" action="${basePath}/admin/sp/listForSort.do" id="queryForm">  
			
	
       <li>请选择分类:
      		   
      		    <form:radiobuttons disabled="false" htmlEscape="false"    items="${spCatalog}"  itemLabel="name" itemValue="id" path="catalogId"/>
    
			
				</li>
				

						<li><input type="submit" value="查询"/></li>
						</form:form>
						</div>
			<div class="table-nr">
			<div class="bat-zmxx list-ycnr">
	        <!--CompetitiveSp列表-->
	        <table class="kuandu-tb"  border="0.3" style="width:100%" cellpadding="0" cellspacing="0" id="listTable">
			<tr class="no1hang">
			<td align="left" width="20">序号</td>
		    <td>商品id</td>
			<td>标题</td>
		    <td>原价</td>
		    <td>现价</td>
		    
		
		    <td>已售</td>
		    <td>评论</td>
		    <td>点击数</td>
		    <td>图片</td>
	
	
		    <td>上线时间</td>
	
		    </tr>
		    <tbody id="tuodong">
		    <c:forEach items="${spList}" var="sp" varStatus="status">
		    <tr>
		    <td >${status.index }</td>
		    <td class="id"><a href="${sp.link}">${sp.id}</a></td>
			<td><a href="${sp.link}">${sp.spName}</a></td>
		   
		    <td>${sp.oprice}</td>
		    <td>${sp.price}</td>
		 
		    <td>${sp.orderedNumber}</td>
		    <td>${sp.reviewCount}</td>
		    <td>${sp.clickCount}</td>
		    <!-- http://img.taoban.com/i/100-40-1/ -->
		    <td><img src="${basePath}/ud/i/100-40?pl=${fn:substringAfter(sp.pictureUrl, '//')}"  onmouseout="closeDialog()"  onmouseover="bigShow('${basePath}/ud/i/400-400?pl=${fn:substringAfter(sp.pictureUrl, '//')}')"></img></td>
		 
		    <td><fmt:formatDate value="${sp.displayedDate}" type="both"/></td>
		    
		 
	
			</tr>
			</c:forEach>
			</tbody>
			<tr><a href="javascript:setPriority();" >确定排序</a></tr>
			</table>
			
<div id="bigImg" title="">
		    <img id="bigImgUrl" src=""></img>
		    </div>
			</div>
		    	    
</body>
</html>
