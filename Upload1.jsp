<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
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
.style14 {color: #0e4369; font-size: 16px; font-weight: bold; }
.style16 {font-size: 12px}
.style28 {color: #5f5f5f}
.style13 {	font-size: 12px;
	color: #504b4b;
}
.style30 {	font-size: 14px;
	color: #504b4b;
}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>
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
          <h2><span>Encrypted  :</span></h2>
          <div class="clr"></div>
          <div class="details">
            <div align="justify">
              <div class="col_w450 float_l">
                <div class="wwd_box">
                  <div align="justify">
                    <div class="box">
                      <form action="Upload2.jsp" method="post">
                        <p>
                          <%
      	try {
      		String file=request.getParameter("tt");
			application.setAttribute("file1",file);
      		String cont=request.getParameter("text");
			String dname=(String)application.getAttribute("dname");

      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
			String namefile=request.getRealPath("file");
			
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));


      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
%>
                        </p>
                        <table width="545" border="0" align="center">
                          <tr>
                            <td width="210"><span class="odd style13"><strong>File Name : </strong> </span></td>
                            <td width="319"><input name="t42" type="text" id="t42" size="49" value="<%= file %>" readonly="readonly" /></td>
                          </tr>
                          
                          <tr>
                            <td>&nbsp;</td>
                            <td><textarea name="text2" cols="50" rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
                          </tr>
                          <tr>
                            <td><span class="odd style13"><strong>Trapdoor : </strong></span></td>
                            <td><input name="t4" type="text" id="t4" size="49" value="<%= h1 %>" readonly="readonly" /></td>
                          </tr>
                          <tr>
                            <td><div align="right"> </div></td>
                            <td><input type="submit" name="Submit2" value="Upload" /></td>
                          </tr>
                        </table>
                        <p>
                          <%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
                        </p>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <p class="style7">
                <!-- end of center content -->
              <a href="index.html" class="style9"></a></p>
            </div>
          </div>
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
            <li><a href="DataOwnerMain.jsp">Home</a></li>
            <li><a href="UpdateFile.jsp">Update File </a></li>
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
