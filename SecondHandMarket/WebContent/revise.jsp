<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改已发布信息</title>
</head>
<h2 align="center">修改已发布信息</h2>
<body>
<%
         Context ctx = null;
         DataSource ds = null;
         Statement stmt =null;
         ResultSet rs = null;
         Connection con = null;
         String id=request.getParameter("id").trim();
         try{
	        ctx = new InitialContext();
	        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");//mysql是在创建连接池时自己创建的名字  语句功能找到配置的数据库
	        con = ds.getConnection();//创建数据库连接
	        stmt = con.createStatement();
	        rs=stmt.executeQuery("select * from shangpin where id='"+id+"'");
	        if(rs.next()){
%>
<form action="revisesuccess.jsp" method="post">
<input type="hidden" name="id" value="<%=rs.getInt(1) %>">
<table align="center">
<tr><th>名称</th><td><input type="text" name="goods" value="<%=rs.getString(2)%>"></td></tr>
<tr><th>卖价</th><td><input type="text" name="price" value="<%=rs.getInt(3)%>"></td></tr>
<tr><th>原价</th><td><input type="text" name="cost" value="<%=rs.getInt(4)%>"></td></tr>
<tr><th>电话号码</th><td><input type="text" name="number" value="<%=rs.getString(5)%>"></td></tr>
<tr><th>可小刀</th><td><input type="text" name="bargain" value="<%=rs.getString(6)%>"></td></tr>
<tr><th>类型</th><td><input type="text" name="category" value="<%=rs.getString(7)%>"></td></tr>
<tr><th>其它描述</th><td><input type="text" name="intro" value="<%=rs.getString(8)%>"></td></tr>
<tr><th colspin="2"><input type="submit" value="修改"><input type="reset" value="重置"></th></tr> 
<% 	    
	        }
         }catch(Exception e){
	       out.print(e);
          }finally{
	          if(rs!=null)
		           rs.close();
	          if(stmt!=null)
		           stmt.close();
	          if(con!=null)
		           con.close();
}
%>
</table>
<p align="center"><a href="published.jsp" color=blue>返回已发布信息页面</a></p>
</form>

</body>
</html>