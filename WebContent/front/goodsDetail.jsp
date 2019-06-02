<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>OBookshop</title>
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
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 页面主体内容 -->
			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12 view-product">
								<!-- 根据商品ID获取并显示商品信息 -->
								<%
									int typeSystem = 0;//保存商品类型ID的变量
									int ID = Integer.parseInt(request.getParameter("ID"));//获取商品ID
									if (ID > 0) {
										ResultSet rs = conn.executeQuery("select t1.ID,t1.GoodsName,t1.Introduce,t1.picture,t1.price,t1.typeID,t1.num,t2.tel,t2.userName "
												+ "from tb_goods t1, tb_member t2 where t1.sellID=t2.ID and t1.ID=" + ID);//根据ID查询商品信息
										String goodsName = "";//保存商品名称的变量
										float price = (float) 0.0;//保存商品原价的变量
										String picture = "";//保存商品图片的变量
										String introduce = "";//保存商品描述的变量
										int Num=-1;
										String tel="";
										String sellerName="";
										if (rs.next()) {//如果找到对应的商品信息
											goodsName = rs.getString(2);//获取商品名称
											introduce = rs.getString(3);//获取商品描述
											picture = rs.getString(4);//获取商品图片
											price = rs.getFloat(5);//获取商品原价
											typeSystem = rs.getInt(6);//获取商品类别ID
											Num = rs.getInt(7);
											tel = rs.getString(8);
											sellerName = rs.getString(9);
										}
										conn.close();//关闭数据库连接
								%>
								<!-- 显示商品详细信息 -->
								<div class="row">
									<div class="col-xs-12 col-md-4 col-sm-4">
										<ul class="thumbnails" style="list-style: none">
											<li><a class="thumbnail" href="#"> <img src="../images/goods/<%=picture%>"></a></li>
										</ul>
									</div>
									<div class="col-xs-12 col-md-8 col-sm-8">
										<div style="margin-left: 30px; margin-top: 20px">
											<h1 class="product-title"><%=goodsName%></h1>
											<div class="list-unstyled price"><h3>Price: <%=price%>RM</h3></div>
											<div class="rating"><h4>Seller: <%=sellerName %></h4></div>
											<div id="product"><hr>
												<div class="form-group">
													<label class="control-label" for="shuliang"> Number </label>
													<input type="number" name="quantity" value="1" size="2"
														id="shuliang" class="form-control"> <br>
													<input type="hidden" id="num" value=<%=Num%>>
													<div class="btn-group">
														<button type="button" onclick="addCart()" class="btn btn-primary btn-primary">
															<i class="fa fa-shopping-cart"></i> Add to cart</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-12 description_oc clearfix">
										<ul class="nav nav-tabs htabs">
											<li class="active" style="width: 150px"><a href="#tab-description" data-toggle="tab"
												aria-expanded="true">Introduce</a></li>
										</ul>
										<div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
											<div class="tab-pane active" id="tab-description"><%=introduce%>
											<br>Phone No.:<%=tel%></div>
										</div>
									</div>
								</div>
								<%
									} else {//获取到的ID不合法
										out.println("<script language='javascript'>alert('您的操作有误');window.location.href='index.jsp';</script>");
									}
								%>
								<!-- //显示相关商品 -->
								<!-- //根据商品ID获取并显示商品信息 -->
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //页面主体内容 -->
		</div>
	</div>
	<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
	<script type="text/javascript">
	function addCart() {
		var num = $('#shuliang').val();//获取输入的商品数量
		var Num = $('#num').val();
		//验证输入的数量是否合法
		if (num < 1) {//如果输入的数量不合法
			alert('Please enter the number more than 0 ！');
			return;
		}else if(num>Num){
			alert('Please enter the number less than Num ！');
			return;
		}
		window.location.href = "cart_add.jsp?goodsID=<%=ID%>&num=" + num;
		}
	</script>
</body>
</html>
