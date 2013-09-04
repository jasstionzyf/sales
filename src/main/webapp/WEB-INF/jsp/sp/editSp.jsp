<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include  file="../common/commons.jsp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>淘伴后台-产品列表</title>
<link rel="stylesheet" type="text/css"
	href="${basePath}/resources/css/bastyle.css" />
<script type="text/javascript"
	src="${basePath }/resources/js/jquery.min1.7.1.js"></script>
<script type="text/javascript"
	src="${basePath }/resources/swfupload/swfupload.js"></script>
<script type="text/javascript"
	src="${basePath }/resources/swfupload/handlers.js"></script>
<script type="text/javascript"
	src="${basePath}/resources/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath }/resources/ueditor_1.2.2.0/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath }/resources/ueditor_1.2.2.0/editor_all.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath }/resources/ueditor_1.2.2.0/themes/default/ueditor.css" />
<script type="text/javascript" src="${basePath }/resources/js/jquery.min1.7.1.js"></script>
<script type="text/javascript"
	src="${basePath}/resources/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript"
	src="${basePath}/resources/js/ajaxfileupload.js"></script>
	
<link rel="stylesheet" type="text/css" href="${basePath}/resources/css/bastyle.css"/>
 <script type="text/javascript">
	function ajaxFileUpload1()
	{

		$.ajaxFileUpload
		(
			{
				url:'${basePath}/ud/img/',
				secureuri:false,
				fileElementId:'fileToUpload',
				dataType: 'text',
				beforeSend:function()
				{
					//$("#loading").show();
				},
				complete:function()
				{
					//$("#loading").hide();
				},				
				success: function (data, status)
				{
					if(typeof(data.error) != 'undefined')
					{
						if(data.error != '')
						{
							alert(data.error);
						}else
						{
							alert(data.msg);
						}
					}
					//json SUCCESS
					var url1= eval('(' + data + ')');
					var url='${basePath}'+url1.SUCCESS;
					$("#pictureUrl").val(url);
					$("#spImg").attr("src",url);
					
				},
				error: function (data, status, e)
				{
					alert(e);
				}
			}
		)
		
		return false;

	}
	</script>


</head>

<body>
	<div class="bacontent">
		
		<div class="bac-right">
			<div class="bac-mbx">
			   修改sp信息
			</div>
			
			<div class="table-nr">
		
<form:form modelAttribute="sp" method="POST" action="${basePath}/admin/sp/updateSpInfo">  
				<form:label path="spName">商品标题:</form:label>
				<form:input path="spName" size="88"/>
				</br>
					</br>
				<form:label path="oprice">商品原价:</form:label>
				<form:input path="oprice" />
					</br>
						</br>
				<form:label path="price">商品现价:</form:label>
				<form:input path="price" />
					</br>
						</br>
				<form:label path="">来源:<a href="${sp.link}" >天猫</a></form:label>
					</br>
						</br>
								<form:label path="findTime">抓取时间:</form:label>
								<fmt:formatDate value="${sp.findDate}" type="both"/>
									</br>
										</br>
				
								<form:label path="">商品分类:${sp.catalogs }</form:label>
					</br>
						</br>
							<form:label path="priority">商品权重:</form:label>
				<form:input path="priority" />
										
					</br>
						</br>
								<form:label path="">商品图片</form:label>
								<form:input path="pictureUrl" size="200" id="pictureUrl"/>
								</br>
									</br>
								<img src="${sp.pictureUrl }" height="200" width="300" id="spImg"></img>
								
				
				<form:hidden path="id" />
				</br>
					</br>
				<!-- 上传新的图片 -->
			
								<form:hidden path="id" />
				
								<form:hidden path="findTime" />
				
								<form:hidden path="updateTime" />
								<form:hidden path="displayedTime" />
				
								<form:hidden path="catalogId" />
				
								<form:hidden path="orderedNumber" />
								<form:hidden path="shopName" />
							<form:hidden path="hidden" />
							<form:hidden path="discount" />
							<form:hidden path="link" />
							<form:hidden path="displayed" />
						<form:hidden path="reviewCount" />
						<form:hidden path="clickCount" />
												<form:hidden path="stockHave" />
								<form:hidden path="parentCategoryId" />
												
												
						
						
							
							</br>			
								</br>																											
						<input type="submit" value="更新"/>
							<!-- /image1/upload -->
							</br>	
								</br>	
							<form method="post" action="${basePath}/ud/img" enctype="multipart/form-data">
			请选择文件:<input  type="file"  name="Filedata"  id="fileToUpload">
			
				 <a   href="javascript:ajaxFileUpload1();">上传</a>
			
				</form>
						
				</form:form>
					
</div>
</div>
</div>
</body>
</html>
