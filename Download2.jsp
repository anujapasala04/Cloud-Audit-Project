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
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
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
          <h2><span class="style2">Download File </span>: </h2>
          <p>
            <%
		  	
			try 
			{
		  		String file = request.getParameter("t1");
				String trapdoor=request.getParameter("t12");
				String sk=request.getParameter("t13");
				String ct="";
				String user=(String) application.getAttribute("uname");
				String strQuery1 = "select * from cloudserver where fname='"+file+"'";
				String strQuery2 = "select * from cloudserver where fname='"+file+"' and  trapdoor='"+trapdoor+"'";
				String strQuery3 = "select * from request where fname='"+file+"' and sk='"+sk+"'";
				
				
				
					ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
					if(rs1.next()==true)
					{
							ResultSet rs2 = connection.createStatement().executeQuery(strQuery2);
							if(rs2.next()==true)
							{
								ct=rs2.getString(3);

									ResultSet rs3 = connection.createStatement().executeQuery(strQuery3);
									if(rs3.next()==true)
									{
									
								
									
										String rank=rs2.getString(6);
										
										int updaterank = Integer.parseInt(rank)+1;
										String strQuer = "update cloudserver set rank='"+updaterank+"' where fname='"+file+"'";
										connection.createStatement().executeUpdate(strQuer);
										
										SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
										Date now = new Date();
					
										String strDate = sdfDate.format(now);
										String strTime = sdfTime.format(now);
										String dt = strDate + "   " + strTime;	
										
										
										String task="Download";
										String Query2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+sk+"','"+task+"','"+dt+"')";
										connection.createStatement().executeUpdate(Query2);
										
										
										String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue1 = keys.getBytes();
										Key key1 = new SecretKeySpec(keyValue1,"AES");
										Cipher c1 = Cipher.getInstance("AES");
										c1.init(Cipher.DECRYPT_MODE, key1);
										String decryptedValue = new String(Base64.decode(ct.getBytes()));
										%>
		  </p>
										<p align="center" class="style4">File Contents</p>
										<label>
										<div align="center">
										<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
										<br/>
										<br/>
										<td><button onclick="saveTextAsFile()">Download</button></td>
										</div>
										</label>
										<p align="center">&nbsp; </p>
										<p>
										<%	
									}
									else
									{
										SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				
										Date now = new Date();
						
										String strDate = sdfDate.format(now);
										String strTime = sdfTime.format(now);
										String dt = strDate + "   " + strTime;
								
										String str="SecretKey";
										
										
										String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','"+str+"')";
										connection.createStatement().executeUpdate(strQuer1);
								
										%>
										</p>
										<p> </p>
										<h1 class="style4">Secret Key Mismatch !!!</h1>
										</p>
										<br />
										<p><a href="Download.jsp">Back</a></p>
										<%
									}
							}
							else
							{
								SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
								SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
								Date now = new Date();
				
								String strDate = sdfDate.format(now);
								String strTime = sdfTime.format(now);
								String dt = strDate + "   " + strTime;
						
								String type="Trapdoor";


								String strQuer2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','"+type+"')";
								connection.createStatement().executeUpdate(strQuer2);
						
								%>
								</p>
								<p> </p>
								<h1 class="style4">Trapdoor Mismatch !!!</h1>
								</p>
								<br />
								<p><a href="Download.jsp">Back</a></p>
								<%
							}
					}
					else
					{
		
						%>
						</p>
						<p> </p>
						<h1 class="style4">File Doesn't Exist !!!</h1>
						</p>
						<br />
						<p><a href="Download.jsp">Back</a></p>
						<%
					}
        	connection.close();
	  } 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
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
            <li><a href="RequestDecryption.jsp">Request For Decryption </a></li>
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
