 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	/* 最新上架商品信息 */
	ResultSet rs_new = conn.executeQuery("select top 18 t1.ID, t1.GoodsName,t1.price,t1.picture,t2.TypeName "
			+ "from tb_goods t1,tb_subType t2 where t1.typeID=t2.ID and "
			+ "t1.newGoods=1 and t1.price!=0 and num>=1 order by t1.INTime desc");//查询最新上架商品信息 
	int new_ID = 0;//保存最新上架商品ID的变量
	String new_goodsname = "";//保存最新上架商品名称的变量
	float new_nowprice = 0;//保存最新上架商品价格的变量
	String new_picture = "";//保存最新上架商品图片的变量
	String typeName = "";//保存商品分类的变量
%>
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
	<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
	<!-- 轮播广告及热门商品 -->
	<div class="container mr-sl mr-sl-1">
		<div class="mr-spotlight mr-spotlight-1  row">
	<!-- 最新上架及打折商品展示 -->
	<nav class="container mr-masstop  hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">New Books</span>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架商品 ：添加12条商品信息-->
										<%
											while (rs_new.next()) {//设置一个循环
												new_ID = rs_new.getInt(1); //获取最新上架商品的ID
												new_goodsname = rs_new.getString(2); //获取最新上架商品的商品名称
												new_nowprice = rs_new.getFloat(3); //获取最新上架商品的价格
												new_picture = rs_new.getString(4); //获取最新上架商品的图片
												typeName = rs_new.getString(5); //获取最新上架商品的类别
										%>
										<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<div class="product-thumb transition">
												<div class="actions">
													<div class="image">
														<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <img
															src="../images/goods/<%=new_picture%>"
															alt="<%=new_goodsname%>" class="img-responsive"></a>
													</div>
													<div class="button-group">
														<div class="cart">
															<button class="btn btn-primary btn-primary" type="button"
																data-toggle="tooltip"
																onclick='javascript:window.location.href="cart_add.jsp?goodsID=<%=new_ID%>&num=1"; '
																style="display: none; width: 33.3333%;"
																data-original-title="Add to Shopping Cart">
																<i class="fa fa-shopping-cart"></i>
															</button>
														</div>
													</div>
												</div>
												<div class="caption">
													<div class="name" style="height: 40px">
														<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <span
															style="color: #0885B1">Book Name：</span> <%=new_goodsname%></a>
													</div>
													<p class="price">
														Prices：<%=new_nowprice%>RM
													</p>
												</div>
											</div>
										</div>
										<%
											}
										%>
										<!-- //循环显示最新上架商品：添加12条商品信息 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //最新上架选项卡 -->
			</div>
		</div>
	</div>
	</nav>
	<!-- //最新上架及打折商品展示 -->
</body>
</html>