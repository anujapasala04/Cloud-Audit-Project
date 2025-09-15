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
.style10 {color: #504b4b}
.style15 {color: #FF0000; font-weight: bold; }
.style16 {color: #FF0000}
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
          <li><a href="index.html">Home</a></li>
            <li><a href="DataUserLogin.jsp">Data User </a></li>
            <li class="active"><a href="DataOwnerLogin.jsp">Data Owner </a></li>
            <li><a href="TrustedAuthorityLogin.jsp">Central Authority</a></li>
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
          <h2><span>Data Owner Register : </span></h2>
          <div class="clr"></div>
          <div class="box">
            <form action="DORegister.jsp" method="post" id="" enctype="multipart/form-data">
              <label for="name"><span class="style10"><br />
              <span class="style16"><strong>Data Owner  Name (required)<br />
              </strong></span></span></label>
              <p class="style16"><strong>
                <input id="name" name="userid" placeholder="data owner name" class="text" />
              </strong></p>
              <p class="style16"><strong>
                <label for="password">Password (required)<br />
                </label>
                <input type="password" id="password" name="pass" placeholder="password"class="text" />
                              </strong></p>
              <p class="style15">
                <label for="email">Email Address (required)<br />
                </label>
                <input id="email" name="email" placeholder="test@gmail.com"class="text" />
                            </p>
              <p class="style15">
                <label for="mobile">Mobile Number (required)<br />
                </label>
                <input id="mobile" name="mobile" placeholder="mobile number"class="text" />
                            </p>
              <p class="style15">
                <label for="address">Your Address<br />
                </label>
                <textarea name="address" cols="50" placeholder="address"id="address"></textarea>
                            </p>
              <p class="style15">
                <label for="dob">Date of Birth (required)<br />
                </label>
                <input id="dob" name="dob" placeholder="dob"class="text" />
                            </p>
              <p class="style15">
                <label for="gender">Select Gender (required)<br />
                </label>
                <select id="s1" name="gender" class="text">
                  <option>-Select-</option>
                  <option>Male</option>
                  <option>Female</option>
                </select>
                            </p>
              <p class="style15">
                <label for="pincode">Enter Pincode (required)<br />
                </label>
                <input id="pincode" name="pincode"placeholder="pin code" class="text" />
                            </p>
              <p class="style15">
                <label for="location">Enter Location (required)<br />
                </label>
                <input id="loc" name="location" placeholder="location" class="text" />
                            </p>
              <p class="style15">
                <label for="pic">Select Profile Picture (required)</label>
              </p>
              <p class="style15">
                <input type="file" id="pic" name="pic" class="text" />
              </p>
			  
			   <span class="style16"><strong>
              <label for="pic">Select Your Group</label>
              </span>
              </p>
                </strong></span>
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
            <p><a href="DataOwnerLogin.jsp">Back</a> <a href="index.html">Home</a></p>
            <div class="buttons"> </div>
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
