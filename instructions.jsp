<%@page import="java.sql.*"%>
<%
String email = (String)session.getAttribute("semail");
if(email==null)
{
	response.sendRedirect("index.jsp?msg=Please_Login_First");
}
%>
<html>
<head>
<title>
	Instructions
</title>
<head>
<body>
<style>
body{
	margin:0;
	padding:0;
	background:url(images/login-background.jpg);
	background-size:cover;
	background-position:center;
	font-family:sans-serif;
	width:auto;
	height:600px;
	padding-top:50px;
}
.a{
	background-color:white;
	border:1px solid black;
	height:auto;
	width:800px;
	margin:20px 0px 0px 280px;
	opacity:0.8;
	padding:20px;
	
}
.button
{
	border:none;
	outline:none;
	height:40px;
	background:#ff3333;
	color:#fff;
	font-size:18px;
	margin-left:50px;
}
.button:hover
{
	cursor:pointer;
	background:#ff0000;
	color:#fff;
}
.logout{
	text-decoration:none;
	font-size:30px;
	color:#fff;
	border:none;
	padding:10px;
	background:#ff1a1a;
	position:relative;
	left:1180px;
	
}
.logout:hover{
	background:#e60000;
	color:#fff;
}
</style>
<a class="logout" href="logout.jsp">Logout</a>
<div class="a">
		<h1><center>Instructions</h1>
		<p>
		Read the following instructions carefully -
		<ul><b><u>Before starting the exam:</u></b>
			<li>Make sure you have a good internet connection.</li>
			<li>This test consist of 60 questions in total.</li>
			<li>The questions are of multiple type. </li>
			<li>Each question carry 4 marks.</li>
			<li>There is no negative marking.</li>
		</ul>
		<ul><b><u>During the exam:</u></b>
			    <li>The student may not use his or her textbook, course notes, or receive help from a proctor or any other outside source.</li>
				<li>Students must complete the questions within the time frame allotted for the exam.</li>
				<li>Students must not stop the session and then return to it. </li>
				<li>Do not resize the screen during test.</li>
				<li>Save your test using the 'save' button periodically during exam.</li>
		</ul>
		         To continue,click the button
				<a href="questions.jsp?q_no=1"><button class="button" type="button" name="submit" value="Continue">Start test</button></a>
		</p>
	</div>
	
</body>
</html>