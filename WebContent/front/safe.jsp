<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<%if (session.getAttribute("username")==null){
	out.println("<script language='javascript'>alert('您还没有登录!');window.location.href='../index_S.jsp';</script>");
}%>
