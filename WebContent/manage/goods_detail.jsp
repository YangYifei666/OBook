<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=(String)session.getAttribute("username");
int ID=-1;
ID=Integer.parseInt(request.getParameter("ID"));
if(ID>0){
	ResultSet rs=conn.executeQuery("select t1.ID,t1.GoodsName,t1.Introduce,t1.price,t1.picture,t1.num,t2.userName from tb_goods t1, tb_member t2 where t1.sellID=t2.ID and t1.ID="+ID);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float price=(float)0.0;
	String picture="";
	String num="";
	String seller="";
	if(rs.next()){
		goodsID=rs.getInt(1);
		goodsName=rs.getString(2);
		introduce=rs.getString(3);
		price=rs.getFloat(4);
		picture=rs.getString(5);
		num=rs.getString(6);
		seller=rs.getString(7);
	}
%>
<html>
<head>
<title>OBookManage</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<script src="onclock.JS"></script>
</head>
<body> 
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed">
        <img src="images/manage_ico1.GIF" width="11" height="11">&nbsp;<a href="superType.jsp"> [SuperType Manage]</a>
        &nbsp;&nbsp;&nbsp;
        <img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[SubType Manage]</a>
        &nbsp;&nbsp;&nbsp;
        <!-- <img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[Add New Book]</a> -->
        </td>
        <td width="12">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1070" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Book's Information</b></td>
        <td width="20" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" colspan="4" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>

    <table width="96%" height="153"  cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#E6E6E6" style="padding:5px;">
                    <tr>
                      <td width="36%" height="95" rowspan="4" colspan="1" align="center"><img src="../images/goods/<%=picture%>" width="120" height="80" class="tableBorder_l"></td>
                      <td width="32%" height="40" colspan="1"><%=goodsName%></td>
                      <td width="32%" height="40" colspan="1">Seller Name:&nbsp;&nbsp;&nbsp;<%=seller%></td>
                    </tr>
                    <tr>
                      <td width="64%" height="40" colspan="2">Price：<%=price%>(RM) </td>
                    </tr>
                    <tr>
                      <td width="64%" height="40" colspan="2">Number：<%=num%> </td>
                    </tr>
                    <tr>
                      <td width="64%" height="40" colspan="2"><%=introduce%></td>
                    </tr>
                  </table>	
                  <input name="Submit" type="submit" class="btn_bg_short" onClick="history.back(-1);" value="Return">
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
</body>
</html>
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('您的操作有误');window.location.href='index.jsp';");
}%>