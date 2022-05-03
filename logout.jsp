<%
	session.invalidate();
	response.sendRedirect("index.jsp?msg=logged-out-successfully");
%>
<html>
<body>
session destroyed .</br>
<a href="index.jsp">click here to login again!</a>
</body>
</html>