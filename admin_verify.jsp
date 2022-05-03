<%@page import="java.sql.*"%>

<%
String email1=request.getParameter("email");
String pass1=request.getParameter("pass");
try{ Connection conn=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");

	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","exam","exam");
	PreparedStatement ps = conn.prepareStatement("select * from stu_reg where email='"+email1+"'and password='"+pass1+"'");
	int x=ps.executeUpdate();
	if(x!=0){
		response.sendRedirect("add_question.jsp");;
	}
	else{
		response.sendRedirect("admin_login.jsp?data=question_added_successfully");
	}
	conn.close();
}catch(Exception e){
	out.println(e);
}

%>