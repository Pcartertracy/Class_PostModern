<?
include "dbinfo.php";

$id = $_POST[id];
$sql="SELECT * FROM contacts WHERE contactID = '$id'";

 $result=mysql_query($sql);
 while ($row=mysql_fetch_array($result)){
 $id=$row["filmID"];
 $title=$row["title"];
 include "header.php";
 print "<p> $id, $title has bin deleted.</p>";
 }

 $sql="DELETE FROM contacts WHERE contactID = '$id'";
 $result=mysql_query($sql);

?>
<?include("footer.php");?>