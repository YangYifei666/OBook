<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="GoodsDao" scope="page" class="com.dao.GoodsDaoImpl" />
<jsp:useBean id="g" scope="request" class="com.model.Goods">
	<jsp:setProperty name="g" property="*" /></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>OBookShop</title>
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
			<!-- //分页显示图书列表 -->
			<div id="mr-content">

				<div id="system-message-container" style="display: none;"></div>

				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<ul class="breadcrumb">
						</ul>
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<div class="box_oc">
									<div class="box-heading">
									<%
									String username = (String) session.getAttribute("username");
									%>
										<h1 class="mrshop_heading_h1"><%=username%>'s BookList</h1>
									</div>
									<div class="box-content">
										<hr>
										<div class="row">
											<%
												ResultSet os = conn.executeQuery("select * from tb_goods t1, tb_member t2 where t1.sellID=t2.ID and t2.username='"
													+ username + "' order by INTime Desc");
												System.out.print(os.getFetchSize());
												String str = (String) request.getParameter("Page");
												if (str == null) {
													str = "0";
												}
												int pagesize = 12;
												os.last();
												int RecordCount = os.getRow();
												int maxPage = 0;
												maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize) : (RecordCount / pagesize + 1);

												int Page = Integer.parseInt(str);
												if (Page < 1) {
													Page = 1;
												} else {
													if (Page > maxPage) {
														Page = maxPage;
													}
												}
												os.absolute((Page - 1) * pagesize + 1);
												for (int i = 1; i <= pagesize; i++) {
													int ID = os.getInt("ID");
													String goodsName = os.getString("goodsName");
													String introduce = os.getString("introduce");
													String picture = os.getString("picture");
													String newgoods = os.getInt("newgoods") == 0 ? "否" : "是";
											%>

											<div
												class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="product-thumb">
													<div class="actions">
														<div class="image">
															<a style="width: 95%" href="booksDetail.jsp?ID=<%=ID%> "><img
																src="../images/goods/<%=picture%>"
																class="img-responsive"> </a>
														</div>
													</div>
													<div>
														<div class="caption">
															<div class="name">
																<a href="booksDetail.jsp?ID=<%=ID%>" style="width: 95%">
																	<span style="color: #0885B1">Name：</span><%=goodsName%></a>
															</div>

														</div>

													</div>
												</div>
											</div>
											<%
												try {
														if (!os.next()) {
															break;
														}
													} catch (Exception e) {
													}
												}
											%>
										</div>
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td height="30" align="right">This Page：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a href="index_S.jsp?Page=1">First Page</a> <a
														href="index_S.jsp?Page=<%=Page - 1%>">Previous page</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
														href="index_S.jsp?Page=<%=Page + 1%>">Next Page</a>
														<a href="index_S.jsp?Page=<%=maxPage%>">Last Page</a>
														<%
															}
														%>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //分页显示图书列表 -->
		</div>
	</div>
</body>
</html>