<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
          <li ><a href="index.html">Home</a></li>
            <li class="active"><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
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
          <h2><span>Data User Login :  </span></h2>
          <div class="box">
            <form action="DURegister.jsp" method="post" id="" enctype="multipart/form-data">
              <label for="name"><br />
              User Name (required)<br />
              </label>
              <p>
                <input id="name" name="userid" class="text" />
              </p>
              <label for="password">Password (required)<br />
              </label>
              <p>
                <input type="password" id="password" name="pass" class="text" />
              </p>
              <label for="email">Email Address (required)<br />
              </label>
              <p>
                <input id="email" name="email" class="text" />
              </p>
              <label for="mobile">Mobile Number (required)<br />
              </label>
              <p>
                <input id="mobile" name="mobile" class="text" />
              </p>
              <label for="address">Your Address<br />
              </label>
              <p>
                <textarea name="address" cols="50" id="address"></textarea>
              </p>
              <label for="dob">Date of Birth (required)<br />
              </label>
              <p>
                <input id="dob" name="dob" class="text" />
              </p>
              <label for="gender">Select Gender (required)<br />
              </label>
              <p>
                <select id="s1" name="gender" style="width:480px;" class="text">
                  <option>-Select-</option>
                  <option>Male</option>
                  <option>Female</option>
                </select>
              </p>
              <label for="pincode">Enter Pincode (required)<br />
              </label>
              <p>
                <input id="pincode" name="pincode" class="text" />
              </p>
              <label for="location">Enter Location (required)<br />
              </label>
              <p>
                <input id="loc" name="location" class="text" />
              </p>
              <label for="pic">Select Profile Picture (required)<br />
              </label>
              <p>
                <input type="file" id="pic" name="pic" class="text" />
              </p>
			   <span class="style16"><strong>
              <label for="pic">Select Your Group</label>
              </span>
              </p>
              <p class="style10">
                <select name="gname">
                  <option>Sports</option>
                  <option>Entertainment </option>
                  <option>Politics</option>
                </select>
              </p>
			  
			  
			  
              <p>
                <input name="submit" type="submit" value="REGISTER" />
              </p>
            </form>
          </div>
          <p align="justify"><a href="DataUserLogin.jsp" class="style9">Back</a></p>
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
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
            <li><a href="StorageCSPLogin.jsp">Cloud Service Provider</a></li>
            <li><a href="DecryptionCSPLogin.jsp">Data Disseminator </a> </li>
            <li><a href="KeyCSPLogin.jsp">Private Key Generator </a></li>
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
