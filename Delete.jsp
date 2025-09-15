<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<%
int uid = Integer.parseInt(request.getParameter("usid"));
try {
		String msg="";
		String que="select * from cloudserver where id='"+uid+"'";
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(que);
		
		while(rs.next())
		{
			String user=rs.getString(9);
			String file=rs.getString(2);
			String pk=rs.getString(5);
			String task="Delete";
			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
		String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
				st.executeUpdate(strQuery2);
				
				
				
		String quer="delete from cloudserver where id='"+uid+"'";
		Statement st3=connection.createStatement();
		int rs3=st3.executeUpdate(quer);
		if(rs3==1)
		{
			msg="File Deleted Sucessfully";
			response.sendRedirect("DeleteFile.jsp");
			application.setAttribute("msg",msg);

		}
		else
		{
			msg="File Not Found";
			response.sendRedirect("DeleteFile.jsp");
			application.setAttribute("msg",msg);

		}
	  }
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%></body></html>
