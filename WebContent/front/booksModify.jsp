<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String PID="";
String goodsname="";
int superID1=-1;
int subID1=-1;
String introduce="";
String picture="";
float price=0f;
int newgoods=0;
String num="";
int sale=1;
PID=request.getParameter("ID");
if (PID!=null && PID!=""){
	int ID=Integer.parseInt(PID);
	ResultSet rs=conn.executeQuery("select * from V_goods where ID="+ID);
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
	}else{
		superID1=rs.getInt("superID");
		subID1=rs.getInt("subID");
		goodsname=rs.getString("goodsname");
		introduce=rs.getString("introduce");
		price=rs.getFloat("Price");				
		picture=rs.getString("picture");
		newgoods=rs.getInt("newgoods");	
		num=rs.getString("num");
		sale=rs.getInt("sale");
	}
	ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
	int superID=-1;
	String superName="";
	if(!rs_super.next()){
		out.println("<script language='javascript'>alert('请先录入类别信息!');window.location.href='index.jsp';</script>");
		return;
	}
%>
<html>
<head>
<title>OBookShop</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>
<script src="js/module.js" type="text/javascript"></script>
<script src="js/jsArr02.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script language="javascript" src="JS/jquery.min.js"></script>
<script language="javascript">
$(document).ready(function(){
	selSubType(<%=superID%>);
});

function selSubType(val){
	$.get("selSubType.jsp",{superID:val},
		function(data){
			$("#subType").html(data);
			});
}
</script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("请输入商品名称！");form1.goodsName.focus();return;
	}
	if (form1.picture.value==""){
		alert("请输入图片文件的路径！");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("请输入商品的定价！");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("您输入的定价错误，请重新输入！");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("请输入商品简介！");form1.introduce.focus();return;
	}		
	form1.submit();
}
</script>

<body onLoad="selSubType(<%=superID1%>)">
	<jsp:include page="indexS-loginCon.jsp" />
		<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  			<tr>
    			<td align="center" valign="top">
				<!---->
      			 <form action="booksModify_deal.jsp" method="post" name="form1">
			    <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;Book Name：
                      <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
                    <td height="27" colspan="3">&nbsp;
                      <input name="goodsName" type="text" class="Sytle_text" value="<%=goodsname%>" size="50">
                      &nbsp;&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;SuperType：</td>
                    <td width="31%" height="27">&nbsp;
                      <sel ect name="supertype" class="textarea" id="supertype"  onChange="selSubType(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"<%if(superID==superID1){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    	<!-- <td width="13%" height="27"> &nbsp;SubType：</td>
                    <td width="42%" height="27" id="subType">SubType List</td> -->
                  </tr>
                  <tr>
                    <td height="16">&nbsp;Picture：</td>
                    <td height="27" colspan="3">&nbsp;
                        <input name="picture" type="text" class="Style_upload" id="picture" value="<%=picture%>" size="30"> 
                    </td>
                  </tr>
                   <tr>
                    <td height="27" align="center">Price：</td>
                    <td height="27"><span style="float:left;"><input name="price" type="text" class="Sytle_text" id="price3" value="<%=price%>" size="14">                      
                     </span><span  style="float:left;padding-top:10px;">&nbsp;(RM)</span></td>
                     <td height="41">&nbsp;Number：</td>
                    <td height="41"><span style="float:left;">
                          <input name="num" type="text" class="Sytle_text" id="num" value="<%=num%>"></span>
                          <span  style="float:left;padding-top:10px;"></span>
                    </td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;New Book：</td>
                    <td>&nbsp; <input name="newGoods" type="radio" class="noborder" value="1"<%if(newgoods==1){out.print(" checked");}%>>Yes
  								<input name="newGoods" type="radio" class="noborder" value="0"<%if(newgoods==0){out.print(" checked");}%>>No
  					</td>
                    
                  </tr>
                  <tr>
                    <td height="103">&nbsp;Introduce：</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"><%=introduce%></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_bg_short" value="Save" onClick="mycheck()">
                        &nbsp;                        
						<input name="Submit2" type="reset" class="btn_bg_short" value="Reset">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="Return" onClick="JScript:history.back()">
                    </td>
                  </tr>
                </table>
                <input name="sale" type="hidden" value=1>
			  </form>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
    </table></td>	  
  </tr>
</table>
</body>
</html>

<%}else{
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';");
}%>