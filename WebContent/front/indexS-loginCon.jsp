<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />
<%
	String username = (String) session.getAttribute("username");

	if (username == null || username == "") {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">PhoneNum：011-35747336</span><a
						href="login.jsp">Login</a>&nbsp; ｜ &nbsp;<a href="register.jsp">Register</a>
				</p>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/51logo.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	} else {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">PhoneNum：011-35747336</span>Hello，<%=username%>
					&nbsp; &nbsp;<a href="../front/modifyMember.jsp">Change</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="SellBook.jsp">Sell Book</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;<a href="orderList_seller.jsp">Order List</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="logout.jsp">Logout</a>
				</p>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/51logo.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	}
%>