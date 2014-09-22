<?
if ($_POST['submit']=="Submit"){ 
	$title = cleanData($_POST['title']);
	//print "Data cleaned";  
	addData($title);
} 
else {
printForm(); 	
}
function cleanData($data){
	$data = trim($data);
	$data = stripcslashes($data);
	$data = htmlspecialchars($data);
	$data = strip_tags($data);
	return $data;

}

function addData($title){
	//print "ready to add data";
	include("dbinfo.php");
	$sql="INSERT INTO examples VALUES(null,'$title')";
	$result=mysql_query($sql);
	include("header.php");  
	?>
	<h1>The fallowing has been added</h1>
		<ul>
			<li>Film: $title</li>
		</ul>
<?}

function printForm(){ 
$pageTitle = "Add a Film"; 
include("header.php"); 
?>
	<h2> Add a Film<h2>  
	<form id ="myFrom" method="POST"> 
	<div> 
		<label for="title">Title*:</lable>
		<input type="text" name="title" id="title" required="required"> 
	</div>
	<div id="mySubmit"> 
		<input type="submit" name="submit" value="Submit"> 
	</div>
	</form>

<?}?>


<?include("footer.php"); ?>
