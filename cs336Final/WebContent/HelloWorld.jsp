<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>League Statistics</title>
</head>
<body>

<!-- Title and Information for User Use -->
<center>
<p>Welcome to a site all about League of Legends! 
<p>Feel free to browse around for all your League of Legend needs!

</center> 
 		
<br>
<!-- Navigation of the site bringing to the various tables and queries -->

<form method="get" action="SeeChampions.jsp" enctype=text/plain>
<button type="submit" value="See Champions" formaction="SeeChampions.jsp" >See Champions</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form> 		
<form method="get" action="SeeUsers.jsp" enctype=text/plain>
<button type="submit" value="See Users" formaction="SeeUsers.jsp" >See Users</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>  		

<br>
<p> Top 10 AP Most Popular Characters Based on Usage
<form method="get" action="TopAP.jsp" enctype=text/plain>
<button type="submit" value="Top 10 AP Champions" formaction="TopAP.jsp" >Top 10 AP Champions</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>  

<br>
<p> Top 10 AD Most Popular Characters Based on Usage
<form method="get" action="TopAD.jsp" enctype=text/plain>
<button type="submit" value="Top 10 AD Champions" formaction="TopAD.jsp" >Top 10 AD Champions</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>

<br>
<p> Top 10 Most Popular Characters Overall Characters 
<form method="get" action="Top10.jsp" enctype=text/plain>
<button type="submit" value="Top10MostUsed" formaction="Top10.jsp" >Top 10 Most Used</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>

<br>
<p> Top 10 Best to Use Characters Based on Win Rate
<form method="get" action="TopWinRates.jsp" enctype=text/plain>
<button type="submit" value="Best Win Rate Champions" formaction="TopWinRates.jsp" >Best Win Rate Champions</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>

<br>
<p> Best Characters to Play Lanes With
<form method="get" action="BestLanes.jsp" enctype=text/plain>
<button type="submit" value="Best Lane Characters" formaction="BestLanes.jsp" >Best Lane Characters</button>  <!-- in this page you will be able to choose the user to see their top champions and ranking -->
</form>

<br>
<br>
<br>
<br>
Alternatively, lets type in a bar and a beer and  a price limit.

	<form method="post" action="newBeer.jsp">
	<table>
	<tr>    
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Beer</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	<td>Price</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
</body>
</html>