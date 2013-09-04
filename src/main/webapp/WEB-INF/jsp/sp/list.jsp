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
	
	
	
	
	
	
	
	$("#allCheck").click(function(){ 
		var isChecked=$(this).attr("checked");
	//	alert(isChecked);
	    if(isChecked=='checked'){
	    	$("input[name='checkedSpId']").each(function() { 
	    		$(this).attr("checked", true); 
	    		})
	    }
	    else{
	    	$("input[name='checkedSpId']").each(function() { 
	    		$(this).attr("checked", false); 
	    		})
	    }
		
	})
	
		
		
})
function batchSetDisplay(isDisplayed){
    var str = $("#spListFrom").serialize();
   // alert(str);
    $.ajax({
    	   type: "POST",
    	   url: "${basePath}/admin/sp/batchSetDisplay",
    	   data: str+"&isDisplay="+isDisplayed,
    	   success: function(msg){
    		   alert(msg);
    		   location.reload();
    	   }
    	 });


}
function toPage(pn){
	
    var catalogId=${spQueryInfo.catalogId};
	var parentCatalogId=${spQueryInfo.parentCatalogId};
	var bprice=${spQueryInfo.bprice};
	var eprice=${spQueryInfo.eprice};
	
	var displayed=${spQueryInfo.displayed};
	
   var  sortField='${spQueryInfo.sortField}';
   var  order='${spQueryInfo.order}';
 	var url="<%=basePath%>/admin/sp/list.do?count=40&cpn="+pn+"";
 	
		url=url+"&displayed="+displayed+"";
 if(catalogId!=0){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!=0){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	if(bprice!=0){
		url=url+"&bprice="+bprice+""
	}
	if(eprice!=0){
		url=url+"&eprice="+eprice+""
	} 
	 if(sortField!=''){
		url=url+"&sortField="+sortField+""
	}
	if(order!=''){
		url=url+"&order="+order+""
	} 
	
 window.location=url; 
}

function setDisplay(spId,isDisplayed){
	//setDisplayOrNot?spId=${sp.id}&isDisplay=${!sp.displayed}
//	alert(isDisplayed);
    $.ajax({
    	   type: "GET",
    	   url: "${basePath}/admin/sp/setDisplayOrNot?spId="+spId+"&isDisplay="+isDisplayed,
    	   success: function(msg){
    		   alert(msg);
    		   location.reload();
    	   }
    	 });


}
function closeDialog(){
	 $("#bigImg").dialog( "close" );
}
function bigShow(imgUrl){

	 $("#bigImgUrl").attr('src',imgUrl);
	 $( "#bigImg" ).dialog();
}

function addCompetitiveSp(spId,type){
	 $.ajax({
  	   type: "GET",
  	   url: "${basePath}/admin/sp/addCompetitiveSp?spId="+spId+"&type="+type,
  	   success: function(msg){
  		   alert(msg);
  		   //location.reload();
  	   }
  	 });
	

}
function edit(url){
	window.open(url);
}

</script>
</head>

<body>
		

			<div class="bac-mbx">
			   sp列表
			</div>
			<!-- 商品列表 -->
			<div class="table-nr">
			<div class="bat-zmxx list-ycnr">
	<form:form modelAttribute="spQueryInfo" method="get" action="${basePath}/admin/sp/list.do" id="queryForm">  
	<form:hidden path="count" value="40" />
			
<!-- 			<li>分类:服装(<input type="checkbox" value="1" name="catalogId"/>内衣     <input type="checkbox" name="catalogId" value="2"/>男装)</li>
 -->				
       <li>请选择分类:
       <!--<form:select items="${spCatalog}" itemLabel="name" itemValue="id" path="catalogId" ></form:select>-->
      		   
      		    <form:radiobuttons disabled="false" htmlEscape="false"    items="${spCatalog}"  itemLabel="name" itemValue="id" path="catalogId"/>
    
			
				</li>
				 <li>上架时间:
      		   <form:radiobutton path="dispalyedDays"  value="0"/>不限制<form:radiobutton path="dispalyedDays"  value="2"/>>两天 <form:radiobutton path="dispalyedDays"  value="4"/>>四天 <form:radiobutton path="dispalyedDays"  value="6"/>>六天
      		    
    
			
				</li>
 		<li>价格:<form:input path="bprice" size="10" />——<form:input path="eprice" size="10" /></li>
			
						<li>状态:<form:radiobutton path="displayed" value="true" />通过(前台显示) <form:radiobutton path="displayed" value="false" />未通过(前台不显示)
						</li>
						<!-- asc desc -->
						<li>排序:<form:radiobutton path="sortField" value="orderedNumber"/>销量排序<form:radiobutton path="sortField" value="reviewCount"/>评论排序
						<form:radiobutton path="sortField" value="oprice"/>原价排序
						<form:radiobutton path="sortField" value="price"/>现价排序
						<form:radiobutton path="sortField" value="discount"/>折扣排序
						<form:radiobutton path="sortField" value="findTime"/>收录时间排序
						<form:radiobutton path="sortField" value="clickCount"/>点击数排序
						
						
						</li>
						<li>排序方式:<form:radiobutton path="order" value="a"/>升序<form:radiobutton path="order" value="d"/>降序
						</li>
						<li>标题查询:<form:input path="spName" size="30" />
						</li>
						<li><input type="submit" value="查询"/></li>
						</form:form>
						</div>
						
			<form id="spListFrom">
			<table class="kuandu-tb" width="200" border="1" cellpadding="0" cellspacing="0">
			<tr class="no1hang">
			<td><input type="checkbox" id="allCheck"/>全选</td>
			<td width="5">序号</td>
		    <td>Id</td>
			<td>标题</td>
			<td>商家</td>
		    <td>原价</td>
		    <td>现价</td>
		 <!--    <td>折扣</td> -->
		    <td>已售</td>
		    <td>评论</td>
		      <td>点击数</td>
		    <td>图片</td>
		<!--     <td>采集时间</td>
		    <td>更新时间</td> -->
		    <td>上线时间</td>
		    <td>状态</td> 
		    <td width="80">操作</td>
		    <td width="80">编辑</td>
		    </tr>
		    <c:forEach items="${sps}" var="sp" varStatus="status">
			<tr class="${status.index%2==0?'w-bgcolor':'g-bgcolor'}">
			<td><input type="checkbox" value="${sp.id}" name="checkedSpId"></td>
			<td><font>${status.index+1}</font></td>
		    <td><a href="${sp.link}">${sp.id}</a></td>
			<td  ><a href="${sp.link}">${sp.spName}</a></td>
		   	<td>${sp.shopName}</td>
		    <td>${sp.oprice}</td>
		    <td>${sp.price}</td>
		   <%--  <td>${sp.discount}</td> --%>
		    <td>${sp.orderedNumber}</td>
		    <td>${sp.reviewCount}</td>
		    <td>${sp.clickCount}</td>
		    <td><img src="${basePath}/ud/i/100-40?pl=${fn:substringAfter(sp.pictureUrl, '//')}" onmouseout="closeDialog()" onmouseover="bigShow('${basePath}/ud/i/400-400?pl=${fn:substringAfter(sp.pictureUrl, '//')}')"></img></td>
		   <%--  <td><fmt:formatDate value="${sp.findDate }" type="both"/></td>
		    <td><fmt:formatDate value="${sp.updatedDate}" type="both"/></td> --%>
		    <td><fmt:formatDate value="${sp.displayedDate}" type="both"/></td>
		    
		     <td><c:if test="${sp.displayed==true}">上架</c:if>
		    
		    <c:if test="${sp.displayed!=true}">未上架</c:if>
		    </td>
		    <td><a href="javascript:setDisplay(${sp.id},${!sp.displayed});"><c:if test="${sp.displayed!=true}">上架</c:if>
		    
		    <c:if test="${sp.displayed==true}">下架</c:if></a></br></br></br></br></br><a href="javascript:addCompetitiveSp(${sp.id},'9.9');">加入到9.9</a></td>
		    <td><a href="javascript:edit('${basePath}/admin/sp/forwardUpdateSpInfo.do?spId=${sp.id}');">编辑</a></td></tr>
			</c:forEach>
			<tr><td><a href="javascript:batchSetDisplay(true);">全部上架</a></td>
			<td><a href="javascript:batchSetDisplay(false);">全部下架</a></td>
			
			</tr>
			<tr>
			<div id="sp-pig" >
<div ></div>
<div >
<c:forEach begin="1" step="1" end="${spQueryInfo.pageCount }" varStatus="c" >
  <a href="javascript:toPage(${c.index});" rel="next"   id='page-${c.index}' >${c.index}</a>


</c:forEach>

共${spQueryInfo.pageCount }页 
</div>
</div>
			</tr>
			</table>
			</form>
			
		    <div id="bigImg" title="">
		    <img id="bigImgUrl" src=""></img>
		    </div>
		    
			</div>
</body>
</html>
