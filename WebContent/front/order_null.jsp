<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>OBookShop</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<link rel="stylesheet" href="css/mr-02.css" type="text/css">

</head>

<body>
	<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div id="mrshop" class="mrshop common-home">
			<div class="container_oc">

				<div class="row">
					<div id="content_oc" class="col-sm-12">
						<h1>My Order</h1>
						<div class="table-responsive cart-info">Null</div>
					</div>
				</div>
				<br /> <br />
				<div class="row">
					<div id="content_oc" class="col-sm-12">
						<br /> <br />
						<div class="buttons">
							<div class="pull-right">
								<a href="index.jsp" class="tigger btn btn-primary btn-primary">Shopping</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>

