<%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
<%@ include file="connect.jsp" %>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style3 {color: #FFFFFF}
-->
</style>
<body>
<p>
  <%

int uid = Integer.parseInt(request.getParameter("usid"));

try 
{

String fname=(String)application.getAttribute("fnam");
KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA"); 
Cipher encoder = Cipher.getInstance("RSA"); 
KeyPair kp = kg.generateKeyPair(); 
PublicKey pubKey = kp.getPublic(); 
// RSA produces 1024 bits Key
byte[] pub = pubKey.getEncoded();
String s = pub.toString();


Statement st1 = connection.createStatement();

String query1 ="update request set sk='"+s+"' where id='"+uid+"' ";
st1.executeUpdate (query1);
connection.close();




}
catch(Exception e)
{
out.println(e.getMessage());
}

%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form name="form1" method="post" action="GenerateSecretKey2.jsp">
  <table width="457" border="0" align="center">
    <tr>
      <td width="212" height="72" bgcolor="#FF0000"><span class="style3">Request ID </span></td>
      <td width="229" bgcolor="#FF0000"><input name="id" type="text" value="<%=uid%>"></td>
    </tr>
    <tr>
      <td height="63" bgcolor="#FF0000"><span class="style1">Enter Time Token </span></td>
      <td bgcolor="#FF0000"><input name="tt" type="text"></td>
    </tr>
    <tr>
      <td colspan="2"><p>&nbsp;</p>
      <p align="center">
        <input type="submit" name="Submit" value="Assign Time Token">
      </p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>
</body></html>