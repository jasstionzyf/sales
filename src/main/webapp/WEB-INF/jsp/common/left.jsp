<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<script type="text/javascript">
<!--
setInterval(function(){
	count();
}, 60000);
function count(){
	$.ajax({
		url:"${basePath}/usercenter/informantdrfat/count/",
		data : {},
		type : "get",
		dataType:"json",
		success : function(data){
			var count = data.count;
			if(count > 0){
				$("#tuijian_count").text("["+count+"]");
			}
		}
	});
}
count();
//-->
</script>
<div class="bac-left">
	<div class="bcnav">淘伴管理后台</div>
    	<ul>
    		<shiro:hasAnyRoles name="admin,manager,editor">  
    		<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 淘友管理</li>
    	    </shiro:hasAnyRoles>
    	    <shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath }/recommend/insert" ${param.hover == "0-5" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 添加文章</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath}/recommend/index" ${param.hover == "0-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 文章列表</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath}/usercenter/informantdrfat/list/" ${param.hover == "0-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 网友爆料      <font color="red" id="tuijian_count"></font></a></li>
    		</shiro:hasAnyRoles> 	   
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath}/usercenter/user/list/" ${param.hover == "0-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 用户列表</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath }/usercenter/infocomment/list/" ${param.hover == "0-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 评论列表</a></li> 
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath }/commentaward/list/pn-1/" ${param.hover == "0-10" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 评论奖励</a></li> 
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath }/commonExpression/list" ${param.hover == "0-8" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 常用短语</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager">
    		<li><a href="${basePath }/informantArticleCat/list" ${param.hover == "0-6" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 文章分类</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
    		<li><a href="${basePath }/informantItemCat/list" ${param.hover == "0-7" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 推荐商品分类</a></li>
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
			<li><a href="${basePath }/informantnotice/list" ${param.hover == "0-9" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 添加公告</a></li>	
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,editor">
			<li><a href="${basePath }/tag/list" ${param.hover == "0-11" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 标签列表</a></li>	
    		</shiro:hasAnyRoles>
    		<shiro:hasAnyRoles name="admin,manager,operater">  
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 分类管理</li>
			<li><a href="${basePath }/category/" ${param.hover == "1-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 分类列表</a></li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 品牌管理</li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,operater">
			<li><a href="${basePath }/brandlib/list/" ${param.hover == "a-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 品牌库</a></li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,operater">
			<li><a href="${basePath }/brandmodel/"${param.hover == "a-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 分类品牌</a></li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,editor,student,operater">  
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 产品管理</li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,editor,student,operater"> 
			<li><a href="${basePath }/product" ${param.hover == "2-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 产品列表</a></li>
			</shiro:hasAnyRoles>
			<shiro:hasAnyRoles name="admin,manager,editor,student,operater"> 
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 商品管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager,editor,student,operater">
				<a href="${basePath }/mallitem/" ${param.hover == "3-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 商品列表</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager">
				<a href="${basePath }/catspider/spiderconfig" ${param.hover == "3-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 抓取配置</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,editor,operater">
				<a href="${basePath }/depreciate/query/" ${param.hover == "3-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 降价商品</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/spider/main/" ${param.hover == "3-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 手工更新</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
					<a href="${basePath }/itempricevaryrecord/" ${param.hover == "3-5" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 价格校验</a>
				</shiro:hasAnyRoles>
			</li>
			<!-- <li><a href="shangpin.html"><img src="${basePath}/resources/images/backsn_23.jpg" /> 商品列表</a></li>  -->
	
			<shiro:hasAnyRoles name="admin,manager,editor">  
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 商城管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager,editor,operater">
				<a href="${basePath }/mall/" ${param.hover == "4-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 商城列表</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath}/mallservice" ${param.hover == "4-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 商城服务</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/mallpay" ${param.hover =="4-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 支付方式</a>
				</shiro:hasAnyRoles>
			</li>
			
			<shiro:hasAnyRoles name="admin,manager,operater">  
			<li><img src="${basePath}/resources/images/backsn_17.jpg" />榜单管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/category_rank/query" ${param.hover == "10-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />榜单添加</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath}/category_rank/list" ${param.hover == "10-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />榜单管理</a>
				</shiro:hasAnyRoles>
				
			</li>
			
			
			<shiro:hasAnyRoles name="admin,manager,operater,editor">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 首页管理</li>
			</shiro:hasAnyRoles>	
			<li>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/focus/"  ${param.hover =="5-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 焦点图</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/limitbuy/material"  ${param.hover =="5-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 限时待选</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/limitbuy/queue"  ${param.hover =="5-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 限时管理</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/flashsale/adv"  ${param.hover =="5-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 限时广告</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater,editor">
				<a href="${basePath }/home/recommended/"  ${param.hover =="5-5" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 淘友推荐</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/hotsale/"  ${param.hover =="5-6" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 热销排行</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/hostsale/adv"  ${param.hover =="5-7" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 热销广告</a> 	
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">		
				<a href="${basePath }/pricedown/adv"  ${param.hover =="5-8" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 降价广告</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/notice"  ${param.hover =="5-9" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 公告管理</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/friendlinks/"  ${param.hover =="5-10" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 友情链接</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/page/links"  ${param.hover =="5-11" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 碎片生成</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/hotwords/list-0/"  ${param.hover =="5-12" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 热搜词</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/recommend_mall/index/"  ${param.hover =="5-13" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />推荐商城</a>		
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="admin,manager,operater">
				<a href="${basePath }/hotkeywords/index/"  ${param.hover =="5-14" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />热门搜索</a>	
				</shiro:hasAnyRoles>					
			</li>
		
			
			<shiro:hasAnyRoles name="admin,manager,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 手机首页管理</li>	
			<li>
				<a href="${basePath }/mfocus/"  ${param.hover =="6-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 焦点图</a>
				<a href="${basePath }/home/mark-7/"  ${param.hover =="6-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 淘伴推荐</a>
				<a href="${basePath }/hotwords/list-1/"  ${param.hover =="6-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 热搜词</a>
			</li>
			</shiro:hasAnyRoles>
			
			<!--<shiro:hasAnyRoles name="admin,manager,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 精品推荐</li>	
			<li>
				<a href="${basePath }/reduction"  ${param.hover =="8-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 精品推荐</a>
				<a href="${basePath }/hotwords/list-2"  ${param.hover =="8-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 热搜词</a>
				<a href="${basePath }/home/mark-8/"  ${param.hover =="8-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 发现广告</a>
	
			</li>
			</shiro:hasAnyRoles>-->
			
			<shiro:hasAnyRoles name="admin,manager,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" />搜索管理</li>	
			<li>
				<a href="${basePath }/keywords/list"  ${param.hover =="7-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 关键词管理</a>
				<a href="${basePath }/search_log/"  ${param.hover =="7-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 搜索日志查询</a>
			</li>
			</shiro:hasAnyRoles>

			<shiro:hasAnyRoles name="admin,manager,operater,student">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" />数据匹配</li>	
			<li>
				<a href="${basePath }/keywordMatcher.html?catalogId="  ${param.hover =="8-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 商品匹配</a>
				<a href="${basePath }/keywordMatcher/keywordMatcherConflict.html?catalogId=1"  ${param.hover =="8-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 清除缓存</a>
				<a href="${basePath }/keywordMatcher/keywordMatcherConflictEditor.html?catalogId=1"  ${param.hover =="8-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 处理冲突</a>
				<a href="http://manager.taoban.com:90/taoban-realtimesearch/showBBS55MatchedReault.jsp"  ${param.hover =="8-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 55BBS匹配</a>
				<a href="${basePath }/http://manager.taoban.com:90/taoban-realtimesearch/showMatchResult.jsp"  ${param.hover =="8-5" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> PCHOME匹配</a>
			</li>
			</shiro:hasAnyRoles>
			
			<shiro:hasAnyRoles name="admin,manager,editor,service,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 兑换管理</li>
			<li>
				<a href="${basePath}/exchange/coupon" ${param.hover =="11-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 优惠券</a>
				<a href="${basePath}/exchange/goods" ${param.hover =="11-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 实物奖品</a>
				<a href="${basePath}/consume/index" ${param.hover =="11-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 兑换商城首页管理</a>
				<a href="${basePath }/vouchercat/list" ${param.hover =="11-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 优惠券分类</a>
				
			</li>
			</shiro:hasAnyRoles>
			
			<shiro:hasAnyRoles name="admin,manager,editor,student,service,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 帐户管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager,editor,student,operater,service">
				<a href="${basePath }/user/editpassword"  ${param.hover =="9-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 修改密码</a>
				</shiro:hasAnyRoles>
				<shiro:hasRole name="admin">
				<a href="${basePath }/user/list"  ${param.hover =="9-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 账户列表</a>
				<a href="${basePath }/user/insert"  ${param.hover =="9-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 新建帐户</a>
				<a href="${basePath }/managerOAuth/showInfo/1"  ${param.hover =="9-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />系统账号授权信息</a>
				</shiro:hasRole>
			</li>
			
			<shiro:hasAnyRoles name="admin,manager">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" /> 反馈管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager">
				<a href="${basePath }/feedback/list"  ${param.hover =="12-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 用户反馈</a>
				</shiro:hasAnyRoles>
				
			</li>
			<shiro:hasAnyRoles name="admin,manager,editor,student,service,operater">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" />sp商品管理</li>
			</shiro:hasAnyRoles>			
			<li>
				<shiro:hasAnyRoles name="admin,manager,editor,student,operater,service">
			
				<a href="${basePath }/spAdmin/list"  ${hover =="111-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />sp商品列表</a>
				<a href="${basePath}/spAdmin/forwardAddSpCatalog"  ${hover =="111-2" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" /> 新增分类</a>
				<a href="${basePath }/spAdmin/forwardAddExternalLink"  ${hover =="111-3" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />添加分类链接</a>
				<a href="${basePath }/spAdmin/forwardAddSpCatalogMapping"  ${hover =="111-4" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />添加分类映射</a>
				<a href="${basePath }/spAdmin/listCompetitiveSp"  ${hover =="111-100" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />9.9专区</a>
				
				</shiro:hasAnyRoles>
			
			</li>
			<shiro:hasAnyRoles name="admin,manager">
			<li><img src="${basePath}/resources/images/backsn_17.jpg" />金币管理</li>
			</shiro:hasAnyRoles>
			<li>
				<shiro:hasAnyRoles name="admin,manager">
			
				<a href="${basePath }/coinhistory/list?page=1"  ${param.hover =="112-1" ? "class='clickst'" : "" }><img src="${basePath}/resources/images/backsn_23.jpg" />金币发放记录</a>
				</shiro:hasAnyRoles>
			
			</li>	
			
		</ul>
	</div>