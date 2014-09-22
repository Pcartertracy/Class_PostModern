<? 
$mysqli = new mysqli('crcp3320db.humanoriented.com', 'phillipct', 'Crcp3320', "phillipct");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>

<!DOCTYPE html>
<html>
	<head>
		<div class="header">
		<title>Films</title>
		</div> 
	</head>
	<body>
	<h1>Film database</h1> 

