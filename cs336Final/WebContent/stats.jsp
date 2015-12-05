<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
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
    font-weight: normal;
}

.hoverTable tr:nth-child(2):hover {
    background-color: #E6E6FA;
    font-weight: normal;
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
  <li><a href="SeeUsers.jsp">Users </a></li>
  <li><a class="active" href="#stats">Statistics</a></li>
  
  
  <ul style="float:right;list-style-type:none;">
  <li><a href="contact.jsp">Contact</a></li>
  <li><a href="AboutPage.jsp">About</a></li>
  <li><a href="login.jsp">Login</a></li>
  </ul>
</ul>
<center>

<% 
	List<String> top10 = new ArrayList<String>();
	List<String> toAD = new ArrayList<String>();
	List<String> topAP = new ArrayList<String>();
	List<String> topWinRte = new ArrayList<String>();


	try {

	    	//Create a connection string
			//String url = "jdbc:mysql://your_VM:3306/your_db";
	    	String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
		    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();

		    String top10query = "SELECT * FROM LeagueStat.champs ORDER BY usersPlay Desc LIMIT 10";

	    	//Run the query against the database.
		    ResultSet top10result = stmt.executeQuery(top10query);
   	
		    //Make an HTML table to show the results in:
		    out.print("<table class=\"hoverTable\">");
		    

		       out.print("<tr>");
		       out.print("<th COLSPAN=5 >");
		       out.print("Top 10 Most Played Champions");
		       out.print("<th>");
		       out.print("</tr>");

	    	
	    	   //make a row
		       out.print("<tr align=\"center\">");
	    	   //make a column
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Rank");
		       out.print("</td>");
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Champion");
		       out.print("</td>");
		       
		       //make a column
		       out.print("<td>");
		       out.print("Lane Position");   
		       out.print("</td>");
		    		   
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Offense Type");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("Win Rate");
		       out.print("</td>");
		       
		       out.print("</tr>");
		    
		       int count = 1;
		    //parse out the results
		    while(top10result.next())
		    {
		    	
		       //make a row
		       out.print("<tr align=\"center\">");
		       
		       out.print("<td>");
		       out.print(count);
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print(top10result.getString("name"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print(top10result.getString("position"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(top10result.getString("type"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(top10result.getString("winRate"));
		       out.print("</td>");
		       
		       out.print("</tr>");
		       count++;
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();

	} catch (Exception e) {
	}

	out.print("<br>");
	
	try{
		//Create a connection string
		//String url = "jdbc:mysql://your_VM:3306/your_db";
    	String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
    
    	//Create a connection to your DB
	   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
	    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");
    	//Create a SQL statement
	    Statement stmt = con.createStatement();
		
	String topADquery = "SELECT * FROM LeagueStat.champs WHERE Type = \"AD\" ORDER BY usersPlay Desc LIMIT 10";

    ResultSet topADresult = stmt.executeQuery(topADquery);

   //Make an HTML table to show the results in:
		    out.print("<table class=\"hoverTable\">");
		    
		    out.print("<tr>");
		       out.print("<th COLSPAN=5 >");
		       out.print("Top 10 Most Played AD Champions");
		       out.print("<th>");
		       out.print("</tr>");
    
	    	   //make a row
		       out.print("<tr align=\"center\">");
	    	   //make a column
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Rank");
		       out.print("</td>");
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Champion");
		       out.print("</td>");
		       
		       //make a column
		       out.print("<td>");
		       out.print("Lane Position");   
		       out.print("</td>");
		    		   
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Offense Type");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("Win Rate");
		       out.print("</td>");
		       
		       out.print("</tr>");
		    
		       int count = 1;
		    //parse out the results
		  
		    while(topADresult.next())
		    {
		    	
		    	
		       //make a row
		       out.print("<tr align=\"center\">");
		       
		       out.print("<td>");
		       out.print(count);
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print(topADresult.getString("name"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topADresult.getString("position"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topADresult.getString("type"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topADresult.getString("winRate"));
		       out.print("</td>");
		       
		       out.print("</tr>");
		      count++;
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();
		    
	}
	catch (Exception e) {
	}
	
	out.print("<br>");
	
	try{
		//Create a connection string
		//String url = "jdbc:mysql://your_VM:3306/your_db";
    	String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
    
    	//Create a connection to your DB
	   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
	    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");
    	//Create a SQL statement
	    Statement stmt = con.createStatement();
		
	String topAPquery = "SELECT * FROM LeagueStat.champs WHERE Type = \"AP\" ORDER BY usersPlay Desc LIMIT 10";

    ResultSet topAPresult = stmt.executeQuery(topAPquery);

   //Make an HTML table to show the results in:
		    out.print("<table class=\"hoverTable\">");
		    
		    out.print("<tr>");
		       out.print("<th COLSPAN=5 >");
		       out.print("Top 10 Most Played AP Champions");
		       out.print("<th>");
		       out.print("</tr>");
    
	    	   //make a row
		       out.print("<tr align=\"center\">");
	    	   //make a column
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Rank");
		       out.print("</td>");
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Champion");
		       out.print("</td>");
		       
		       //make a column
		       out.print("<td>");
		       out.print("Lane Position");   
		       out.print("</td>");
		    		   
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Offense Type");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("Win Rate");
		       out.print("</td>");
		       
		       out.print("</tr>");
		    
		       int count = 1;
		    //parse out the results
		  
		    while(topAPresult.next())
		    {
		    	
		    	
		       //make a row
		       out.print("<tr align=\"center\">");
		       
		       out.print("<td>");
		       out.print(count);
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print(topAPresult.getString("name"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topAPresult.getString("position"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topAPresult.getString("type"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(topAPresult.getString("winRate"));
		       out.print("</td>");
		       
		       out.print("</tr>");
		      count++;
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();
		    
	}
	catch (Exception e) {
	}
	
out.print("<br>");
	
	try{
		//Create a connection string
		//String url = "jdbc:mysql://your_VM:3306/your_db";
    	String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
    
    	//Create a connection to your DB
	   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
	    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");
    	//Create a SQL statement
	    Statement stmt = con.createStatement();
		
		String bestwin = "SELECT * FROM LeagueStat.champs ORDER BY winRate Desc LIMIT 10";

    ResultSet bestwinresult = stmt.executeQuery(bestwin);

   //Make an HTML table to show the results in:
		    out.print("<table class=\"hoverTable\">");
		    
		    out.print("<tr>");
		       out.print("<th COLSPAN=5 >");
		       out.print("Top 10 Most Winning Champions");
		       out.print("<th>");
		       out.print("</tr>");
    
	    	   //make a row
		       out.print("<tr align=\"center\">");
	    	   //make a column
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Rank");
		       out.print("</td>");
	    	   
	    	   //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Champion");
		       out.print("</td>");
		       
		       //make a column
		       out.print("<td>");
		       out.print("Lane Position");   
		       out.print("</td>");
		    		   
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print("Offense Type");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("Win Rate");
		       out.print("</td>");
		       
		       out.print("</tr>");
		    
		       int count = 1;
		    //parse out the results
		  
		       while(bestwinresult.next())
			    {
			    	
			    	
			       //make a row
			       out.print("<tr align=\"center\">");
			       
			       out.print("<td>");
			       out.print(count);
			       out.print("</td>");
			       
			       //THIS IS ONE CELL
			       out.print("<td>");
			       out.print(bestwinresult.getString("name"));
			       out.print("</td>");
			       
			       //THIS IS ONE CELL
			       out.print("<td>");
			    	   out.print(bestwinresult.getString("position"));
			       out.print("</td>");
			       
			       //THIS IS ONE CELL
			       out.print("<td>");
			    	   out.print(bestwinresult.getString("type"));
			       out.print("</td>");
			       
			       //THIS IS ONE CELL
			       out.print("<td>");
			    	   out.print(bestwinresult.getString("winRate"));
			       out.print("</td>");
			       
			       out.print("</tr>");
			      count++;
			    } 
			    out.print("</table>");
			    
			    //close the connection.
			    con.close();
		    
	}
	catch (Exception e) {
	}
%>

</center>

</body>
</html>