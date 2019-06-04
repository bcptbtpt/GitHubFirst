<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布页面</title>
</head>
<body>
	<h2 align="center">
		<font color=blue>发布页面</font>
	</h2>
	<form action="publishsuccess.jsp" method="post">
		<table align="center">
			<tr><th>东西名称：</th><td><input type="text" name="goods"></td></tr>
			<tr><th>想卖（元）：</th><td><input type="text" name="price"></td></tr>
			<tr><th>原价（元）：</th><td><input type="text" name="cost"></td></tr>
			<tr><th>手机号：</th><td><input type="text" name="number"></td></tr>
			<tr><th>可小刀：</th><td><input type="radio" name="bargain" value="是"checked>是
			<input type="radio" name="bargain" value="否"checked>否</td></tr>
			<tr><th>类别</th>
			<td><select size="1" name="category">
			<option value="书籍">书籍</option>
			<option value="生活用品">生活用品</option>
			<option value="3C数码">3C数码</option>
			<option value="鞋服美妆">鞋服美妆</option>
			<option value="其它">其它</option>
			</select></td></tr>
			<tr><th>其他描述</th>
			<td><textarea name="intro" rows="5" cols="30"></textarea></td></tr>
			<tr><td><input type="submit" value="发布" name="publish"></td><td><input type="reset" value="重填" name="rewr"></td></tr>
		</table>
		<p align="center"><a href="interface.jsp" color=blue>返回主页面</a></p>
	</form>
</body>
</html>