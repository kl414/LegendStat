<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
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
<body bgcolor="#E6E6FA">

<ul>
  <li><a href="HelloWorld.jsp">Home</a></li>
  <li><a href="SeeChampions.jsp">Champion List</a></li>
  <li><a href="SeeUsers.jsp">Users </a></li>
  <li><a href="stats.jsp">Statistics</a></li>
  
  <ul style="float:right;list-style-type:none;">
  <li><a href="contact.jsp">Contact</a></li>
  <li><a href="AboutPage.jsp">About</a></li>
  <li><a class="active" href="#login">Login</a></li>
  </ul>
</ul>

<center>
<p> New Information </p>
<% 
	String username = request.getParameter("Username2");
	session.setAttribute("Username",username);
	session.setAttribute("mode", "signUp");
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
	
	if(result.next()){
		out.print("Duplicate username " + username + " exist!" + "<br>");
		out.print("Please go back and enter a different one");
	}else{
%>
	<form name = "userInfo" method="post" action="updateDB.jsp">
	<table>
	<tr>    
	<td>Rank:</td>
	<td><SELECT NAME="rank">
		<OPTION SELECTED> Bronze
		<OPTION> Silver
		<OPTION> Gold
		<OPTION> Platinum
		<OPTION> Diamond
		<OPTION> Challenger</td>
	</tr>
	<tr>    
	<td>Top 1 Champion:</td>
	<td><SELECT NAME="champ1">
		<OPTION SELECTED> Aatrox
		<OPTION> Ahri
		<OPTION> Akali
		<OPTION> Alistar
		<OPTION> Amumu
		<OPTION> Anivia
		<OPTION> Annie
		<OPTION> Ashe
		<OPTION> Azir
		<OPTION> Bard
		<OPTION> Blitzcrank
		<OPTION> Brand
		<OPTION> Braum
		<OPTION> Caitlyn
		<OPTION> Cassiopeia
		<OPTION> Cho'Gath
		<OPTION> Corki
		<OPTION> Darius
		<OPTION> Diana
		<OPTION> Dr. Mundo
		<OPTION> Draven
		<OPTION> Ekko
		<OPTION> Elise
		<OPTION> Evelynn
		<OPTION> Ezreal
		<OPTION> Fiddlesticks
		<OPTION> Fiora
		<OPTION> Fizz
		<OPTION> Galio
		<OPTION> Gangplank
		<OPTION> Garen
		<OPTION> Gnar
		<OPTION> Gragas
		<OPTION> Graves
		<OPTION> Hecarim
		<OPTION> Heimerdinger
		<OPTION> Irelia
		<OPTION> Janna
		<OPTION> Jarvan IV
		<OPTION> Jax
		<OPTION> Jayce
		<OPTION> Jinx
		<OPTION> Kalista
		<OPTION> Karma
		<OPTION> Karthus
		<OPTION> Kassadin
		<OPTION> Katarina
		<OPTION> Kayle
		<OPTION> Kennen
		<OPTION> Kha'Zix
		<OPTION> Kindred
		<OPTION> Kog'Maw
		<OPTION> LeBlanc
		<OPTION> Lee Sin
		<OPTION> Leona
		<OPTION> Lissandra
		<OPTION> Lucian
		<OPTION> Lulu
		<OPTION> Lux
		<OPTION> Malphite
		<OPTION> Malzahar
		<OPTION> Maokai
		<OPTION> Master Yi
		<OPTION> Miss Fortune
		<OPTION> Mordekaiser
		<OPTION> Morgana
		<OPTION> Nami
		<OPTION> Nasus
		<OPTION> Nautilus
		<OPTION> Nidalee
		<OPTION> Nocturne
		<OPTION> Nunu
		<OPTION> Olaf
		<OPTION> Orianna
		<OPTION> Pantheon
		<OPTION> Poppy
		<OPTION> Quinn
		<OPTION> Rammus
		<OPTION> Rek'Sai
		<OPTION> Renekton
		<OPTION> Rengar
		<OPTION> Riven
		<OPTION> Rumble
		<OPTION> Ryze
		<OPTION> Sejuani
		<OPTION> Shaco
		<OPTION> Shen
		<OPTION> Shyvana
		<OPTION> Singed
		<OPTION> Sion
		<OPTION> Sivir
		<OPTION> Skarner
		<OPTION> Sona
		<OPTION> Soraka
		<OPTION> Swain
		<OPTION> Syndra
		<OPTION> Tahm Kench
		<OPTION> Talon
		<OPTION> Taric
		<OPTION> Teemo
		<OPTION> Thresh
		<OPTION> Tristana
		<OPTION> Trundle
		<OPTION> Tryndamere
		<OPTION> Twisted Fate
		<OPTION> Twitch
		<OPTION> Udyr
		<OPTION> Urgot
		<OPTION> Varus
		<OPTION> Vayne
		<OPTION> Veigar
		<OPTION> Vel'Koz
		<OPTION> Vi
		<OPTION> Viktor
		<OPTION> Vladimir
		<OPTION> Volibear
		<OPTION> Warwick
		<OPTION> Wukong
		<OPTION> Xerath
		<OPTION> Xin Zhao
		<OPTION> Yasuo
		<OPTION> Yorick
		<OPTION> Zac
		<OPTION> Zed
		<OPTION> Ziggs
		<OPTION> Zilean
		<OPTION> Zyra
		</SELECT></td>
	</tr>
	<tr> 
	<td>Games played with above champion:</td><td><input type="text" name="game1"></td>
	</tr>
	<tr> 
	<td>Top 2 Champion:</td>
	<td><SELECT NAME="champ2">
		<OPTION SELECTED> Aatrox
		<OPTION> Ahri
		<OPTION> Akali
		<OPTION> Alistar
		<OPTION> Amumu
		<OPTION> Anivia
		<OPTION> Annie
		<OPTION> Ashe
		<OPTION> Azir
		<OPTION> Bard
		<OPTION> Blitzcrank
		<OPTION> Brand
		<OPTION> Braum
		<OPTION> Caitlyn
		<OPTION> Cassiopeia
		<OPTION> Cho'Gath
		<OPTION> Corki
		<OPTION> Darius
		<OPTION> Diana
		<OPTION> Dr. Mundo
		<OPTION> Draven
		<OPTION> Ekko
		<OPTION> Elise
		<OPTION> Evelynn
		<OPTION> Ezreal
		<OPTION> Fiddlesticks
		<OPTION> Fiora
		<OPTION> Fizz
		<OPTION> Galio
		<OPTION> Gangplank
		<OPTION> Garen
		<OPTION> Gnar
		<OPTION> Gragas
		<OPTION> Graves
		<OPTION> Hecarim
		<OPTION> Heimerdinger
		<OPTION> Irelia
		<OPTION> Janna
		<OPTION> Jarvan IV
		<OPTION> Jax
		<OPTION> Jayce
		<OPTION> Jinx
		<OPTION> Kalista
		<OPTION> Karma
		<OPTION> Karthus
		<OPTION> Kassadin
		<OPTION> Katarina
		<OPTION> Kayle
		<OPTION> Kennen
		<OPTION> Kha'Zix
		<OPTION> Kindred
		<OPTION> Kog'Maw
		<OPTION> LeBlanc
		<OPTION> Lee Sin
		<OPTION> Leona
		<OPTION> Lissandra
		<OPTION> Lucian
		<OPTION> Lulu
		<OPTION> Lux
		<OPTION> Malphite
		<OPTION> Malzahar
		<OPTION> Maokai
		<OPTION> Master Yi
		<OPTION> Miss Fortune
		<OPTION> Mordekaiser
		<OPTION> Morgana
		<OPTION> Nami
		<OPTION> Nasus
		<OPTION> Nautilus
		<OPTION> Nidalee
		<OPTION> Nocturne
		<OPTION> Nunu
		<OPTION> Olaf
		<OPTION> Orianna
		<OPTION> Pantheon
		<OPTION> Poppy
		<OPTION> Quinn
		<OPTION> Rammus
		<OPTION> Rek'Sai
		<OPTION> Renekton
		<OPTION> Rengar
		<OPTION> Riven
		<OPTION> Rumble
		<OPTION> Ryze
		<OPTION> Sejuani
		<OPTION> Shaco
		<OPTION> Shen
		<OPTION> Shyvana
		<OPTION> Singed
		<OPTION> Sion
		<OPTION> Sivir
		<OPTION> Skarner
		<OPTION> Sona
		<OPTION> Soraka
		<OPTION> Swain
		<OPTION> Syndra
		<OPTION> Tahm Kench
		<OPTION> Talon
		<OPTION> Taric
		<OPTION> Teemo
		<OPTION> Thresh
		<OPTION> Tristana
		<OPTION> Trundle
		<OPTION> Tryndamere
		<OPTION> Twisted Fate
		<OPTION> Twitch
		<OPTION> Udyr
		<OPTION> Urgot
		<OPTION> Varus
		<OPTION> Vayne
		<OPTION> Veigar
		<OPTION> Vel'Koz
		<OPTION> Vi
		<OPTION> Viktor
		<OPTION> Vladimir
		<OPTION> Volibear
		<OPTION> Warwick
		<OPTION> Wukong
		<OPTION> Xerath
		<OPTION> Xin Zhao
		<OPTION> Yasuo
		<OPTION> Yorick
		<OPTION> Zac
		<OPTION> Zed
		<OPTION> Ziggs
		<OPTION> Zilean
		<OPTION> Zyra
		</SELECT></td>
	</tr>
	<tr> 
	<td>Games played with above champion:</td><td><input type="text" name="game2"></td>
	</tr>
	<tr> 
	<td>Top 3 Champion:</td>
	<td><SELECT NAME="champ3">
		<OPTION SELECTED> Aatrox
		<OPTION> Ahri
		<OPTION> Akali
		<OPTION> Alistar
		<OPTION> Amumu
		<OPTION> Anivia
		<OPTION> Annie
		<OPTION> Ashe
		<OPTION> Azir
		<OPTION> Bard
		<OPTION> Blitzcrank
		<OPTION> Brand
		<OPTION> Braum
		<OPTION> Caitlyn
		<OPTION> Cassiopeia
		<OPTION> Cho'Gath
		<OPTION> Corki
		<OPTION> Darius
		<OPTION> Diana
		<OPTION> Dr. Mundo
		<OPTION> Draven
		<OPTION> Ekko
		<OPTION> Elise
		<OPTION> Evelynn
		<OPTION> Ezreal
		<OPTION> Fiddlesticks
		<OPTION> Fiora
		<OPTION> Fizz
		<OPTION> Galio
		<OPTION> Gangplank
		<OPTION> Garen
		<OPTION> Gnar
		<OPTION> Gragas
		<OPTION> Graves
		<OPTION> Hecarim
		<OPTION> Heimerdinger
		<OPTION> Irelia
		<OPTION> Janna
		<OPTION> Jarvan IV
		<OPTION> Jax
		<OPTION> Jayce
		<OPTION> Jinx
		<OPTION> Kalista
		<OPTION> Karma
		<OPTION> Karthus
		<OPTION> Kassadin
		<OPTION> Katarina
		<OPTION> Kayle
		<OPTION> Kennen
		<OPTION> Kha'Zix
		<OPTION> Kindred
		<OPTION> Kog'Maw
		<OPTION> LeBlanc
		<OPTION> Lee Sin
		<OPTION> Leona
		<OPTION> Lissandra
		<OPTION> Lucian
		<OPTION> Lulu
		<OPTION> Lux
		<OPTION> Malphite
		<OPTION> Malzahar
		<OPTION> Maokai
		<OPTION> Master Yi
		<OPTION> Miss Fortune
		<OPTION> Mordekaiser
		<OPTION> Morgana
		<OPTION> Nami
		<OPTION> Nasus
		<OPTION> Nautilus
		<OPTION> Nidalee
		<OPTION> Nocturne
		<OPTION> Nunu
		<OPTION> Olaf
		<OPTION> Orianna
		<OPTION> Pantheon
		<OPTION> Poppy
		<OPTION> Quinn
		<OPTION> Rammus
		<OPTION> Rek'Sai
		<OPTION> Renekton
		<OPTION> Rengar
		<OPTION> Riven
		<OPTION> Rumble
		<OPTION> Ryze
		<OPTION> Sejuani
		<OPTION> Shaco
		<OPTION> Shen
		<OPTION> Shyvana
		<OPTION> Singed
		<OPTION> Sion
		<OPTION> Sivir
		<OPTION> Skarner
		<OPTION> Sona
		<OPTION> Soraka
		<OPTION> Swain
		<OPTION> Syndra
		<OPTION> Tahm Kench
		<OPTION> Talon
		<OPTION> Taric
		<OPTION> Teemo
		<OPTION> Thresh
		<OPTION> Tristana
		<OPTION> Trundle
		<OPTION> Tryndamere
		<OPTION> Twisted Fate
		<OPTION> Twitch
		<OPTION> Udyr
		<OPTION> Urgot
		<OPTION> Varus
		<OPTION> Vayne
		<OPTION> Veigar
		<OPTION> Vel'Koz
		<OPTION> Vi
		<OPTION> Viktor
		<OPTION> Vladimir
		<OPTION> Volibear
		<OPTION> Warwick
		<OPTION> Wukong
		<OPTION> Xerath
		<OPTION> Xin Zhao
		<OPTION> Yasuo
		<OPTION> Yorick
		<OPTION> Zac
		<OPTION> Zed
		<OPTION> Ziggs
		<OPTION> Zilean
		<OPTION> Zyra
		</SELECT></td>
	</tr>
	<tr> 
	<td>Games played with above champion:</td><td><input type="text" name="game3"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<% 
	}
%>
<br>

<img src="league-of-legends-logo.jpg" alt="Homepage Logo" style="width:704px;height:428px;">

	
</center>
</body>
</html>