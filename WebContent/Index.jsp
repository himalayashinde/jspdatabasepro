<%@page import="java.sql.*,java.util.*"%>




<form method="post" action="Index.jsp">
Roll_no:<br>
<input type="text" name="Roll_no">
<br>
Name:<br>
<input type="text" name="Name">
<br>
Address:<br>
<input type="text" name="Address">
<br>
<input type="submit" value="submit">
</form>


<%
String Roll_no = request.getParameter("Roll_no");
String Name = request.getParameter("Name");
String Address = request.getParameter("Address");

String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "alm";
String userId = "root";
String password = "root";
int flag=1;
int mark=1;

try {
Class.forName(driverName);
}
catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>





<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr >
<td><b>Roll_No</b></td>
<td><b>Name</b></td>
<td><b>Address</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

/*
while(flag==1 )
{
	flag++;
out.println("Inside first while loop");
String sql ="SELECT * FROM student";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr >

<td><%=resultSet.getString("roll_no") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("address") %></td>

</tr>

<% 
	}
}//while close
*/

//-----
int i= statement.executeUpdate("insert into student(Roll_no,Name,Address)values('"+Roll_no+"','"+Name+"','"+Address+"')");
out.println("Data is successfully inserted!");

while(flag==1 )
{
String sql1 ="SELECT * FROM student";

resultSet = statement.executeQuery(sql1);
while(resultSet.next()){
%>
<tr >

<td><%=resultSet.getString("roll_no") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("address") %></td>

</tr>

<% 

	}
//out.println("closure of the flag while loop reached..");
flag++;
break;
}//while close


} catch (Exception e) {
e.printStackTrace();
}
%>
</table>