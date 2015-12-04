<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>
<style>
ul {
    list-style-type: none;
    margin: 10px;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}

.hoverTable tr:first-child:hover {
    background-color: #E6E6FA;
}

.hoverTable tr:hover{
	background-color: blue;
	font-weight: bold;
}

th {
<!--This is the background of the header-->
	background-color: black;
<!--This is the color of the text in the header-->
    color: white;
}
</style>

</head>
<body bgcolor="#E6E6FA">

<ul>
  <li><a href="HelloWorld.jsp">Home</a></li>
  <li><a href="SeeChampions.jsp">Champion List</a></li>
  <li><a class="active" href="#seeusers">Users </a></li>
  <li><a href="stats.jsp">Statistics</a></li>
  
  
  <ul style="float:right;list-style-type:none;">
  <li><a href="contact.jsp">Contact</a></li>
  <li><a href="AboutPage.jsp">About</a></li>
  <li><a href="login.jsp">Login</a></li>
  </ul>
</ul>
<center>
<% 

	List<String> list = new ArrayList<String>();

	try {

	    	//Create a connection string
			//String url = "jdbc:mysql://your_VM:3306/your_db";
	    	String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		   //Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
		    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	    	//Get the selected radio button from the HelloWorld.jsp
		    //String entity = request.getParameter("command");
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM " + " users";
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    out.print("<table class=\"hoverTable\">");
		    
	    	   //make a row
		       out.print("<tr>");
	    	   //make a column
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<th align=\"center\">");
	    	   //print out column header
		       out.print("Champion");
		       out.print("</th>");
		       
		       //make a column
		       out.print("<th align=\"center\">");
		       out.print("Rank");   
		       out.print("</th>");
		    		   
		       //THIS IS ONE CELL
		       out.print("<th align=\"center\">");
		       out.print("Champion 1");
		       out.print("</th>");
		    		   
		       out.print("<th align=\"center\">");
		       out.print("Games Played 1");
		       out.print("</th>");
		       
		       out.print("<th align=\"center\">");
		       out.print("Champion 2");
		       out.print("</th>");
		       
		       out.print("<th align=\"center\">");
		       out.print("Games Played 2");
		       out.print("</th>");
		       
		       out.print("<th align=\"center\">");
		       out.print("Champion 3");
		       out.print("</th>");
		       
		       out.print("<th align=\"center\">");
		       out.print("Games Played 3");
		       out.print("</th>");
		       
		       out.print("</tr>");
		    
		    //parse out the results
		    while(result.next())
		    {
		       out.print("<tr>");
		       
		       out.print("<td align=\"center\">");
		       out.print(result.getString("name"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("rank"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("champ1"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("game1"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("champ2"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("game2"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("champ3"));
		       out.print("</td>");
		       
		       out.print("<td align=\"center\">");
		    	   out.print(result.getString("game3"));
		       out.print("</td>");
		  
		       
		       out.print("</tr>");
		      
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();

	} catch (Exception e) {
	}

	%>
</center>
</body>
</html>
