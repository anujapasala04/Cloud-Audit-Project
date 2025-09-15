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
.style10 {color: #504b4b}
.style21 {font-size: 14px}
.style23 {color: #666666; font-weight: bold;}
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
          <li><a href="KeyCSPMain.jsp">Home</a></li>
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
            <li  ><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
            <li><a href="DecryptionCSPLogin.jsp">Data Disseminator </a> </li>
            <li class="active"><a href="KeyCSPLogin.jsp">Private Key Generator</a></li>>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span> Generated  Key and Assigned Time Token!! </span></h2>
          <div class="clr"></div>
          <div class="details">
            <div align="justify">
              
              <p>&nbsp;</p>
             
			 <%



try 
{
int uid = Integer.parseInt(request.getParameter("id"));
String tt=request.getParameter("tt");
String fname=(String)application.getAttribute("fnam");



Statement st1 = connection.createStatement();

String query1 ="update request set Tt='"+tt+"' where id='"+uid+"' ";
st1.executeUpdate (query1);
connection.close();




}
catch(Exception e)
{
out.println(e.getMessage());
}

%>
			 
              <p>&nbsp;</p>
              <p><a href="KeyCSPMain.jsp">Back</a><span class="style10">
                <label for="name"></label>
                </span>
                <!-- end of center content -->
              </p>
            </div>
          </div>
          <p align="justify">&nbsp;</p>
        </div>
      </div>
      <div class="sidebar"><div class="searchform"><form id="formsearch" name="formsearch" method="post" action="#"><input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" />
            </span>
          </form>
        </div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="KeyCSPMain.jsp">Home</a></li>
            <li><a href="ViewFilesWithSecret.jsp">View  Files With Secret Key </a></li>
            <li><a href="ViewTransactions.jsp">View All Transaction </a></li>
            <li><a href="KeyCSPLogin.jsp">Logout</a></li>
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
