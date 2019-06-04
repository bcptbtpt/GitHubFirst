<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>删除</title>
</head>
<body>
<%
		Context ctx = null;
		DataSource ds = null;
		Statement stmt =null;
		int rs = 0;
		Connection con = null;
		String id=request.getParameter("id").trim();
		try{
		ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		con = ds.getConnection();
		stmt = con.createStatement();
		rs=stmt.executeUpdate("delete from shangpin where id='"+id+"'");	
		if(rs==1){
			out.println("删除成功!");	
		}else{
			out.println("删除失败!");
		}
		}catch(Exception e){
			out.print(e);
		}finally{
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
		}
%>
删除成功！！三秒钟后自动转到已发布页面<br>
如果没有跳转，请点击<a href="published.jsp">这里</a>！！！
				<span style="font-size:24px;"><meta http-equiv="refresh" content="3;URL=published.jsp"> </span>
</body>
</html>