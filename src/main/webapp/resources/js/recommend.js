$(function() {
	var hostPatternsStr = {
			"www.360buy.com":"product\\/(\\d+)\\.html",
			"www.gome.com.cn":"product\\/(.+)\\.html",
			"www.coo8.com":"product\\/(\\d+)\\.html",
			"www.suning.com":"_(\\d+)_\\.html",
			"www.amazon.cn":"dp\\/(\\w+)",
			"product.dangdang.com":"product_id=(\\d+)",
			"item.51buy.com":"([0-9]+)\\.html",
			"www.newegg.com.cn":"Product\\/(.+)\\.htm",
			"www.360mart.com":"product\\/(.+)\\.html",
			"www.zol.com":"([0-9]+)\\.html",
			"www.dwgou.com":"product\\/([0-9]+)",
			"www.efeihu.com":"Product\\/(\\d+)\\.html",
			"item.360hqb.com":"product-([0-9]+)",
			"www.rayi.com":"product-([0-9]+)",
			"www.lusen.com":"product-([0-9]+)",
			"www.hqbuy.com":"-(.*)\\.html",
			"www.yihaodian.com":"item\\/([_\\d]+)",
			"mobile.139shop.com":"(\\d+)\\.htm",
			"www.51sheyuan.com":"p_(.+)\\.htm",
			"www.bearbuy.com.cn":"id=(\\d+)",
			"www.lafaso.com":"product\\/(\\d+)\\.html",
			"product.lafaso.com":"product\\/(\\d+)\\.html",
			"s.lafaso.com":"product\\/(\\d+)\\.html",
			"www.no5.com.cn":"goods\\/(\\d+)\\.html",
			"www.tiantian.com":"cosmetic\\/(\\w+)\\.html",
			"www.w1.cn":"goods-(\\d+)\\.html",
			"www.xzhuang.com":"product-(\\d+)\\.html",
			"shop.ufrun.com":"php\\?id=(\\d+)",
			"www.yintai.com":"itemcode=(.*)",
			"www.usashopcn.com":"Details\\/(\\d+)",
			"www.tnice.com":"product\\/(\\d+)\\.html",
			"www.likeface.com":"product\\-(\\d+)\\.shtml",
			"www.xifuquan.com":"product\\/(\\d+)\\.html",
			"www.meiribuy.com":"goods\\-(\\d+)\\.html",
			"www.beautyplus.cn":"id=(\\d+)",
			"www.happigo.com":"(\\d+)\\.html",
			"www.sephora.cn":"productDetailAction\\/(\\d+)\\.html",
			"www.dazhe.cn":"goodsdetaila-(\\d+)",
			"www.pba.cn":"product-([0-9]+)",
			"www.naruko.com.cn":"g=([A-Z0-9\\-]+)&",
			"www.binggo.com":"(\\d+)\\.html",
			"www.365pp.com":"sku=(\\d+)",
			"www.d1.com.cn":"product\\/(\\d+)",
			"www.oulele.com":"id=(\\d+)",
			"www.xiangshe.com":"product(.*)\\.html",
			"www.boheshop.com":"goods.php\\?id=(\\d+)",
			"www.ugou.cn":"products\\/(\\d+)",
			"product.ejia.com":"\\/(\\d+)\\.shtml",
			"www.chinadrtv.com":"\\/(\\d+)\\.shtml",
			"www.yinzuo100.com":"goods.php\\?id=(\\d+)",
			"www.okbuy.com":"detail\\/(\\d+)\\.html",
			"mall.jumei.com":"deal\\/(.+)\\.html",
			"www.k-touch.cn":"prod_id=\\d+",
			"auction1.paipai.com":"\\/(\\w+)-.*",
			"list.m18.com":"p-(.*)\\.htm",
			"www.homevv.com":"pid-([0-9]+)\\.jhtml",
			"www.51youpin.com":"goods-(\\d+)\\.html",
			"www.tao3c.com":"pid-([0-9]+)\\.jhtml"
	};
	var hostPatterns = {} ,tagList=[], haveMobile = false;
	//根据链接自动判断商城
	$("#prodUrl").blur(function() {
		var _url = this.value.trim();
		if(_url.length>0) {//填写了链接
			$.ajax({
				url: ctx+"/recommend/getMallByUrl",
				data: {url: _url},
				type: "post",
				dataType: "json",
				success: function(data, status){
					if(data.success == -1) {
						alert(data.res);
					} else if(data.success == 1) {
						var mall = data.mall, mallitemId="";
						if(mall) {
							$("#mallname").val(mall.nick).css("background","#FFF");
							$("#mallId").val(mall.id);
							commissionCode = mall.commissionCode;
							var finalUrl = makeUpUrl(_url);
							if(finalUrl!="") {
								$("#finalUrl1").text(finalUrl);
								$("#finalUrl1").css("cursor","pointer").click(function() {
									var range = document.createRange() || document.body.createTextRange();
									var selection = window.getSelection() || document.selection;
									range.selectNodeContents(this.childNodes[0]);
									selection.removeAllRanges();
									selection.addRange(range);
									copy_clip(finalUrl);
								});
							}
							if($("#taobanUrl").val()=="") {
								mallitemId = getTaobanUrl(mall.id, _url);
							}
							if(mall.mobileItemUrl!="") {
								$("span#mallItemId-notice").text("");
								if($("#mallItemId").val()==""){
									$("#mallItemId").val(mallitemId);
								}
								haveMobile = true;
							}else{
								$("span#mallItemId-notice").text("此商城没有手机版");
							}
						} else {
							$("#mallname").val("没有匹配的商城").css("background","#F00");
							$("#mallId").val("");
						}
					}
				}
			});
		} else {//没有填写链接
			$("#mallname").val("");
			$("#mallId").val("");
			$("#finalUrl1").text("");
		}
		
	});
	//获取淘伴链接
	function getTaobanUrl(mallid,itemhref) {
		var urlhost=getHostFromUrl(itemhref);
		getHostPatterns();
		var hostpattern=hostPatterns[urlhost];
		if(hostpattern) {
			var itemidres=hostpattern.exec(itemhref);
			if (itemidres){
				var itemid=itemidres[1];
				$.ajax({
					url: "http://www.taoban.com/extention/taobandata.json?mallId="+mallid+"&mallItemId="+itemid+"&manager=1",
					type: "get",
					dataType: "jsonp",
					success: function(data, status){
					}
				});
				return itemid;
			}
		}
	}
	function getHostFromUrl(loclhref){
		var hostpattern=new RegExp("http://([^/]+)/","i");
		var results=hostpattern.exec(loclhref);
		if (results){
			return results[1];
		}else{
			return host;
		}
	}
	function getHostPatterns() {
		for (var key in hostPatternsStr){
			if (hostPatternsStr.hasOwnProperty(key)){
				hostPatterns[key]=new RegExp(hostPatternsStr[key]);
			}
		}
	}
	//分类radio的样式
	function radioCheck() {
		var all = $("input[type='radio']");
		for(var i=0; i<all.length; i++) {
			var r = all[i];
			if(r.checked) {
				$("label[for='"+r.id+"']").addClass("tj-lei-this");
			} else {
				$("label[for='"+r.id+"']").removeClass("tj-lei-this");
			}
		}
	}
	radioCheck();
	$("input[type='radio']").change(function() {
		radioCheck();
	});
	$("label[for^='catType']").click(function() {
		var label = $(this),
			radio = $("input#"+label.attr("for"));
		if(radio.attr("checked")) {//已选择的再点取消选择
			radio.attr("checked", false);
			label.removeAttr("class");
			changeWeiboTopic();
			return false;
		}
	});
	//表单验证
	function validate() {
		if($("#prodTitle").val().trim()=="") {
			$("#prodTitle").css("background","#F00");
			return false;
		}
//		if($("#prodUrl").val().trim()=="") {
//			$("#prodUrl").css("background","#F00");
//			return false;
//		}
		if($("#mallId").val().trim()=="") {
//			$("#mallname").css("background","#F00");
//			return false;
			$("#mallId").val(0);
		}
		if($("input[name='articleType']:checked").length==0) {
			$("label[for^='articleType']").addClass("tj-lei-this");
			return false;
		}
//		if($("input[name='catType']:checked").length==0) {
//			$("label[for^='catType']").addClass("tj-lei-this");
//			return false;
//		}
		if($("select[name='userId']").val()=="") {
			$("select[name='userId']").css("background","#f00");
			return false;
		}
//		if($("#toSina").attr("checked") || $("#toTqq").attr("checked")) {
//			if($("#weiboedit").css("display")=="none") {
//				alert("还没有编辑微博");
//				return false;
//			}
//		}
		return true;
	}
	$("#prodTitle").focus(function() {
		this.style.background = "#FFF";
	});
	$("#prodUrl").focus(function() {
		this.style.background = "#FFF";
	});
	//选择用户
	$("select#userId").change(function() {
		var o = $(this).children("option:selected");
		$("#nickname").text(o.text());
		$("input[name='userId'][type='hidden']").val(this.value);
		if(this.value!="") {
			this.style.background = "#fff";
		}
	});
	//保存、预览、发布按钮
	$("#btn1").click(function() {//新建页的保存
		if($("#mallId").val()=="") {
//			alert("未选择商城");
//			return;
			$("#mallId").val("0");
		}
		if($("input[name='userId'][type='hidden']").val()==0) {
			alert("未选择用户");
			return;
		}
		var str = tagList.join(",");
		$("input[name='tag'][type='hidden']").val(str);
		$("#status").val(0);
		editor_a.sync();
		$("#form1").submit();
	});
	$("#caogao").click(function() {//未发布的保存
		var str = tagList.join(",");
		$("input[name='tag'][type='hidden']").val(str);
		$("#status").val(0);
		editor_a.sync();
		$("#form1").submit();
	});
	$("#save").click(function() {//已发布的保存
		if(validate()) {
			$("#status").val(1);
			var str = tagList.join(",");
			$("input[name='tag'][type='hidden']").val(str);
			editor_a.sync();
			$("#form1").submit();
		}
	});
	$("#fabu").click(function() {//发布
		if(confirm("确定要发布吗？")) {
			if(validate()) {
				$("#status").val(1);
				var str = tagList.join(",");
				$("input[name='tag'][type='hidden']").val(str);
				editor_a.sync();
				$("#form1").submit();
			}
		}
	});
	//根据商城生成链接
	$("#commissionMallid").change(function() {
		var id = this.value;
		if(id!="") {
			$.ajax({
				url: ctx+"/recommend/getCommissionCode",
				data: {mallId: id},
				type: "post",
				dataType: "json",
				success: function(data, status){
					if(data.success == -1) {
						alert(data.res);
					} else if(data.success == 1) {
						commissionCode = data.code;
					}
				}
			});
		}
	});
	$("#generateUrl").click(function() {
		var mallid = $("#commissionMallid").val();
		var originalUrl = $("#originalUrl").val();
		var finalUrl = "";
		if(mallid.length>0 && originalUrl.length>0) {
			finalUrl = makeUpUrl(originalUrl);
		}
		if(finalUrl!="") {
			var rs = $("#finalUrl");
			rs.text(finalUrl);
			rs.css("cursor","pointer").css("margin","5px");
			rs.hover(
				function(){
					this.style.background = "#fff";
				},
				function(){
					this.style.background = "#f1f1f1";
				}).click(function(){
					var range = document.createRange() || document.body.createTextRange();
					var selection = window.getSelection() || document.selection;
					range.selectNodeContents(this.childNodes[0]);
					selection.removeAllRanges();
					selection.addRange(range);
					copy_clip(finalUrl);
				}
			);
		}
	});
	//生成带有联盟代码的url
	function makeUpUrl(originalUrl){
		var code = commissionCode,finalUrl="";
		if(originalUrl!=null && originalUrl != "") {
			if(code!=undefined && code!=""){
				if(code.indexOf("http://")==0){
					finalUrl = code + originalUrl;
				} else {
					if(originalUrl.indexOf("?")>-1) {
						code = code.replace("?", "&");
					}
					finalUrl = originalUrl + code;
				}
			} else {
				finalUrl = originalUrl;
			}
		}
		return finalUrl;
	}
	//添加tag
	$("#tag").focus(function() {
		$(this).bind("keypress", function(e) {
			if(e.keyCode==13) {
				addtags(this.value);
			}
		});
	});
	$("#tag").blur(function() {
		$(this).unbind("keypress");
	});
	$("#tagadd").click(function() {
		addtags($("#tag").val());
	});
	function addtags(str) {
		str = str.trim();
		if(str.length>0) {
			str = str.replace(/，/g, ",");
			var tags = str.split(","), div = $("#currtags");
			var count = div.children("span.currtag").length + tags.length;
			if(count>5) {
				$("#errmsg").text("标签不能超过5个");
			} else {
				for(var i in tags) {
					var tag = tags[i];
					var span = document.createElement("span");
					span.className = "currtag";
					span.textContent = tag;
					var a = document.createElement("a");
					a.href = "#";
					a.textContent = "X";
					span.appendChild(a);
					div[0].appendChild(span);
					a.onclick = function() {
						$(this).parent("span").remove();
						$("#errmsg").text("");
						removeTag($(this).parent("span").text());
						return false;
					};
					tagList.push(tag);
				}
				$("#tag").val("");
			}
		}
	}
	addtags(tagstr);
	//删除tag
	$("span.currtag").children("a").click(function() {
		$(this).parent("span").remove();
		$("#errmsg").text("");
		removeTag($(this).parent("span").text());
		return false;
	});
	function removeTag(name) {
		var index = 0;
		name = name.substring(0, name.length-1);
		for(var i=0,len=tagList.length; i<len; i++) {
			if(tagList[i]==name) {
				index = i;break;
			}
		}
		tagList = tagList.slice(0,index).concat(tagList.slice(index+1,tagList.length));
	}
	$("#moretags").children("a").toggle(
		function() {
			$.ajax({
				url: ctx+"/TagController/commonlyTags",
				type: "get",
				dataType: "json",
				success: function(data, status){
					if(data.success == -1) {
						alert("出现异常："+data.err);
					} else if(data.success == 1) {
						var tags = data.tagList;
						if(tags) {
							$("#commonlyTags").html("");
							var ul = document.createElement("ul");
							ul.style.listStyle = "none";
							for(var i in tags) {
								var tag = tags[i];
								var li = document.createElement("li");
								li.style.cssFloat = "left";
								li.style.lineHeight = "20px";
								li.style.padding = "0 2px";
								var a = document.createElement("a");
								a.href = "#";
								a.textContent = tag.tag;
								li.appendChild(a);
								ul.appendChild(li);
								a.onclick = function() {
									addtags(this.textContent);return false;
								};
							}
							document.getElementById("commonlyTags").appendChild(ul);
							$("#commonlyTags").show();
						}
					}
				}
			});
			return false;
		},
		function() {
			$("#commonlyTags").hide();
			return false;
		}
	);
	//展开收起微博编辑框，以及微博编辑框相关
	$("#weiboedita").toggle(
		function() {
			setWeiboPic();
			changeWeiboTopic();
			$("#weiboedit").show();
			this.textContent = "收起";
			return false;
		},
		function() {
			$("#weiboedit").hide();
			this.textContent = "编辑微博";
			return false;
		}
	);
	function setWeiboPic() {
		var text = editor_a.getContent();
		var rs = /<img([^>]*)src="([^"]+)/.exec(text);
		if(rs!=null) {
			$("#weiboPic").val(rs[2]);
		}
	}
	$("textarea#weiboContent").focus(function() {
		$("span#weibo-note-1").css("color","#F00");
	});
	$("input#weiboPic").focus(function() {
		$("span#weibo-note-2").css("color","#F00");
	});
	$("textarea#weiboContent").blur(function() {
		$("span#weibo-note-1").css("color","#999");
	});
	$("input#weiboPic").blur(function() {
		$("span#weibo-note-2").css("color","#999");
	});
	function getCatName() {
		var cats = $("input[name='catType']");
		var name = "淘友比价推荐";
		for(var i in cats) {
			if(cats[i].checked) {
				var label = $("label[for='"+cats[i].id+"']");
				name = label.text();break;
			}
		}
		return name;
	}
	function changeWeiboTopic() {
		var catName = getCatName(),
			text = $("#weiboContent").text();
		text = text.replace(/#\S+#/, "#淘友推荐"+catName+"#");
		$("#weiboContent").text(text);
	}
	//自动保存
	setInterval(function() {
		autosave();
	}, 60*1000);
	function autosave() {
		var temp = {};
		temp.title = $("input#prodTitle").val();
		temp.subtitle = $("input#subtitle").val();
		temp.picUrl = $("input[name='picUrl']").val();
		temp.symbol = $("select[name='symbol']").val();
		temp.prodPrice = $("input#prodPrice").val();
		temp.prodUrl = $("input#prodUrl").val();
		temp.mallId = $("input#mallId").val();
		temp.mallName = $("#mallname").val();
		temp.articleType = $("input[name='articleType']:checked").val()||0;
		temp.catType = $("input[name='catType']:checked").val()||0;
		temp.tags = tagList.join(",");
		temp.content = editor_a.getContent();
		temp.userId = $("input[name='userId'][type='hidden']").val();
		temp.draftId = $("input[name='draftId'][type='hidden']").val();
		temp.nickname = $("span#nickname").text(); 
		temp.top = $("input[name='top']:checked").val();
		temp.isMarrow = $("input[name='isMarrow']:checked").val();
		temp.mallItemId = $("input#mallItemId").val();
		temp.haveMobile = haveMobile;
		temp.taobanUrl = $("input#taobanUrl").val();
		temp.publishAfter = $("input#publishAfter").val();
		temp.endtime = $("input#endtime").val();
		if($("input[name='hidden']").length>0) {
			temp.hidden = $("input[name='hidden']:checked").val();
		}
		if($("#weiboContent").length>0) {
			temp.weiboContent = $("#weiboContent").val();
		}
		if($("#weiboPic").length>0) {
			temp.weiboPic = $("#weiboPic").val();
		}
		if($("#isPush").length>0) {
			temp.isPush = $("#isPush:checked").val() || 0;
		}
		if($("#toSina").length>0) {
			temp.toSina = $("#toSina:checked").val() || 0;
		}
		if($("#toTqq").length>0) {
			temp.toTqq = $("#toTqq:checked").val() || 0;
		}
		var infoId = $("input[name='id']").val() || 0;
		$.ajax({
			url: ctx+"/recommend/autosave",
			data: {
				infoId: infoId,
				content: JSON.stringify(temp)
			},
			type: "post",
			dataType: "json",
			success: function(data, status){
				if(data.success == -1) {
					alertBox(false, "自动保存失败");
					console.log(data.err);
				} else if(data.success == 1) {
					alertBox(true, "自动保存成功");
					$("span#cg").text("（已保存草稿）");
				}
			}
		});
	}
	function alertBox(f, str) {
		var alertDiv = $("#notice");
		if(f) {
			alertDiv.css("background","#0F0");
		} else {
			alertDiv.css("background","#F00");
		}
		alertDiv.text(str);
		alertDiv.animate({
			top: "0px"
		});
		setTimeout(function() {
			alertDiv.animate({
				top: "-30px"
			});
		}, 5000);
	}
	//恢复草稿的内容
	function restoreCaogao() {
		if(caogaoStr.length>0) {
			var caogao = JSON.parse(caogaoStr);
			console.log(caogao);
			$("#prodTitle").val(caogao.title);
			$("#subtitle").val(caogao.subtitle);
			$("input[name='picUrl']").val(caogao.picUrl);
			if(caogao.picUrl.length>0) {
				$("img#pic").attr("src","http://img.taoban.com/"+caogao.picUrl);
			}
			$("select[name='symbol']").val(caogao.symbol);
			$("#prodPrice").val(caogao.prodPrice);
			$("#prodUrl").val(caogao.prodUrl);
			$("#mallId").val(caogao.mallId);
			$("#mallname").val(caogao.mallName);
			$("input[name='articleType'][value="+caogao.articleType+"]").attr("checked",true);
			$("input[name='catType'][value="+caogao.catType+"]").attr("checked",true);
			radioCheck();
			$("span.currtag").children("a").click();
			addtags(caogao.tags);
			$("#content").val(caogao.content);
			$("span#cg").text("（草稿）");
			$("input[name='userId']").val(caogao.userId);
			$("select#userId").val(caogao.userId);
			$("span#nickname").text(caogao.nickname);
			$("input[name='top'][value='"+caogao.top+"']").attr("checked",true);
			$("input[name='isMarrow'][value='"+caogao.isMarrow+"']").attr("checked",true);
			$("input#mallItemId").val(caogao.mallItemId);
			haveMobile = caogao.haveMobile;
			if(haveMobile) {
				$("#mallItemId-notice").text("");
			}
			$("input#taobanUrl").val(caogao.taobanUrl);
			$("input#publishAfter").val(caogao.publishAfter);
			$("input#endtime").val(caogao.endtime);
			if(caogao.hidden!=undefined) {
				$("input[name='hidden'][value='"+caogao.hidden+"']").attr("checked",true);
			}
			if(caogao.isPush) {
				$("#isPush").attr("checked",true);
			} else {
				$("#isPush").attr("checked",false);
			}
			if(caogao.toSina) {
				$("#toSina").attr("checked",true);
			} else {
				$("#toSina").attr("checked",false);
			}
			if(caogao.toTqq) {
				$("#toTqq").attr("checked",true);
			} else {
				$("#toTqq").attr("checked",false);
			}
			if(caogao.weiboContent) {
				$("#weiboContent").val(caogao.weiboContent);
			}
			if(caogao.weiboPic) {
				$("#weiboPic").val(caogao.weiboPic);
			}
		}
		
		
	}
	restoreCaogao();
	$("#expressionSelect").change(function() {
		selectCommonExp(this);
	});
	//选择常用语句
	function selectCommonExp(option) {
		var val = option.value;
		if(val.length>0) {
			var textarea = document.getElementById("expression");
			$(textarea).val(option.value);
			textarea.select();
			copy_clip(option.value);
		}
	}
	//复制到剪切板
	function copy_clip(copy) {
		if (window.clipboardData) {
			window.clipboardData.setData("Text", copy);
		} else if (window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
			} catch (e) {
				alert("被浏览器拒绝!\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
			}
			var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
			//if (!clip) return;
			var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
			//if (!trans) return;
			trans.addDataFlavor('text/utf-8');
			var str = new Object();
			var len = new Object();
			var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
			var copytext=copy;
			str.data=copytext;
			trans.setTransferData("text/unicode",str,copytext.length*2);
			var clipid=Components.interfaces.nsIClipboard;
			//if (!clip) return false;
			clip.setData(trans,null,clipid.kGlobalClipboard);
		}
			//return false;
	}
	
	
	if($("#weiboedit").length>0) {
		$("input[name='catType'][type='radio']").change(function() {
			changeWeiboTopic();
		});
		setTimeout(function() {
			changeWeiboTopic();
			setWeiboPic();
		}, 1000);
	}
	
});
