<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Processing</title>
</head>
<body>
<% 
try{
	String rank = request.getParameter("rank");
	String c1 = request.getParameter("champ1");	
	int g1 = Integer.parseInt(request.getParameter("game1"));
	String c2 = request.getParameter("champ2");
	int g2 = Integer.parseInt(request.getParameter("game2"));
	String c3 = request.getParameter("champ3");
	int g3 = Integer.parseInt(request.getParameter("game3"));
	
	if(c1.equals(c2) || c2.equals(c3) || c1.equals(c3)){
		out.print("Please choose different champions");
	}
	else{
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
	}
}catch(Exception e){
	out.print("Please enter integer value");
}    
    

%>
</body>
</html>