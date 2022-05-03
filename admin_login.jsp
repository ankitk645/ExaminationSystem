<html>
	<head>
		<title> LOGIN </title>
	</head>
<body>
<style>
.wrapper{
	width:auto;
	height:auto;
	border:0px solid black;
}
.header{
	height:50px;
	border:none;
}
.content{
	height:500px;
	width:400px;
	border:1px solid black;
	box-shadow:0px 8px 16px rgba(0,0,0,0.9);
	
}
.input{
	height:60px;
	margin-top:5px;
	margin-bottom:5px;
	width:300px;
	border:none;
	border-bottom:1px solid black;
	box-shadow:0px 8px 16px rgba(0,0,0,0.2);
}
</style>

	<div class="wrapper">
		<div class="header">
			<center><h1></h1></center>
		</div>
		<center>.
		<b><% String url_data;
		url_data=request.getParameter("data");
		if("question_added_successfully".equals(url_data)){
			out.println(url_data);
		}
		else{
			out.println(" ");
		}
	   %></b>!
		<div class="content" style="float:right;margin-right:30px;">
			<center><h1>
			<div > 
				<H3>ADMIN LOGIN<H3>
			<form action="admin_verify.jsp" method="post" id="form" >
				<table>
					<tr> <input class="input" type = "email" name="email" id="email" placeholder="Email" required /> <br/> </tr>
					<br>
					<tr> <input  class="input" "  type="password" name="pass" id="pass" placeholder="Password" required /> <br/> </tr>
					<br>
					<tr><input  style="height:50px;width:100px;"  type="submit" value="Login" ></tr>
					<br><br>
					<tr><a href="register.jsp"><label style="font-size:14">REGISTER NOW</label></a></tr>
					<br>
				</table>
				
		 
			</form>
	</div> </h1></center>
		</div>
		</center>
		
	</div>
</body>
</html>