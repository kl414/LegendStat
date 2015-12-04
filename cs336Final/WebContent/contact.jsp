<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Information</title>
<style>
ul {
    list-style-type: none;
    margin: 10px;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}

.hoverTable tr:first-child:hover {
    background-color: #E6E6FA;
}

.hoverTable tr:hover{
	background-color: blue;
	font-weight: bold;
}

th {
<!--This is the background of the header-->
	background-color: black;
<!--This is the color of the text in the header-->
    color: white;
}
</style>

</head>
<body bgcolor="#E6E6FA">

<ul>
  <li><a href="HelloWorld.jsp">Home</a></li>
  <li><a href="SeeChampions.jsp">Champion List</a></li>
  <li><a href="SeeUsers.jsp">Users </a></li>
  <li><a href="stats.jsp">Statistics </a></li>
  
  <ul style="float:right;list-style-type:none;">
  <li><a class="active" href="#contact">Contact</a></li>
  <li><a href="AboutPage.jsp">About</a></li>
  <li><a href="login.jsp">Login</a></li>
  </ul>
</ul>

<center>

<p><b>Hope you're having fun browsing!</b> </p>
<p> <b> If you want to contact us about comments or suggestions please use the email below</b></p>
<p> <b> cheungbaby123@gmail.com</b><p>

<br>

<img src="league-of-legends-logo.jpg" alt="Homepage Logo" style="width:304px;height:228px;">


</center> 

</body>
</html>