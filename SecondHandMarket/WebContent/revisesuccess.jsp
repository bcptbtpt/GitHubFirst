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
<title>修改成功页面</title>
</head>
<body>
<%
		Context ctx = null;
		DataSource ds = null;
		Statement stmt =null;
		ResultSet rs = null;
		Connection con = null;
		String id=request.getParameter("id").trim();
		String goods=request.getParameter("goods").trim();
		int price = 0;
		price=Integer.parseInt(request.getParameter("price"));
		int cost = 0;
		cost=Integer.parseInt(request.getParameter("cost"));
		String number=request.getParameter("number").trim();
		String bargain=request.getParameter("bargain").trim();
		String category=request.getParameter("category").trim();
		String intro=request.getParameter("intro").trim();		  
		try{
		ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");//mysql是在创建连接池时自己创建的名字
		con = ds.getConnection();
		stmt = con.createStatement();
		    if((goods!=null)&&(number!=null)&&(bargain!=null)&&(category!=null)&&(intro!=null)&&(price!=0)&&(cost!=0)){
	 			stmt.executeUpdate("update shangpin set goods='"+goods+"',price='"+ price + "',cost='"+ cost + "',number='"+number+"',bargain='"+bargain+"',category='"+category+"',intro='"+intro+"' where id='"+id+"'");			
				%>
				修改成功!!三秒钟后自动转到已发布页面！！！<br>
				如果没有跳转，请点击<a href="published.jsp">这里</a>！！！
				<span style="font-size:24px;"><meta http-equiv="refresh" content="3;URL=published.jsp"> </span>
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
</body>
</html>