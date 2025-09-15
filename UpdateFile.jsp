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
.style10 {color: #504b4b}
.style7 {font-size: 16px}
.style9 {font-size: 11px}
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
          <li><a href="DataOwnerMain.jsp">Home</a></li>
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li class="active"><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin">Central Authority</a></li>
            <li><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
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
          <h2><span>Update File  :</span></h2>
          <div class="clr"></div>
          <div class="details">
            <div align="justify">
              <form action="DOAuthentication.jsp" method="post" id="leavereply">
                <span class="style10">
                <label for="name"><br />
                <br /></label></span>
                <table width="579" border="1" align="center">
                  <tr>
                    <td width="86" height="30"><div align="center" class="style21"><span class="style23">User ID </span></div></td>
                    <td width="168"><div align="center" class="style21"><span class="style23">File Name </span></div></td>
                    <td width="176"><div align="center" class="style21"><span class="style23">Data Owner </span></div></td>
                    <td width="176"><div align="center" class="style21"><span class="style23">Date &amp; Time </span></div></td>
                    <td width="176"><div align="center" class="style21"><span class="style23">Update</span></div></td>
                    <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	String downer=(String)application.getAttribute("dname");
	
	
try 
	{
        	String stat="No";
			String timestat="Yes";
      		String query="Select *from cloudserver where downer='"+downer+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(7);
					s4=rs.getString(9);

					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt = new String(Base64.decode(s3.getBytes()));
		
						%>
                  </tr>
                  <tr>
                    <td height="28"><div align="center"><%=i%></div></td>
                    <td><div align="center"><%=s2%></div></td>
                    <td><div align="center"><%=s4%></div></td>
                    <td><div align="center"><%=dt%></div></td>
                    <td><div align="center"><a href="update.jsp?usid=<%=i%>"><%=s2%></a></div></td>
	<%					
			 		
	  		}
           connection.close();
	  }
	 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
                  </tr>
                </table>
              </form>
              <p class="style7">
                <!-- end of center content -->
              <a href="index.html" class="style9"></a></p>
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
            <li><a href="DataOwnerMain.jsp">Home</a></li>
            <li><a href="Upload.jsp">Upload</a></li>
            <li><a href="DeleteFile.jsp">Delete File </a></li>
            <li><a href="ViewFile.jsp">View Files</a></li>
            <li><a href="DataOwnerLogin.jsp">Logout</a></li>
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
