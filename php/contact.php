<? include("header.php"); ?>
    <div class="contact">
      <h2>Send e-mail to Phillip:</h2>
      <form action="MAILTO:phillip.cartertracy@gmail.com" method="post" enctype="text/plain">
      	Name:<br>
      	<input type="text" name="name" value="your name"><br>
      	E-mail:<br>
      	<input type="text" name="email" value="your email"><br>
      	Comment:<br>
      	<input type="text" name="comment" value="your comment" size="50"><br><br>
      	<input type="submit"  name="submit" value="Send">
      	<input type="reset" value="Reset">
      </form>
    </div>
    <?
 	 if(isset($_POST['submit'])){
 	   $to = "contact.php,"; 
 	   $from = $_POST['email']; // sender's Email address not mine
 	   $name = $_POST['name'];
 	   $message = $name. "\n\n" . $_POST['comment'];
	   mail($to,$message);
	   echo "Mail Sent. Thank you " . $name . ", we will contact you shortly.";  
	   }
  	?>
<? include("footer.php"); ?>

  