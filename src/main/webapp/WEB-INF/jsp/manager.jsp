
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include  file="./common/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>iframe Example</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>

	<style>
		body {
			margin: 0 0 0 0;
			background: white;
			height:1000px
		}
		#left {
			border: 0;

			background: white;
			margin: 0 0 0 0;
			padding: 0 0 0 0;
			width: 15%;
			height:100%;
			float: left

			/* No borders set */
		}
		#right {
			background: white;
			margin: 0 0 0 15%;
			padding: 0 0 0 0;
			height:100%;

			width: 85%

		}
		#leftIframe {
			border: 0;
			margin: 0 0 0 0;
			padding: 0 0 0 0;
			width: 100%;
						height:100%

		}
		#rightIframe {
			border: 0;
			margin: 0 0 0 0;
			padding: 0 0 0 0;
			width: 100%;
		    height:100%

		}
	</style>
	<body>
		<div id="left">
			<iframe  src="<%=basePath%>/common/menuList"
			name="leftIframe" id="leftIframe">
			</iframe>
		</div>
		<div id="right">
			<iframe  src="" name="rightIframe" id="rightIframe">
				
			</iframe>
		</div>

	</body>

</html>
