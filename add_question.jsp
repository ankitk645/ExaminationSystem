<%@ page import="java.sql.*" %>
<html>
<head>
     <title>Add_Qusetion</title>
</head>
<style>
.main{
  height: 65%;	
  width: 30%;
  border: 15px solid green;
  padding: 50px;
  margin: 20px;
}
textarea {
  width: 100%;
  padding: 12px 20px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  border: 1px solid;
  padding: 10px;
  box-shadow: 0px 10px 8px #888888;
  font: italic bold 15px sans-serif;
  }
input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  border: 1px solid;
  padding: 10px;
  box-shadow: 0px 10px 8px #888888;
  font: italic bold 15px sans-serif;
}
input[type=submit] {
  width: 100%;
  background-color: #56f441;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 20px;
}

.header {
  overflow: hidden;
  background-color: #42f4e2;
  padding: 15px 10px;
  font-size: 25px;
  font-weight: bold;
  font-color: 
}

</style>
<body>
	<b><% String url_data;
		url_data=request.getParameter("data");
		if("question_added_successfully".equals(url_data)){
			out.println(url_data);
		}
		else{
			out.println(" ");
		}
	   %></b>!
   <center>
   <div class="header">Add Question</div>
    <div class="main" >
	   <form action="queSubmit.jsp" method="POST" >
	        <textarea rows = "5" cols = "30" name = "ques" id="ques" placeholder="Add your question" required ></textarea><br>
		    <input type="text" id="op1" name="op1" placeholder="Option 1" required /><br>
		    <input type="text" id="op2" name="op2" placeholder="Option 2" required /><br>
			<input type="text" id="op3" name="op3" placeholder="Option 3" required /><br>
			<input type="text" id="op4" name="op4" placeholder="Option 3" required /><br>
	        <input type="text" id="op5" name="op5" placeholder="Correct Answer" required /><br>
			<input type="submit" value="Add Question" />							   
	   </form>
	   <b><a href="logout.jsp">click here to logout from admin page!</a></b>
	</div>
	</center>
</body>
</html>
