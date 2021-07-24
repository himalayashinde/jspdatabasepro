<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<title>Export database value to excel</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >

<script type="text/javascript">
function exportToExcel(tableID, filename = ''){
    var downloadurl;
    var dataFileType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTMLData = tableSelect.outerHTML.replace(/ /g, '%20').replace(/#/g, '%23');
    
    // Specify file name
    filename = filename?filename+'.xlsx':'export_excel_data.xlsx';
    
    // Create download link element
    downloadurl = document.createElement("a");
    
    document.body.appendChild(downloadurl);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTMLData], {
            type: dataFileType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadurl.href = 'data:' + dataFileType + ', ' + tableHTMLData;
    
        // Setting the file name
        downloadurl.download = filename;
        
        //triggering the function
        downloadurl.click();
    }
}
 
</script>

</head>



<body>
<!-- <form method="post" action="index.jsp">
Name:<br>
<input type="text" name="name">
<br>
Email:<br>
<input type="text" name="email">
<br>
Age:<br>
<input type="text" name="age">

Mobile:<br>
<input type="text" name="Mobile">
<br>
<input type="submit" value="submit">
</form>
 -->
<button onclick="exportToExcel('tblexportData', 'user-data')" class="btn btn-success">Export Table Data To Excel File</button>

<%
/* String name = request.getParameter("name");
String email = request.getParameter("email");
String age = request.getParameter("age");
String Mobile = request.getParameter("Mobile");
 */
 String driverName = "com.mysql.cj.jdbc.Driver"; // com.mysql.jdbc.Driver
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "person";
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
<table align="center" cellpadding="5" cellspacing="5" border="1" id="tblexportData" class="table">
<tr>

</tr>
<tr >
<td><b>Name</b></td>
<td><b>Email</b></td>
<td><b>Age</b></td>
<td><b>Mobile</b></td>
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
String sql ="SELECT * FROM person";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr >
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("Mobile") %></td>
</tr>
<% 
	}
}//while close
*/
//-----
//int i= statement.executeUpdate("insert into person(name,email,age,Mobile)values('"+name+"','"+email+"','"+age+"','"+Mobile+"')");
out.println("Data is Fetched Successfully!");
while(flag==1 )
{
String sql1 ="SELECT * FROM person";
resultSet = statement.executeQuery(sql1);
while(resultSet.next()){
%>
<tr >

<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("Mobile") %></td>
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



</body>
</html>