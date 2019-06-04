<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
</head>
<body>
	<h2 align="center">
		<font color=blue>注册页面</font>
	</h2>
	<form action="registeredsuccess.jsp" method="post">
		<table align="center">
			<tr>
				<td>请输入用户名：</td>
				<td><input type="text" name="name" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>请输入密码：</td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
			<tr>
				<td>请输入确认密码：</td>
				<td><input type="text" name="repw"></td>
			</tr>
			<tr>
				<td><input type="submit" value="注册" name="register"></td>
				<td><input type="reset" value="重填" name="rewr"></td>
			</tr>
		</table>
	</form>
</body>
</html>