<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Processing</title>

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
</style>


</head>
<body bgcolor="#E6E6FA">

<ul>
  <li><a href="HelloWorld.jsp">Home</a></li>
  <li><a href="SeeChampions.jsp">Champion List</a></li>
  <li><a href="SeeUsers.jsp">Users </a></li>
  <li><a href="stats.jsp">Statistics </a></li>
  
  <ul style="float:right;list-style-type:none;">
  <li><a href="contact.jsp">Contact</a></li>
  <li><a href="AboutPage.jsp">About</a></li>
  <li><a class="active" href="login.jsp">Login</a></li>
  </ul>
</ul>
<center>
<% 
try{
	String rank = request.getParameter("rank");
	String c1 = request.getParameter("champ1");	
	int g1 = Integer.parseInt(request.getParameter("game1"));
	String c2 = request.getParameter("champ2");
	int g2 = Integer.parseInt(request.getParameter("game2"));
	String c3 = request.getParameter("champ3");
	int g3 = Integer.parseInt(request.getParameter("game3"));
	
	String mode = session.getAttribute("mode").toString();
	session.removeAttribute("mode");
	if(c1.equals(c2) || c2.equals(c3) || c1.equals(c3)){
		out.print("Please choose different champions");
	}
	else if(mode.equals("signUp")){
		String username = session.getAttribute("Username").toString();
		session.removeAttribute("Username");
		
		//Create a connection string
		//String url = "jdbc:mysql://your_VM:3306/your_db";
		String url = "jdbc:mysql://leaguestat.cfcknphvdfcz.us-west-2.rds.amazonaws.com:3306/LeagueStat";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
	
		//Create a connection to your DB
	   // Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
	    Connection con = DriverManager.getConnection(url, "cs336_kevin", "rutgerscs336");

	    PreparedStatement pst =(PreparedStatement) con.prepareStatement("insert into LeagueStat.users(name,rank, champ1, game1, champ2, game2, champ3, game3) values(?,?,?,?,?,?,?,?)");
	
	    pst.setString(1,username);  
	    pst.setString(2,rank);        
	    pst.setString(3,c1);
	    pst.setInt(4,g1);
	    pst.setString(5,c2);
	    pst.setInt(6,g2);
	    pst.setString(7,c3);
	    pst.setInt(8,g3);
	    pst.executeUpdate();
	    
	    //update champions' userPlay
	    Statement stmt = con.createStatement();
		//Get the selected radio button from the HelloWorld.jsp
		//String entity = request.getParameter("command");
		//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
		
		String str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c1 + "\"";
		ResultSet result2 = stmt.executeQuery(str);
		result2.next();
		int u1 = result2.getInt("usersPlay");
		u1++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u1 + "\" WHERE name = \"" + c1 + "\"";
		stmt.executeUpdate(str);
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c2 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int u2 = result2.getInt("usersPlay");
		u2++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u2 + "\" WHERE name = \"" + c2 + "\"";
		stmt.executeUpdate(str);
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c3 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int u3 = result2.getInt("usersPlay");
		u3++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u3 + "\" WHERE name = \"" + c3 + "\"";
		stmt.executeUpdate(str);
		
	    String redirectURL = "http://ec2-52-34-234-237.us-west-2.compute.amazonaws.com:8080/LegendStat/HelloWorld.jsp";
	    response.sendRedirect(redirectURL);
	}else if(mode.equals("login")){
		String username = session.getAttribute("Username").toString();
		session.removeAttribute("Username");
		
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
		String str = "SELECT * FROM LeagueStat.users WHERE name = \"" + username + "\"";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		//data existing check already done in loginSuccess.jsp
		//this is decrementing the old champs' usersPlay
		result.next();
		String oldc1 = result.getString("champ1");

		String oldc2 = result.getString("champ2");

		String oldc3 = result.getString("champ3");
		
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + oldc1 + "\"";
		ResultSet result2 = stmt.executeQuery(str);
		result2.next();
		int oldg1 = result2.getInt("usersPlay");
		oldg1--;
		
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + oldc2 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int oldg2 = result2.getInt("usersPlay");
		oldg2--;
		
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + oldc3 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int oldg3 = result2.getInt("usersPlay");
		oldg3--;
		
		
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + oldg1 + "\" WHERE name = \"" + oldc1 + "\"";
		stmt.executeUpdate(str);
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + oldg2 + "\" WHERE name = \"" + oldc2 + "\"";
		stmt.executeUpdate(str);
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + oldg3 + "\" WHERE name = \"" + oldc3 + "\"";
		stmt.executeUpdate(str);
		
		//incrementing the new champ's usersPlay
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c1 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int u1 = result2.getInt("usersPlay");
		u1++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u1 + "\" WHERE name = \"" + c1 + "\"";
		stmt.executeUpdate(str);
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c2 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int u2 = result2.getInt("usersPlay");
		u2++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u2 + "\" WHERE name = \"" + c2 + "\"";
		stmt.executeUpdate(str);
		str = "SELECT * FROM LeagueStat.champs WHERE name = \"" + c3 + "\"";
		result2 = stmt.executeQuery(str);
		result2.next();
		int u3 = result2.getInt("usersPlay");
		u3++;
		str = "UPDATE LeagueStat.champs SET usersPlay = \"" + u3 + "\" WHERE name = \"" + c3 + "\"";
		stmt.executeUpdate(str);
		
		//update user's info
		str = "UPDATE LeagueStat.users SET champ1 = \"" + c1 + "\", champ2 = \"" + c2 + "\", champ3 = \"" + c3 + "\", game1 = \"" + g1 + "\", game2 = \"" + g2 + "\", game3 = \"" + g3 + "\" WHERE name = \"" + username + "\"";
		stmt.executeUpdate(str);
		
		String redirectURL = "http://ec2-52-34-234-237.us-west-2.compute.amazonaws.com:8080/LegendStat/HelloWorld.jsp";
	    response.sendRedirect(redirectURL);
	}
}catch(Exception e){
	//out.print("Please enter integer value");
	out.print(e.getMessage());
}    
    

%>
<br>
<img src="league-of-legends-logo.jpg" alt="Homepage Logo" style="width:704px;height:428px;">
</center>
</body>
</html>