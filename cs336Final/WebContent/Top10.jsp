<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

	List<String> list = new ArrayList<String>();

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
	    	//Get the selected radio button from the HelloWorld.jsp
		    //String entity = request.getParameter("command");
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM LeagueStat.champs ORDER BY usersPlay Desc LIMIT 10";
	    	//Run the query against the database.
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
		    
		       out.print("<tr>");
		       out.print("<td>");
		       out.print("Top 10 Most Played Champions");

		       out.print("<td>");
		       out.print("</tr>");

	    	
	    	   //make a row
		       out.print("<tr>");
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
		    while(result.next())
		    {
		    	
		    	
		       //make a row
		       out.print("<tr>");
		       
		       out.print("<td>");
		       out.print(count);
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		       out.print(result.getString("name"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(result.getString("position"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(result.getString("type"));
		       out.print("</td>");
		       
		       //THIS IS ONE CELL
		       out.print("<td>");
		    	   out.print(result.getString("winRate"));
		       out.print("</td>");
		       
		       out.print("</tr>");
		      count++;
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();

	} catch (Exception e) {
	}

	%>
</body>
</html>