<? 
<?php
$link = mysql_connect('crcp3320db.humanoriented.com', 'phillipct', 'Crcp3320', "examples");
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
echo 'Connected successfully';
mysql_close($link);
?> 

<html>
<head>
	<title>Data</title>
</head>
<body>
<p>hellp</p>
</body>
</html>