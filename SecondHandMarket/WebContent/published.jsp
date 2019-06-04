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
<title>已发布信息</title>
</head>
<h2 align="center">已发布信息</h2>
<body>
<%
         Context ctx = null;
         DataSource ds = null;
         Statement stmt =null;
         ResultSet rs = null;
         Connection con = null;
         String username=(String)session.getAttribute("username");
         try{
	        ctx = new InitialContext();
	        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");//mysql是在创建连接池时自己创建的名字  语句功能找到配置的数据库
	        con = ds.getConnection();//创建数据库连接
	        stmt = con.createStatement();
	        rs=stmt.executeQuery("select * from shangpin where name='"+username+"'");
	        if(rs.next()){
	    		rs = stmt.executeQuery("SELECT shangpin.id,shangpin.goods,shangpin.price,shangpin.cost,shangpin.number,shangpin.bargain,shangpin.category,shangpin.intro FROM shangpin WHERE shangpin.name='"+username+"'");
%>
<form>
<table align="center">
<tr><th>商品编号</th><th>名称</th><th>卖价</th><th>原价</th><th>电话号码</th><th>可小刀</th><th>类型</th><th>其它描述</th></tr>
<%
	    while(rs.next()){
%>
 <tr><td><%out.println(rs.getInt(1));%></td><td><%out.println(rs.getString(2));%></td><td><%out.println(rs.getInt(3));%></td><td><%out.println(rs.getInt(4));%></td><td><%out.println(rs.getString(5));%></td><td><%out.println(rs.getString(6));%></td><td><%out.println(rs.getString(7));%></td><td><%out.println(rs.getString(8));%></td>
 <td><a href="revise.jsp?id=<%=rs.getInt(1) %>">修改</a>&nbsp;<a href="del.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('确定要删除吗？')">删除</a></td></tr>	    		
<%
	    }
       }else{
       	out.print("您还没有发布信息<br>"+"请点击<a href=\"interface.jsp\">返回主页面</a>");
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
</form>
<p align="center"><a href="interface.jsp" color=blue>返回主页面</a></p>
</body>
</html>