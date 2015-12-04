<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Best Lanes</title>
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
			String strtop = "SELECT * FROM LeagueStat.champs WHERE position = TOP Order By winRate DESC LIMIT 5";
			String stradc = "SELECT * FROM LeagueStat.champs WHERE position = \"ADC\"  LIMIT 1";
			String strsupp = "SELECT * FROM LeagueStat.champs WHERE position = \"SUPPORT\" LIMIT 1";
			String strmid = "SELECT * FROM LeagueStat.champs WHERE position = \"MID\" LIMIT 1";
			String strjungle = "SELECT * FROM LeagueStat.champs WHERE position = \"JUNGLE\" LIMIT 1";

	    	//Run the query against the database.
		    ResultSet top = stmt.executeQuery(strtop);
		    ResultSet adc = stmt.executeQuery(stradc);
		    ResultSet supp = stmt.executeQuery(strsupp);
		    ResultSet mid = stmt.executeQuery(strmid);
		    ResultSet jung = stmt.executeQuery(strjungle);

		    //Make an HTML table to show the results in:
		    out.print("<table>");
		    
		       out.print("<tr>");
	    	   
		       out.print("<td>");
		       out.print("Lane");   
		       out.print("</td>");
	    	   
		       out.print("<td>");
		       out.print("name");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("type");
		       out.print("</td>");
		    		   
		       out.print("<td>");
		       out.print("winRate");
		       out.print("</td>");

		       out.print("</tr>");
			   out.print("<tr>");
		       out.print("<td>");
		       out.print(top.getString("name"));
		       out.print("</td>");
		       
		       out.print("<td>");
		       out.print(top.getString("position"));
		       out.print("</td>");
		     
		       out.print("<td>");
		       out.print(top.getString("type"));
		       out.print("</td>");
		       
		       out.print("<td>");
		       out.print(top.getString("winRate"));
		       out.print("</td>");
 			   out.print("</tr>");
		    
		       out.print("</table>");
		    
		    //close the connection.
		    con.close();

	} catch (Exception e) {
	}

	%>
</body>
</html>