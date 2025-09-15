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
          <li ><a href="DecryptionCSPMain.jsp">Home</a></li>
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
            <li><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
            <li class="active"><a href="DecryptionCSPLogin.jsp">Data Disseminator </a> </li>
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
          <h2><span>Provide Decryption Permission !! </span></h2>
          <div class="clr">
              <span class="style10"> </span>
              <div class="img"></div>
              <div class="post_content">
                <p align="justify">&nbsp;</p>
                <table width="567" border="1" align="center">
                  <tr>
                    <td width="64" height="30"><div align="center" class="style21"><span class="style23"> ID </span></div></td>
                    <td width="110"><div align="center" class="style21"><span class="style23">User Name </span></div></td>
                    <td width="113"><div align="center" class="style21"><span class="style23">Owner Name </span></div></td>
                    <td width="116"><div align="center" class="style21"><span class="style23">File Name </span></div></td>
                    <td width="171"><div align="center" class="style21"><span class="style23">Decrypt per </span></div></td>
			      </tr>
                    <%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

  	try 
	{
        
		  
		   String uname=(String)application.getAttribute("uname");
		   String requested="Requested";
		   String per="No";
		   
		   
      	   String query="select * from request where decrypt='"+requested+"'";
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
		   while(rs.next())
		   {
				i=rs.getInt(1);
				s2=rs.getString(2);
				s3=rs.getString(3);
				s4=rs.getString(4);
				s5=rs.getString(6);
				
		%>
              
                  <tr>
                    <td height="28"><div align="center" class="style21"><%=i%></div></td>
                    <td><div align="center" class="style21"><%=s2%></div></td>
                    <td><div align="center" class="style21"><%=s3%></div></td>
                    <td><div align="center" class="style21"><%=s4%></div></td>
                    <%	
			if(s5.equalsIgnoreCase("Requested"))
			{
			
		%>
                    <td><div class="style21">
                        <div align="center"><a href="DecryptPer.jsp?usid=<%=i%>"><%=s5%></a></div>
                    </div></td>
                    <%
		
			}else
			{
		%>
                    <td width="72"><div class="style21">
                        <div align="center"><%=s5%></div>
                    </div></td>
                  </tr>
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
                </table>
                <p align="justify"><a href="DecryptionCSPMain.jsp">Back</a></p>
              </div>
              <span class="style10">
              <label for="name"></label>
              </span>
          </div>
          <div class="details"><div align="justify"></div></div>
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
            <li><a href="DecryptionCSPMain.jsp">Home</a></li>
            <li><a href="ViewWithDecryptPerFiles.jsp">View All Files With Decrypted Permission </a></li>
            <li><a href="ViewWithoutDecryptPerFiles.jsp">View All Files Without Decrypt Permission </a></li>
            <li><a href="ProvideDecryptPermission.jsp">Provide Decrypt Permission </a></li>
            <li><a href="DecryptionCSPLogin.jsp">Logout</a></li>
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
