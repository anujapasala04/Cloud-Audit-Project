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
.style22 {font-size: 14px; font-weight: bold; }
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
          <li><a href="StorageCSPMain.jsp">Home</a></li>
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
            <li  class="active"><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
            <li><a href="DecryptionCSPLogin.jsp">Data Disseminator </a> </li>
            <li><a href="KeyCSPLogin.jsp">Private Key Generator</a></li>>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>View All Transactions !! </span></h2>
          <div class="clr"></div>
          <div class="details">
            <div align="justify">
              <p>&nbsp;</p>
              <table width="602" border="1" align="center">
                <tr>
                  <td width="104" height="31"><div align="center" class="style22">User ID </div></td>
                  <td width="124"><div align="center" class="style22">User Name </div></td>
                  <td width="108"><div align="center" class="style22">File Name </div></td>
                  <td width="171"><div align="center" class="style22">Task</div></td>
                  <td width="110"><div align="center" class="style22">Date &amp; Time</div></td>
                </tr>
                <%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 
      		
      		String query="select * from Transaction "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s3=rs.getString(2);
		s4=rs.getString(3);
		s5=rs.getString(5);
		s6=rs.getString(6);
		
	
		%>
                <tr>
                  <td height="29"><div align="center"><%=i%></div></td>
                  <td><div align="center"><%=s3%></div></td>
                  <td><div align="center"><%=s4%></div></td>
                  <td><div align="center"><%=s5%></div></td>
                  <td><div align="center"><%=s6%></div></td>
                </tr>
                <%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
              </table>
              <p>&nbsp;</p>
              <p><a href="StorageCSPMain.jsp">Back</a><span class="style10">
                <label for="name"></label>
              </span></p>
              <p class="style7">
                  <!-- end of center content -->
                <a href="index.html" class="style9"></a></p>
            </div></div>
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
            <li><a href="StorageCSPMain.jsp">Home</a></li>
            <li><a href="ViewAllFiles.jsp">View All Files </a></li>
            <li><a href="ViewAttackers.jsp">View Attackers </a></li>
            <li><a href="ViewWithSK.jsp">View Files With SecretKey </a></li>
            <li><a href="ViewWithoutSK.jsp">View Files Without SecretKey </a></li>
            <li><a href="ViewWithD.jsp">View Files With Decrypted Options </a></li>
            <li><a href="ViewWithoutD.jsp">View Files Without Decryption Options </a></li>
            <li><a href="StorageCSPLogin.jsp">Logout</a></li>
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
