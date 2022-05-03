<%@page import="java.sql.*"%>
<%
String email = (String)session.getAttribute("semail");
if(email!=null)
{
	response.sendRedirect("instructions.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<body>

<style>
body{
	margin:0;
	padding:0;
	background:url(images/login-background.jpg);
	background-size:cover;
	background-position:center;
	font-family:sans-serif;
	width:400px;
	height:600px;
	
}
.d1{
	width:400px;
	height:450px;
	background:#000;
	background-color:#0105178c;
	box-shadow: 0 0px 15px 4px #000;
	color:#fff;
	top:50%;
	left:50%;
	position:absolute;
	transform:translate(-50%,-50%);
	box-sizing:border-box;
	padding:70px 30px;
}
.logo1{
	width:100px;
	height:100px;
	border-radius:50%;
	position:absolute;
	top:-50px;
	left:150px;
}
h1{
	margin-top:2px;
	padding:0;
	text-align:center;
	font-size:22px;
	
}
.d1 p{
	margin:0;
	padding:0;
	font-weight:bold;
	
}
.d1 input{
	width:100%;
	margin-bottom:20px;
}
.d1 input[type="email"], input[type="password"]
{
	border:none;
	border-bottom:1px solid #fff;
	background:transparent;
	outline:none;
	height:30px;
	color:#fff;
	font-size:16px;
}
.d1 input[type="Submit"]
{
	border:none;
	outline:none;
	height:40px;
	background:#ff1a1a;
	color:#fff;
	font-size:18px;
}
.d1 input[type="submit"]:hover{
	cursor:pointer;
	background:red;
	color:#000;
}
.d1 a{
	text-decoration:none;
	font-size:12px;
	color:Darkgray;
	
}
.d1 a:hover{
	color:#ffc107;
}

</style>
<%
	String msg = request.getParameter("msg");
	if (msg!=null)
	{
		out.print("<script>alert('"+msg+"');</script>");
	}
%>

	<div class="d1">
		<img src="images/logo.png" class="logo1">
			<h1><u>Login</u></h1>
				
			<form action="start.jsp" method="post" id="form">
				<p>Username</p>
					<input type="email" name="email" placeholder="Enter Username" id="email"; required />
				<p>Password</p>
					<input type="password" name="pass" placeholder="Enter Password" id="pass" required />
					
				
					<span id='message'></span>
				<input class="btn" type="Submit" name="" value="Login" /></a>
						<a href="#">Forget Password?</a><br>
							<a href="registration.jsp">Don't have an Account?</a>
			</form>
	</div>
</body>
</head>
</html>