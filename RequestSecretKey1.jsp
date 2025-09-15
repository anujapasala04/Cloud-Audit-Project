<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
.style26 {font-size: 10px; }
.style28 {	font-size: 16px;
	font-weight: bold;
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
      <div class="mainbar">
        <div class="article">
          <h2><span>Request Secret Key  :</span></h2>
          <p>&nbsp;</p>
          <form action="PatientAuthentication.jsp" method="post" id="leavereply">
            <div class="post_content">
              <div class="article">
                <%
String owner = request.getParameter("t142");
String fname = request.getParameter("t14");
String uname=(String)application.getAttribute("uname");
String generate ="Generate Key";
String s="null";


String query="select * from request  where user='"+uname+"' and fname='"+fname+"' and owner='"+owner+"' and sk!='"+s+"'"; 
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery(query);

	if ( rs.next())
	{
%>
                <p class="style28">Request Already Sent To Private Key Generator !!!</p>
                <p class="style28"><a href="DataUserMain.jsp" class="style26">BACK</a></p>
              </div>
              <%	}
	else
	{
		String query1="select * from cloudserver  where fname='"+fname+"' and downer='"+owner+"'"; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
	
	
		if ( rs1.next())
		{
			String query2="select * from request  where user='"+uname+"' and fname='"+fname+"' and owner='"+owner+"'"; 
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery(query2);
			if(rs2.next())
			{
				String query3="update request set sk='"+generate+"' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
				connection.createStatement().executeUpdate(query3);
				%>
				
                <p class="style28">Request Sent To Private Key Generator !!! </p>
                <p><a href="DataUserMain.jsp" class="style26">BACK</a></p>
				<%
			}
			else
			{
				String query4="insert into request(user,owner,fname,sk) values('"+uname+"','"+owner+"','"+fname+"','"+generate+"')";
				connection.createStatement().executeUpdate(query4); %>
				
                <p class="style28">Request Sent To Private Key Generator !!! </p>
                <p><a href="DataUserMain.jsp" class="style26">BACK</a></p>
			
           <p class="style28">&nbsp;</p>
              <p class="style28"><a href="DataUserMain.jsp" class="style26">BACK</a></p>
              <div class="content_resize">
                <%
			}
		}
		else
		{
%>
                <label>
                <div align="left">
                  <p class="style28"><br />
                    File Doesn't Exist !!! </p>
                  <p class="style28">&nbsp;</p>
                  <p><a href="RequestSearchKey.jsp" class="style26">BACK</a></p>
                </div>
              </div>
              <p>
                <%
		}
	}
%>
              </p>
            </div>
            <label for="name"></label>
            <p>&nbsp;</p>
          </form>
          <p align="justify">&nbsp;</p>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
