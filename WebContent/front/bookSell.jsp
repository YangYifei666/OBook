<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>SellBook</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>
<body>
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<div id="mr-content" class="mr-content col-xs-12">
				<div class="login-wrap" style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="index_seller.jsp" title="点击返回首页"><img src="images/51logo.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;">
							<h1 class="login_h1">Sell Book</h1>
						</div>
						<form id="member-registration" action="bookSell_deal.jsp"
							 onsubmit="return upload();" method="post" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="bookname-lbl" for="bookname" class="required">
											Book Name ：</label>
									</div>
									<div class="col-sm-8">
										<input type="text" name="goodsName" id="goodsName" value=""
											class="required" size="38" required="required"
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Price ：</label>
									</div>
									<div class="col-sm-8">
										<input type="number" step="0.01" name="price" id="jform_username"
											value="" class="validate-username required" size="5"
											required="required" aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Number ：</label>
									</div>
									<div class="col-sm-8">
										<input type="number" name="num" id="jform_username" 
											value="" class="validate-username required" size="5"
											required="required" aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Book Type ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<select name="bookType" >
											<option value="14">Economic Management</option>
											<option value="15">IT</option>
											<option value="16">Language</option>
											<option value="17">Others</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Introduce ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<textarea name="introduce" class="validate-introduce"
											id="jform_email2" style="width:200px;height:80px;" aria-required="true"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="bookname-lbl" for="Picture" class="required">
											Picture ：</label>
									</div>
									<div class="col-sm-8">
										<input type="text" name="picture" id="picture" value=""
											class="required" size="38" required="required"
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<div class="col-sm-4 control-label"> -->
<!-- 										<label id="picture-lbl" for="picture" class="required"> -->
<!-- 											</label> -->
<!-- 									</div> -->
<!-- 									<a href="javascript:;" class="file"> -->
<!--     									<input type="text" name="picture" id="picture" class="file"  -->
<!--     									size="5" required="required" aria-required="true">Upload picture -->
<!-- 									</a> -->
<!-- 								</div> -->
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="submit" class="btn btn-primary login">Sell Book</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script>
	function upload() {
		var upload=document.getElementById('upload');
		var nameContainer=document.getElementById('name');
		upload.onchange=function(){
		  var name=[];
		  for(var i=0;i<this.files.length;i++){
		    name[i]= this.files[i].name;
		    if(this.files[i].size>=307200){
		      alert("Piceure"+this.files[i].name+"too big, can't exceed 300kb")
		      }
		  }
		  nameContainer.innerHTML=name;
		}
		return true;
	}
</script>
</body>
</html>