<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.ResultSet"
	pageEncoding="UTF-8"%>
<%-- 创建ConnDB类的对象 --%>	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%-- 创建MemberDaoImpl类的对象 --%>	
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl" />
<%-- 创建Member类的对象，并对Member类的所有属性进行赋值 --%>	
<jsp:useBean id="member" scope="request" class="com.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");//设置请求的编码为UTF-8
		String username = member.getUsername();//获取会员账号
		String email= member.getEmail();
		ResultSet rs = conn.executeQuery("select * from tb_Member where username='" + username + "'");
		ResultSet r = conn.executeQuery("select * from tb_Member where email='" + email + "'");
		if (rs.next()) {//如果结果集中有数据
			out.println("<script language='javascript'>alert('该账号已经存在，请重新注册！');"
					+ "window.location.href='register.jsp';</script>");
		}else if (r.next()) {//如果结果集中有数据
			out.println("<script language='javascript'>alert('该邮箱已被注册，请重新注册！');"
					+ "window.location.href='register.jsp';</script>");
		} else {
			int ret = 0;//记录更新记录条数的变量
			ret = ins_member.insert(member);//将填写的会员信息保存到数据库
			if (ret != 0) {
				out.println("<script language='javascript'>alert('会员注册成功！');"
						+ "window.location.href='login.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('会员注册失败！');"
						+ "window.location.href='register.jsp';</script>");
			}
		}
	%>
</body>
</html>