<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页面</title>
</head>
<body>
	<%
         Context ctx = null;
         DataSource ds = null;
         Statement stmt =null;
         ResultSet rs = null;
         Connection con = null;
         String name = request.getParameter("name").trim();
         String pw = request.getParameter("pw").trim();
         try{
	        ctx = new InitialContext();
	        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");//mysql是在创建连接池时自己创建的名字  语句功能找到配置的数据库
	        con = ds.getConnection();//创建数据库连接
	        stmt = con.createStatement();//建立数据库操作对象
	        rs=stmt.executeQuery("select * from user where name='"+name+"'");
	        if(rs.next()){
		           rs=stmt.executeQuery("select * from user where name='"+name+"' and password='"+pw+"'");
		           if(rs.next()){
		        	  session.setAttribute("username",name); 
			          out.print(name+"登录成功");
		           }else{
			          out.print("密码输入错误！！！<br>"+"重新<a href=\"login.jsp\">登录</a>");
		           }
	        }else{
		        out.print("<font color=red>"+name+"</font>用户不存在！！！<br>"+"请点击<a href=\"registered.jsp\">注册</a>");
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
<p align="center"><a href="interface.jsp" color=blue>进入主页面</a></p>		
</body>
</html>