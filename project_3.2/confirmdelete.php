
<?
include "dbinfo.php";
$sel_record = $_POST[sel_record];
$sql = "SELECT * FROM examples WHERE filmID = $sel_record";
    $result = mysql_query($sql, $db);
  if (!$result) {
	print "<h1>Something has gone wrong!</h1>";
  } 
else {
	while ($record = mysql_fetch_array($result)) {
		$id = $record['contactID'];
		$title = $record['title'];
	} }

	$pageTitle = "Delete a Contact";
	include "header.php";
?> 


<h2>Are you sure you want to delete this Film form your Database?</h2>
	<ul>
		<li>ID: $id</li>
		<li>Film: $title</li>
	</ul>
<p>
	<form method="post" action="realyDelete.php">
	<input type="hidden" name="id" value="$id">
	<input type="submit" name="realyDelete" value="delete" />
	<input type="button" name="cancel" value="cancel" onClick="location.href='index.php'" /></a>
</p></form>

<?include("footer.php");?>