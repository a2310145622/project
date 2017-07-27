<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String uname = null;
	String pwd = null;
	if (session.getAttribute("uname_in_session") == null) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				String name = cookies[i].getName();
				String pw = cookies[i].getName();
				if ("uname".equals(name)) {
					//如果是中文，cookies需要解码
					uname = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				} else if ("pwd".equals(pw)) {
					pwd = cookies[i].getValue();
				}
			}
		}
		//当用户名和密码不为空时，自动登录
		if ((uname != null && !("".equals(uname))) && (pwd != null && !("".equals(pwd)))) {
			session.setAttribute("uname_in_session", uname);
			session.setAttribute("pwd_in_session", pwd);
			response.sendRedirect("login");//get请求
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./image/favicon.ico">

<title>Fixed Top Navbar Example for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/navbar-fixed-top.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Project name</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("uname_in_session") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("uname_in_session")%><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">设置</a></li>
						<li><a href="deletecookie">退出</a></li>
					</ul></li>
<%-- 				<li><a><%=session.getAttribute("uname_in_session")%></a></li> --%>
<!-- 				<li class="active"><a href="deletecookie">退出 <span -->
<!-- 						class="sr-only">(current)</span></a></li> -->
				<%
					}else{
				%>
				<li><a href="login.jsp">登录</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Navbar example</h1>
			<p>This example is a quick exercise to illustrate how the
				default, static and fixed to top navbar work. It includes the
				responsive CSS and HTML, so it also adapts to your viewport and
				device.</p>
			<p>To see the difference between static and fixed top navbars,
				just scroll.</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="http://v3.bootcss.com/components/#navbar" role="button">View
					navbar docs &raquo;</a>
			</p>
		</div>

	</div>
	<!-- /container -->
	<div class="container">
		<div class="jumbotron">
			<p>To see the difference between static and fixed top navbars,
				just scroll.</p>
			<table class="table table-hover">
				<tr>
					<td class="active">...</td>
					<td class="success">...</td>
					<td class="warning">...</td>
					<td class="danger">...</td>
					<td class="info">...</td>
				</tr>
				<tr>
					<td class="active">...</td>
					<td class="success">...</td>
					<td class="warning">...</td>
					<td class="danger">...</td>
					<td class="info">...</td>
				</tr>
				<tr>
					<td class="active">...</td>
					<td class="success">...</td>
					<td class="warning">...</td>
					<td class="danger">...</td>
					<td class="info">...</td>
				</tr>
			</table>
		</div>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="./js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>