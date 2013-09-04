<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include  file="./common/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="http://l.tbcdn.cn/apps/top/x/sdk.js?appkey=21548602"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>天天特价，全网9.9包邮—【折折折网】</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/search-form.css"/>

<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/tytj_style.css" />
<meta name="Keywords" content="折折折，天天特价"/>
<meta name="description" content="【折折折】，每日专挑超值特价商品，淘宝、天猫冲信誉商家商品，超低价格，天天特价，省钱省到家" />
<style type="text/css">
<!--
html,body,div,span,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,address,big,cite,code,del,em,font,img,ins,small,strong,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend{margin:0;padding:0;font-size:12px;font-family:宋体;}
-->
.line_ul li{
float:left;
}
.searchArea div{
float:left;
}
h1 {
	font: bold 80%/120% Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	margin: 0 0 10px;
	color: #999;
}
h2 {
	font-size: 2.5em;
	margin: 0 0 8px;
}
h3 {
	font-size: 1.6em;
	margin: 20px 0 5px;
}
a {
	color: #69C;
	text-decoration: none;
}
a:hover {
	color:red;
}
p {
	margin: 0 0 10px;
}
em {
	font: italic 100% "Times New Roman", Times, serif;
}
.credits {
	border-bottom: solid 1px #eee;
	padding-bottom: 10px;
	margin: 0 0 30px;
}
#pagewrap {
	margin: 0 auto;
	width: 600px;
	padding-left: 150px;
	position: relative;
}

/*
Back to top button 
*/
#back-top {
	position: fixed;
	bottom: 30px;
	margin-left: -150px;
}
#back-top a {
	width: 108px;
	display: block;
	text-align: center;
	font: 11px/100% Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	text-decoration: none;
	color: #bbb;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}
#back-top a:hover {
	color: #000;
}
/* arrow icon (span tag) */
#back-top span {
	width: 108px;
	height: 108px;
	display: block;
	margin-bottom: 7px;
	background: #ddd url(../images/up-arrow.png) no-repeat center center;
	/* rounded corners */
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}
#back-top a:hover span {
	background-color: #777;
}
</style>
<script type="text/javascript" src="<%=basePath%>/resources/js/jquery.min1.7.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body class="tytj-bg">
<script type="text/javascript">

	// hide #back-top first
	//$("#back-top").hide();
	
	// fade in #back-top
	$(function () {
		$(window).scroll(function () {

			if ($(this).scrollTop() > 100) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		$('#back-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});

function addToFavorite(){
	var url="http://www.zhezhezhe.cn?fr=Favorite";
	var title="折折折-超值精品折扣";
	if(document.all){
	window.external.AddFavorite(url,title);
	}else{
	if(window.sidebar){
	window.sidebar.addPanel(title,url,"");
	}else{
	alert("对不起，您的浏览器不支持直接添加到收藏夹!\n请先按Ctrl键再按D键收藏本站。");
	}
	}
	}
</script>
<script type="text/javascript">
var catalogId=${spQueryInfo.catalogId};
var parentCatalogId=${spQueryInfo.parentCatalogId};
var bprice=${spQueryInfo.bprice};
var eprice=${spQueryInfo.eprice};

var keyWord='${spQueryInfo.keyWord==null?'':spQueryInfo.keyWord}';
var mallId='${spQueryInfo.mallId==null?'':spQueryInfo.mallId}';
function setMallId(mall){
	var isCheck=$('#mall_'+mall).attr("checked");
	//alert(isCheck);
	if(isCheck){
		mallId+=mall+",";
		
	}
	else{
		
		regex= new RegExp(""+mall+"[,]{0,}","gi");
		mallId=mallId.replace(regex, "");
	}
	
}
function toPage(pn){
	
	var url="<%=basePath%>/query/sp.do?count=40&cpn="+pn+""+"&sortField=price&order=a";
	
	if(keyWord!=''){
		url=url+"&keyWord="+keyWord+""
	}
	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	if(catalogId!='0'){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!='0'){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	if(bprice!='0'){
		url=url+"&bprice="+bprice+""
	}
	if(eprice!='0'){
		url=url+"&eprice="+eprice+""
	}
	 window.location=url;
}
function priceRange(bprice1,eprice1){
	var url="<%=basePath%>/query/sp.do?count=40&i=1";

	if(keyWord!=''){
		url=url+"&keyWord="+keyWord+""
	}
	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	
	if(catalogId!='0'){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!='0'){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	
		url=url+"&bprice="+bprice1+""
	
	if(eprice1!=-1){
		url=url+"&eprice="+eprice1+""
	}
	 window.location=url;
}
function upPage(pn){
	var url="<%=basePath%>/query/sp.do?count=40&cpn="+pn+""+"&sortField=price&order=a";

	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	if(keyWord!=''){
		url=url+"&keyWord="+keyWord+""
	}
	if(catalogId!='0'){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!='0'){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	if(bprice!='0'){
		url=url+"&bprice="+bprice+""
	}
	if(eprice!='0'){
		url=url+"&eprice="+eprice+""
	}
	 window.location=url;
}
function downPage(pn){
	var url="<%=basePath%>/query/sp.do?count=40&cpn="+pn+""+"&sortField=price&order=a";

	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	if(keyWord!=''){
		url=url+"&keyWord="+keyWord+""
	}
	
	if(catalogId!='0'){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!='0'){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	if(bprice!='0'){
		url=url+"&bprice="+bprice+""
	}
	if(eprice!='0'){
		url=url+"&eprice="+eprice+""
	}
	 window.location=url;
}
function catalog(catalogId){
	url="<%=basePath%>/query/sp.do?count=40&catalogId="+catalogId;

	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	if(keyWord!=''){
		url=url+"&keyWord="+keyWord+""
	}
	 window.location=url;


}
var search=function(){
	
	keyWord=$('#keyWord').val();
//	alert(keyWord);
	if(keyWord==''){
		alert("请输入关键字");
		return;
	}
	url="<%=basePath%>/query/sp.do?count=40"+"&keyWord="+keyWord;
	if(mallId!=''){
		url=url+"&mallId="+mallId+""
	}
	if(catalogId!='0'){
		url=url+"&catalogId="+catalogId+""
	}
	if(parentCatalogId!='0'){
		url=url+"&parentCatalogId="+parentCatalogId+""
	}
	if(bprice!='0'){
		url=url+"&bprice="+bprice+""
	}
	if(eprice!='0'){
		url=url+"&eprice="+eprice+""
	}
	 window.location=url;

}

/*  */
	$(document).keydown(function(event){
		  if(event.which==13){
				keyWord=$('#keyWord').val();
//				alert(keyWord);
				if(keyWord==''){
					alert("请输入关键字");
					return;
				}
				url="<%=basePath%>/query/sp.do?count=40"+"&keyWord="+keyWord;
				if(mallId!=''){
					url=url+"&mallId="+mallId+""
				}
				if(catalogId!='0'){
					url=url+"&catalogId="+catalogId+""
				}
				if(parentCatalogId!='0'){
					url=url+"&parentCatalogId="+parentCatalogId+""
				}
				if(bprice!='0'){
					url=url+"&bprice="+bprice+""
				}
				if(eprice!='0'){
					url=url+"&eprice="+eprice+""
				}
				 window.location=url;
		  }
		   
		});
	$(document).ready(function(){

	$('#keyWord').val(keyWord);

	
	$("#page-${spQueryInfo.cpn}").addClass('pct');	
	$("#catalog-${spQueryInfo.catalogId}").addClass('pct');	

	$("#p-${spQueryInfo.bprice}").addClass('pct');	
    

  });


</script>
<div class="gui-baoyou">
<div class="max-w wh-1200">
<div class="g-nav">
<a href="<%=basePath%>/query/sp.do?count=40">首页</a>
<a href="<%=basePath%>/query/sp.do?count=40" target="_blank">商城大全</a>
</div>
<div class="g-fun">
<ul>
<!-- http://share.v.t.qq.com/index.php?c=share&a=index&url=http://www.zhe800.com/ju_deal/nanxiuxian_31289&title=%E7%94%B7%E4%BC%91%E9%97%B2%E5%8D%A1%E9%80%9A%E7%9F%AD%E8%A2%96T%E6%81%A4%20%20%20%E5%8E%9F%E4%BB%B7118%E5%85%83%20%E6%8A%98%E6%89%A3%E4%BB%B716%E5%85%83%20%20%20%E5%A4%9A%E6%95%B0%E5%9C%B0%E5%8C%BA%E5%8C%85%E9%82%AE%E5%86%85%E8%AF%A6&pic=http://p12.tuan800.net/upload/deal/image/31289/normal_c0436d21f0a5ce9901b6f66e57fd534a.jpg -->
<li><a href="javascript:addToFavorite();">加入收藏夹</a> | <a href="<%=basePath%>/feedback.html" target="_blank">意见反馈</a></li>| <a href="http://share.v.t.qq.com/index.php?c=share&a=index&url=http://www.zhezhezhe.cn/index.do&title=全网超值优惠商品信息尽在这里&pic=http://p12.tuan800.net/upload/deal/image/31289/normal_c0436d21f0a5ce9901b6f66e57fd534a.jpg" target="_blank">qq微博分享</a></li>
</ul>
</div>
</div>
</div>
<div class="baoyou-header">
<!-- <div class="topimages"><a href="/"><img src="http://img.taoban.com/resources/images/tb3/baoyou/top.jpg" alt="折折折首页"></a></div>
<div class="topbanner"><a href="http://tuijian.taoban.com/5068.html" target="_blank"><img src="" alt="" width="920" height="90"></a></div>
 -->
<div class="topbanner"> <iframe src="http://rcm-cn.amazon-adsystem.com/e/cm?t=onmygoing-23&o=28&p=285&l=ez&f=ifr&f=ifr" width="950" height="80"  scrolling="no"  border="0" frameborder="0" style="border:none;margin-left:140px;"></iframe>
</div>
 
 </div>
<div class="ty-wrap tb-tianmao">
<div class="tbti-subnav">
<div class="tsn-left">
<ul>
<!-- class="tbs-this" -->
<li><a href="<%=basePath%>/query/sp.do?count=40">全部</a></li>
  <c:forEach items="${spCatalogs}" var="spCatalog">
  <li ><a id="catalog-${spCatalog.id }" href="javascript:catalog(${spCatalog.id})">${spCatalog.name }</a></li>      
      
      </c:forEach>
</ul>
</div>
<div class="tsn-right">
<ul>
<li><a id="p-1" href="javascript:priceRange(1,9.9);" >1--9.99元</a></li>
<li><a id="p-10" href="javascript:priceRange(10,29.99);">10--29.99元</a></li>
<li><a id="p-30" href="javascript:priceRange(30,59.99);">30--59.99元</a></li>
<li><a id="p-60" href="javascript:priceRange(60,-1);">60元以上</a></li>
</ul>
</div>
</div>
<div class="searchArea" style="height:40px" >
<div>

		<ul class="line_ul">
			<li>商城选择:</li>
 <c:forEach items="${malls}" var="mall">
      
      <li><input id="mall_${mall.id}" type="checkbox" onclick="setMallId('${mall.id}')" ${fn:contains(spQueryInfo.mallId, mall.id)==true?"checked":""}/>${mall.name}</li>
      
      </c:forEach>


</ul></div>
<div style="float:right">
				<form id="search-form" 	 method="get" action="">
  <input type="text" id="keyWord" />
  <input type="button" value="Search" onclick="search()"/>
</form>
	</div>
	
</div>
<div class="ty-tmcontent">
<div class="tym-product">
<c:forEach items="${sps}" var="sp">
<div class="tymp-li">
<div class="ty-li-hot"></div>
<div class="ty-zk-yujia">原价：<em>${sp.oprice }</em>&nbsp;元&nbsp;&nbsp; 
折扣：${sp.discount}&nbsp;折</div>
<a target="_blank" href="${basePath}/common/redirectSp?spId=${sp.id}" rel="nofollow"><img src="${basePath}/ud/i/280-280?pl=${fn:substringAfter(sp.pictureUrl, '//')}"/></a>
<h3><a target="_blank" href="${sp.link}" rel="nofollow">${sp.spName}</a></h3>
<div class="tymp-info">
<span class="ty-in-drop"><i>￥</i><em>${sp.price }</em></span>
<span class="ty-in-like">${sp.orderedNumber}</span>
<%-- <span class="ty-in-link"><a target="_blank" href="${basePath}/common/redirectSp?spId=${sp.id}" rel="nofollow"></a></span>
 --%>
<span class="ty-in-like1">
<a href="http://share.v.t.qq.com/index.php?c=share&a=index&url=http://s-66387.gotocdn.com/&title=${sp.spName}&pic=http://s-66387.gotocdn.com/i/280-280/${fn:substringAfter(sp.pictureUrl, '//')}" target="_blank">分享</a></span>

         
   
 </div>
</div>
</c:forEach>
</div>
<div id="sp-pig" style="width:1176px;">
<div class="fy-left"></div>
<div class="fy-right">
<c:set var="pageCount" value="${spQueryInfo.pageCount }"></c:set>
<fmt:formatNumber var="cpn"
  value="${fn:substringBefore(((spQueryInfo.cpn) div 10), '.')}"
  maxFractionDigits="0" />
  <fmt:formatNumber var="cpn1"
  value="${fn:substringBefore(((spQueryInfo.cpn) div 10)+1, '.')}"
  maxFractionDigits="0" />
  <c:if test="${cpn1*10>10}">
  
 <a href="javascript:upPage(${(cpn-1)*10});" > << </a>
 </c:if>

<c:forEach begin="${cpn*10+1}" step="1" end="${cpn1*10>pageCount?pageCount:cpn1*10}" varStatus="c" >
<c:if test="${c.index!=0}">
  <a href="javascript:toPage(${c.index});" rel="next"   id='page-${c.index}' >${c.index}</a>


</c:if>


</c:forEach>
<c:if test="${cpn1*10 < spQueryInfo.pageCount  }">
 <a href="javascript:downPage(${(cpn+1)*10});" rel="next" > >> </a>


</c:if>
共${pageCount}页 
</div>
</div>
</div>
</div>

</div>

<div id="footer">


</div>

<div class="statistics" style="display: none;">
<div>
<p id="back-top">
		<a href="#top"><span></span>Back to Top</a>
	</p>
	</div>

</body>
</html>
