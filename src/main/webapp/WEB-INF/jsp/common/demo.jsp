<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘伴后台-商品列表</title>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/css/bastyle.css"/>
</head>

<body>
<%@include file="head.jsp" %>
<div class="bacontent">
	<%@include file="left.jsp" %>
	<div class="bac-right">
		<div class="bac-mbx"><a href="list1.html">分类管理</a> &gt; 分类列表</div>
	  <div class="bax-tab">

		<div class="bat-zmxx list-ycnr">
			  <form action="" method="get">时间：<input name="" type="text" value="2012-02-15" size="8" /><a href="#"><img src="${basePath}/resources/images/backsn_26.jpg" /></a> 到 <input name="" type="text" value="2012-02-15" size="8" />
			  <a href="#"><img src="${basePath}/resources/images/backsn_26.jpg" /></a>
              <span class="youdq"> 
              状态：
                <select name="">
                <option value="全部">全部</option>
				  <option value="正常">正常</option>
				  <option value="隐藏">隐藏</option>
				</select>

                搜索：<input name="" type="text" size="30" />
                <button name="搜索" type="button" value="搜索" />
                <span class="search-wz">查询</span></button>
                </span>
			  </form>
			</div>
            <div class="bta-zmyou list-dandu"><a href="fenlei_jia.html"><img src="${basePath}/resources/images/backsn_14.jpg" /> 添加分类</a></div>
	  </div>
		<div class="table-nr">
			<table class="kuandu-tb" width="200" border="0" cellpadding="0" cellspacing="0">
				<tr class="no1hang">
					<td>序号</td>
					<td>分类名称</td>
					<td>下级分类数</td>
					<td>状态</td>
					<td>创建/更改时间</td>
					<td>操作</td>
				</tr>
				<tr>
					<td><font>1</font></td>
					<td class="kuan-ts-fl"><a href="list2.html">手机数码</a></td>
					<td>20</td>
					<td>正常</td>
					<td><font>2012-01-24 10:32</font></td>
					<td><a href="fenlei_gai.html">编辑</a><a href="shuxing_chakan.html" class="astylets">查看属性</a></td>
				</tr>
                <tr>
					<td><font>2</font></td>
					<td class="kuan-ts-fl"><a href="list2.html">电脑办公</a></td>
					<td>5</td>
					<td>正常</td>
					<td><font>2012-01-24 10:32</font></td>
					<td><a href="fenlei_gai.html">编辑</a><a href="shuxing_chakan.html" class="astylets">查看属性</a></td>
				</tr>
                <tr>
					<td><font>3</font></td>
					<td class="kuan-ts-fl"><a href="list2.html">家用电器</a></td>
					<td>12</td>
					<td>正常</td>
					<td><font>2012-01-24 10:32</font></td>
					<td><a href="fenlei_gai.html">编辑</a><a href="shuxing_chakan.html" class="astylets">查看属性</a></td>
				</tr>
			</table>

	  </div>
	</div>
</div>
</body>
</html>
