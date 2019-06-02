<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=conn.executeQuery("select * from tb_goods t1, tb_member t2 where t1.sellID=t2.ID order by INTime Desc");
%>
<html>
<head>
<title>OBookManage</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="18" height="45" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed">
        <img src="images/manage_ico1.GIF" width="11" height="11">&nbsp;<a href="superType.jsp"> [SuperType Manage]</a>
        &nbsp;&nbsp;&nbsp;
        <img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[SubType Manage]</a>
        &nbsp;&nbsp;&nbsp;
        <!-- <img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[Add New Book]</a> -->
        </td>
        <td width="24">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="989" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>BookList</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
    <table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
         
          </table>
            <table width="100%" height="60"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#E6E6E6">
              <tr bgcolor="#eeeeee">
                <td width="30%" height="24" align="center">Book Name</td>
                <td width="20%" align="center">Price</td>
                <td width="12%" align="center">Seller</td>
                <td width="11%" align="center">New Book</td>
                <td width="11%" align="center">Number</td>
                <td width="8%" align="center">Modify</td>
                <td width="8%" align="center">Delete</td>
              </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(Page>maxPage){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  int ID=rs.getInt("ID");
	  String goodsName=rs.getString("goodsName");
	  String introduce=rs.getString("introduce");
	  float price=rs.getFloat("price");
	  String newgoods=rs.getInt("newgoods")==0 ? "No":"Yes";
	  String num=rs.getString("num"); 
	  String seller=rs.getString("userName");
	  %>

              <tr style="padding:5px;">
                <td height="20" align="center"><a href="goods_detail.jsp?ID=<%=ID%>"><%=goodsName%></a></td>
                <td align="center" ><%=price%>RM</td>
                <td align="center"><%=seller%></td>
                <td align="center"><%=newgoods%></td>
                <td align="center"><%=num%></td>
                <td align="center"><a href="goods_modify.jsp?ID=<%=ID%>"><img src="images/modify.gif" width="19" height="19"></a></td>
                <td align="center"><a href="goods_del.jsp?ID=<%=ID%>"><img src="images/del.gif" width="20" height="20"></a></td>
              </tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
            </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" align="right">ThisPage：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="index.jsp?Page=1">FirstPage</a>　<a href="index.jsp?Page=<%=Page-1%>">PreviousPage</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="index.jsp?Page=<%=Page+1%>">NextPage</a>　<a href="index.jsp?Page=<%=maxPage%>">LastPage&nbsp;</a>
	<%}
	%>
	</td>
  </tr>
</table>		  </td>
        </tr>
      </table>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
</body>
</html>
