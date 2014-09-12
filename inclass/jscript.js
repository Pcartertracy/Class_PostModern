
<script type="text/javascript" language="javascript">
function validateForm(event) 
  event.preventDefault(); // don't submit the form, because we're going to work with data on the client only.

  var formIsValid = true;

  var x = document.forms["myForm"]["fname"].value;
    if (x==null || x=="") {
        alert("First name must be filled out");
        formIsValid = false;

  var y = document.forms["myForm"]["lname"].value;
    if (y==null || y=="") {
        alert("Last name must be filled out");
        formIsValid = false;

  var z = document.forms["myForm"]["fav_food"].value;
    if (z==null || z=="") {
        alert("Favorite food must be filled out");
        formIsValid = false;

  if (!formIsValid) {
      document.getElementById("lname").innerHTML = "First name must be filled out.";
      document.getElementById("fname").innerHTML = "Last name must be filled out.";
      document.getElementById("fav_food").innerHTML = "Favorite food must be filled out.";
  } else {
    function update() {
      document.getElementById("fullName").innerHTML = document.getElementById("fname").innerHTML;
      document.getElementById("fillName").innerHTML = document.getElementById("lname").innerHTML ;
      document.getElementById("favoriteFood").innerHTML = document.getElementById("fav_food").innerHTML;
    }
  }
}


window.onload = function(event) {
  var formNode = document.getElementById("myForm");
  formNode.addEventListener("submit", validateForm, false);
}
</script>