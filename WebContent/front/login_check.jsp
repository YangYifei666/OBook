 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.sql.ResultSet"%>
<%-- 创建ConnDB类的对象 --%>	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username = request.getParameter("username");//获取账户
	String checkCode = request.getParameter("checkCode");//获取验证码
	if (checkCode.equals(session.getAttribute("randCheckCode").toString())) {
		try {//捕捉异常
			ResultSet rs = conn.executeQuery("select * from tb_Member where username='" 
	                                              + username + "'");
			if (rs.next()) {//如果找到相应的账号
				String PWD = request.getParameter("PWD");//获取密码
				String accountType1="1";
				String accountType2="0";
				if (PWD.equals(rs.getString("password"))&&accountType1.equals(rs.getString("accountType"))) {
					session.setAttribute("username", username);
					response.sendRedirect("index.jsp");
				} else if(PWD.equals(rs.getString("password"))&&accountType2.equals(rs.getString("accountType"))){
					session.setAttribute("username", username);
					response.sendRedirect("index_S.jsp");
				}else {
					out.println(
			"<script language='javascript'>alert('Please enter right username and password!');"
					        +"window.location.href='login.jsp';</script>");
				}
			} else {
				out.println(
					"<script language='javascript'>alert('您输入的用户名或密码错误，或您的账户"+
	                   "已经被冻结，请与管理员联系!');window.location.href='login.jsp';</script>");
			}
		} catch (Exception e) {//处理异常
			out.println(
					"<script language='javascript'>alert('Incorrect operation !');"
			        +"window.location.href='login.jsp';</script>");
		}
		conn.close();//关闭数据库连接
	} else {
		out.println("<script language='javascript'>alert('Wrong verification code!');history.back();</script>");
	}
%>
</body>
</html>