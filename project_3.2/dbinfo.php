<? 
$db = new mysqli('crcp3320db.humanoriented.com', 'phillipct', 'Crcp3320', "phillipct");
if ($db->connect_errno) {
    echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
}


?> 
