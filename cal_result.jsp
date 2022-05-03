<%@page import="java.sql.*"%>
<%
String email = (String)session.getAttribute("semail");
if(email==null)
{
	response.sendRedirect("index.jsp?msg=Please_Login_First");
}
%>
<%
	int stu_id=0;
	String ques_id;
	int q_id;
	int q_no;
	String u_ans=null;
	int right=0;
	int wrong=0;
	int total=0;
	String[] correct_answers=new String[100];
	String[] user_answers=new String[100];
		
	%>
<%
Connection conn1=null;
			ResultSet rs1=null;
				Class.forName("oracle.jdbc.driver.OracleDriver");
			conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","exam","exam");
			PreparedStatement ps1 = conn1.prepareStatement("select * from stu_reg where email=?");
			ps1.setString(1,email);
			rs1=ps1.executeQuery();
			
			while(rs1.next()){
				stu_id=rs1.getInt(1);
			}
			conn1.close();
%>
<html>
	<head>
		<title>Result</title>
	</head>
	<body>
	
<style>
	body{
	color:#fff;
	background:url(images/login-background.jpg);
	background-size:cover;
	background-position:center;
	font-family:sans-serif;
	width:auto;
	height:600px;
	padding-top:50px;
}
.box{
	width:700px;
	height:450px;
	background:#000;
	background-color:#0105178c;
	box-shadow: 0 0px 15px 4px #000;
	color:#fff;
	padding-top:40px;
	padding-left:30px;
	top:55%;
	left:50%;
	position:absolute;
	transform:translate(-50%,-50%);
	box-sizing:border-box;
	
}
	.home{
		position:absolute;
		top:3%;
		right:27%;
		margin:5px;
		height:8%;
		color:#fff;
		text-align:center;
		width:10%;
		background:#0088cc;
		transition:0.5s;
		transparent:0.5px;
	}
	.home:hover{
		transition:0.5s;
		background:#0077b3;
	}
	.logout{
		position:absolute;
		right:5%;
		top:3%;
		margin:5px;
		height:8%;
		width:10%;
		color:#fff;
		text-align:center;
		background:#ff471a;
		transition:0.5s;
	}
	.logout:hover{
		transition:0.5s;
		background:#e62e00;
	}
	.contact-us{
		position:absolute;
		right:16%;
		margin:5px;
		top:3%;
		height:8%;
		color:#fff;
		text-align:center;
		width:10%;
		background:#0088cc
	}
	.contact-us:hover{
		transition:0.5s;
		background:#0077b3;
	}
	.center-bar{
		box-shadow:0px 8px 16px rgba(0,0,0,0.9);
		position:absolute; 
		top:20%;
		left:25%;
		width:50%;
		height:75%;
	}
	.correct_answers{
		width:250px;
		margin-left:50px;
		position:absolute;
	}
	.user_answers{
		width:250px;
		margin-left:320px;
		position:relative;
	}
	
</style>
	<div class="headline">
		<a href="profile.jsp">
			<div class="home">
				<h3>Profile</h3>
			</div>
		</a>
		<a href="#">
			<div class="contact-us">
			<h3>Contact Us</h3>
			</div>
		</a>
		<a href="logout.jsp">
		<div class="logout">
			<h3>Logout</h3>
		</div>
		</a>
		
	</div>
	<div class="box">
	<%
		try{
			Connection conn2=null;
			ResultSet rs2 = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","exam","exam");
			PreparedStatement ps2 = conn2.prepareStatement("Select * from questions");
			rs2=ps2.executeQuery();
			while(rs2.next())
			{
				q_no = rs2.getInt("q_id");
				correct_answers[q_no]=rs2.getString("correct");
			}
			conn2.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}
	
	
		try{
			Connection conn=null;
			ResultSet rs = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","exam","exam");
			PreparedStatement ps = conn.prepareStatement("Select * from user_answers where stu_id=?");
			ps.setInt(1,stu_id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ques_id = rs.getString("q_id");
				q_id = Integer.parseInt(ques_id);
				u_ans = rs.getString("answer");
				
				user_answers[q_id]=u_ans;
				
				if(u_ans.equals(correct_answers[q_id]))
				{
					right = right + 1;
				}
				
			}
			conn.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}


		try{
			Connection conn3=null;
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","exam","exam");
			PreparedStatement ps3 = conn3.prepareStatement("insert into result values(?,?)");
			ps3.setInt(1,stu_id);
			ps3.setInt(2,right);
			int x=ps3.executeUpdate();
			if(x!=0){
				out.println("Result Updated Successfully");
			}
			else{
				out.println("Result can't be updated");
			}
			conn3.close();
		}catch(Exception e){
			out.println("Your Result was Already Submitted");
		}

%>
		<h1 style="text-align:center;">Result is as follows</h1>
		<div class="correct_answers">
		Correct answers were as follows: <br>
		<%
		int loop=1;
		while(loop<=6)
		{
			out.print(loop+" . "); 
			out.print(correct_answers[loop]);%><br><%
			loop++;
		}
		%>
		</div>
		<div class="user_answers">
		Your Answers were as follows: <br>
		<%
		loop=1;
		while(loop<=6)
		{
			out.print(loop+" . "); 
			if(user_answers[loop]!=null)
			{
				out.print(user_answers[loop]);%><br><%
			}
			else
			{
				out.print(" &nbsp&nbsp&nbsp&nbsp&nbsp - ");%><br><%
			}
			loop++;
		}
		%>
		</div>
		<div style="margin-left:50px;">
			<h3><table>
				<tr>
					<td><h3>Total Question:6</h3></td>
					<td><h3>Total Marks: 24</h3></td>
				</tr>
				<tr>
					<td><h3>Correct Answers: <%=right%></h3></td>
					<td><h3>Wrong Answers: <%=6-right%></h3></td>
				</tr>
				<tr>
					<td><h2>Marks Obtained: <%=right*4%></h2></td>
				</tr>
			</table>
		</div>
	</div>
		
	</body>
</html>

