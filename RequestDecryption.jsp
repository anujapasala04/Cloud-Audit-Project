<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
.style17 {font-size: 14; }
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
          <h2><span>Request For Decryption  :</span></h2>
          <p>&nbsp;</p>
          <form action="RequestDecryption.jsp" method="post" id="leavereply">
            <div align="center">
              <p align="left" class="style17">Enter Owner Name :
                <input name="t142" type="text" size="30" />
              </p>
              <p align="left" class="style17"> Enter File Name :&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="t14" type="text" size="30" />
                  <br />
                  <br />
                  <input type="submit" name="Submit" value="Request Download Permission" />
              </p>
              <p align="left" class="style17">
                <%
	try
	{	  
		  String dname=request.getParameter("t142");
		  String fname=request.getParameter("t14");
		  String user=(String)application.getAttribute("uname");
		  String str="Requested";
		  
		  String query="Select *from request where user='"+user+"' and owner='"+dname+"' and fname='"+fname+"' and decrypt='"+str+"'";
	      Statement st=connection.createStatement();
          ResultSet rs=st.executeQuery(query);
		  if (rs.next())
		  {
		  		out.println ("<h1>Decrypt Permission Already Sent </h1>");
		  }
		  else
		  {
		  
		  	 String query1="Select * from cloudserver where fname='"+fname+"' and downer='"+dname+"'";	  
			 Statement st1=connection.createStatement();
			 ResultSet rs1=st1.executeQuery(query1);
			 if (rs1.next())
			 {
			
			  	 String query2="Select * from request where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";	  
				 Statement st2=connection.createStatement();
				 ResultSet rs2=st2.executeQuery(query2);
				 if (rs2.next())
				 {
					  String query3="update request set decrypt='"+str+"' where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  out.println ("<h1>Decrypt Permission Sent Sucessfully </h1>");
				 }
				 else
				 {
					  String query3="insert into request  (user,owner,fname,decrypt) values('"+user+"','"+dname+"','"+fname+"','"+str+"')";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  out.println ("<h1>Decrypt Permission Sent Sucessfully </h1>");
				 }
				  
			  }
			  else
			  {
				
				  out.println ("<h1>File Not Found </h1>");
			  }
		 }
		connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		  %>
              </p>
              <p align="left" class="style17"><a href="DataUserMain.jsp">Back</a></p>
            </div>
            <label for="name"></label>
          </form>
          <p align="justify">&nbsp;</p>
          <p align="justify"><br />
          </p>
          <p align="justify">&nbsp;</p>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" />
            </span>
          </form>
        </div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="DataUserMain.jsp">Home</a></li>
            <li><a href="Search.jsp">Search</a></li>
            <li><a href="U_ViewAllFiles.jsp">View Files </a></li>
            <li><a href="RequestSecretKey.jsp">Request Secret Key </a></li>
            <li><a href="ViewSKResponse.jsp">View Secret Key Response </a></li>
            <li><a href="ViewDResponse.jsp">View Decryption Response </a></li>
            <li><a href="Download.jsp">Download File </a></li>
            <li><a href="DataUserLogin.jsp">Logout</a></li>
          </ul>
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
