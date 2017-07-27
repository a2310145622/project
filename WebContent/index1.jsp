<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎访问饶显华的主页</title>
</head>
<body>
<%=session.getAttribute("uname_in_session") %>
</body>
</html>