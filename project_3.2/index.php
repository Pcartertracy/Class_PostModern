<?
require "dbinfo.php";  
$sql="SELECT * FROM enxamples ORDER BY last ASC"; 
$result = mysql_query($sql,$db);
$pageTitle= "My film database"; 
include("header.php"); 
?> 

<h2>My Films</h2>
<h3><a href="addFilm.php">Add a film</a></h3>
Select a film to edit or delete or <a herf="addFilm.php"> add new film</a> 
<table id="home"> 

<? while($row=mysql_fetch_array($result)){
	$id=$row["filmID"]; 
	$title=$row["title"];
}
?> 

<tr>
<td>
	<form method="post" action="confirmdelete.php">
	<input type="hidden" name="sel_record" value="$id">
	<input type="submit" name="delete" value="Delete">
	</form>

	<form method="post" action="addFilm.php">
	<input type="hidden" name="sel_record" value="$id">
	<input type="submit" name="update" value="Edit">
	</form>
</td>
<td><strong>$title</strong></td>
</tr>

<?include("footer.php");?>