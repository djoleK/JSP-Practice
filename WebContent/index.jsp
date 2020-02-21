<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="sql.DbConnectionSingleton"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page</title>
</head>
<body>
	<a>Ovo je Djoletov JSP Scriplet.</a>
	<br>
	<h2 align="center">
		<font><strong>Retrieve authors from database in jsp</strong></font>
	</h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>id</b></td>
			<td><b>first_name</b></td>
			<td><b>last_name</b></td>
		</tr>
		<%
			try {
				DbConnectionSingleton connectionSingleton = DbConnectionSingleton.getInstance();
				Statement statement = connectionSingleton.getConnection().createStatement();
				String sql = "SELECT * FROM library3.authors;";
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
					<tr bgcolor="#DEB887">
						<td><%=resultSet.getString("id")%></td>
						<td><%=resultSet.getString("first_name")%></td>
						<td><%=resultSet.getString("last_name")%></td>
					</tr>
		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>