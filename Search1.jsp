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
      <div class="mainbar">
        <div class="article">
          <h2><span>Search File  :</span></h2>
          <p>&nbsp;</p>
          <table width="594" border="1" align="center">
            <tr>
              <td width="86" height="29"><div align="center"><span class="style15">File ID </span></div></td>
              <td width="204"><div align="center"><span class="style15">File Name </span></div></td>
              <td width="97"><div align="center"><span class="style15">Rank </span></div></td>
              <td width="210"><div align="center"><span class="style15">Download</span></div></td>
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    String user=(String)application.getAttribute("uname");
	String gname=(String)application.getAttribute("gname");
try 
  {
        
            String keyword = request.getParameter("t14").toLowerCase();
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
			
			String task1="Search";
			
			String strQuery21 ="insert into transaction(user,fname,task,dt) values('"+user+"','"+keyword+"','"+task1+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery21);
			
			
			String strQuery22 ="insert into search(user,keyword,dt) values('"+user+"','"+keyword+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery22);
				
				String query="select * from cloudserver where gname='"+gname+"'"; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(6);
					s4=rs.getString(3);
				
					c.init(Cipher.DECRYPT_MODE,key);
					String decryptedValue = new String(Base64.decode(s4.getBytes()));
					
					String decryptedValue1=decryptedValue.toLowerCase();
					
					if(decryptedValue1.contains(keyword))
					{
						String strQuery1 = "select * from cloudserver where fname='"+s2+"' ";
						ResultSet rs11 = connection.createStatement().executeQuery(strQuery1);
						{
							if(rs11.next()==true)
							{
								String rank=rs11.getString(6);
								int updaterank = Integer.parseInt(rank)+1;
								String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+s2+"'";
								connection.createStatement().executeUpdate(strQuery2);
							}
						}
			
			
			
						%>
			</tr>
						<tr>
						<td height="28"><div align="center"><%=i%></div></td>
						<td><div align="center"><%=s2%></div></td>
						<td><div align="center"><%=s3%></div></td>
						<td><div align="center"><a href="DownloadSearch.jsp?uid=<%=s2%>"> <%=s2%> </a></div></td>
						</tr>
						<%
					
					}
					else
					{ %>
									            <h2>File Not Found !!!</h2>

					<%}
					
			    }
			
			
				
				%>
         
            <br />

            <%  
			
			
			
			
			connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
          <p>&nbsp;</p>
          <p><a href="Search.jsp">Back</a></p>
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
            <li><a href="DataUserMain.jsp">Home</a></li>
			<li><a href="U_ViewAllFiles.jsp">View Files </a></li>
            <li><a href="RequestSecretKey.jsp">Request Secret Key </a></li>
            <li><a href="ViewSKResponse.jsp">View Secret Key Response </a></li>
            <li><a href="RequestDecryption.jsp">Request For Decryption</a></li>
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
