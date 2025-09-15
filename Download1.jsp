<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Secure Data Group Sharing</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style3 {
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
	color: #000000;
}
.style4 {font-size: 24px}
.style7 {font-size: 16px}
.style9 {font-size: 11px}
.style14 {	font-size: 12px;
	color: #504b4b;
}
.style15 {	font-size: 24;
	font-weight: bold;
	color: #666666;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo style3">
        <h3 class="style4"><a href="index.html"></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li ><a href="DataUserMain.jsp">Home</a></li>
            <li class="active"><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin">Central Authority</a></li>
            <li><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
            <li><a href="DecryptionCSPLogin.jsp">Data Disseminator </a> </li>
            <li><a href="KeyCSPLogin.jsp">Private Key Generator </a></li>>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <form action="Download2.jsp" method="post" name="form1" id="form1">
        <p>
          <%
		  
		    	try 
				{
		  		String file = request.getParameter("t1");
				String trapdoor="";
				String sk="";
				String user=(String) application.getAttribute("uname");
				
				String strQuery = "select trapdoor from cloudserver where fname='"+file+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				{
					if(rs.next()==true)
					{
						trapdoor=rs.getString(1);
						
						String Query = "select sk from request where fname='"+file+"'";
						ResultSet rs1 = connection.createStatement().executeQuery(Query);
						if(rs1.next()==true)
						{
							 sk=rs1.getString(1);
						
							
					
									%>
		</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<table width="478" border="0" align="center">
							  <tr>
								<td width="223"><span class="style1">Enter File Name :-</span></td>
								<td width="245"><label>
								  <input required="required" name="t1" type="text" value="<%=file%>" size="40" />
								</label></td>
							  </tr>
							  <tr>
								<td height="34"><span class="style1">Trapdoor :-</span></td>
								<td><input name="t12" type="text" value="<%=trapdoor%>" size="40" /></td>
							  </tr>
							  <tr>
								<td><span class="style1">Secret Key :-</span></td>
								<td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
							  </tr>
							  <tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td><div align="right"></div></td>
								<td><label>
								  <input type="submit" name="Submit2" value="Download" />
								</label></td>
							  </tr>
							</table>
							<p>
							  <%
						}
						else
						{
									%>	<br/><br/><br/><p><h1 class="style4">Secret Key Not Generated !!!</h1></p>
									<%
																		
						}	
					}
					else
					{
		
						%><br/><br/><br/><p><h1 class="style4">File   Doesn't   Exist !!!</h1></p><%
			%>
        </p>
        <p>
          <%
					}
				}
	 
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </form>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
