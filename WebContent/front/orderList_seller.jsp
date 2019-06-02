<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodselement"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String username = "";
	username = (String) session.getAttribute("username");
	if (username == "" || username == null) {
		out.println("<script language='javascript'>alert('Please login first!');window.location.href='index.jsp';</script>");
	} else {
		ResultSet rs = conn.executeQuery(
				"select * from tb_order t1,tb_order_detail t2,tb_goods t3, tb_member t4 where t2.goodsID=t3.ID and t1.OrderID=t2.orderID and t4.username='"
						+ username + "' and t4.ID= t3.sellID order by t1.OrderDate desc");
		rs.last();
		int RecordCount = rs.getRow();
		if (RecordCount == 0) {
			out.println("<script language='javascript'>window.location.href='order_null.jsp';</script>");
			return;
		}
		rs.beforeFirst();
		int orderID = 0;
		int number = 0;
		String recevieName = "";
		String tel = "";
		String goodsName = "";
		float price = 0;
		String address="";
		String orderDate = "";
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>ObookShop</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">

<script src="js/jsArr01.js" type="text/javascript"></script>
<script src="js/module.js" type="text/javascript"></script>
<script src="js/jsArr02.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
</head>

<body>
	<jsp:include page="indexS-loginCon.jsp" />
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 显示订单列表 -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>My order</h1>
									<div class="table-responsive cart-info">
										<table class="table table-bordered">
											<thead>
												<tr>
													<td class="text-center image">Order</td>
													<td class="text-center name">Book(s) Name</td>
													<td class="text-center name">Number</td>
													<td class="text-center quantity">Buyer Name</td>
													<td class="text-center price">Phone Number</td>
													<td class="text-center name">Address</td>
													<td class="text-center total">Date</td>
												</tr>
											</thead>
											<tbody>
												<%
													while (rs.next()) {
															orderID = rs.getInt("orderID");
															goodsName = rs.getString("goodsName");
															number = rs.getInt("number");
															recevieName = rs.getString("recevieName");
															tel = rs.getString("tel");
															price = rs.getFloat("price");
															address= rs.getString("address");
															orderDate = rs.getString("orderDate");
															orderDate = orderDate.substring(0, 16);
												%>
												<tr>
													<td class="text-center image" width="10%"><%=orderID%>
													</td>
													<td class="text-center name"><%=goodsName%></td>
													<td class="text-center quantity"><%=number%></td>
													<td class="text-center quantity"><%=recevieName%></td>
													<td class="text-center quantity"><%=tel%></td>
													<td class="text-center quantity"><%=address%></td>
													<td class="text-center quantity"><%=orderDate%></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
							</div>
						</div>
						<br /><br />
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<br />
								<br />
								<div class="buttons">
									<div class="pull-right">
										<a href="index_S.jsp" class="tigger btn btn-primary btn-primary">Return</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		<!-- //显示订单列表 -->
		</div>
	</div> 
</body>
</html>
<%
	conn.close();
	}
%>
