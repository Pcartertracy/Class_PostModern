/*<script type="text/javascript" language="javascript">*/

function validateForm(event) 
  event.preventDefault(); 
  document.getElementByClassName("errors")[0].style.display = "visible";
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
      document.getElementsByName("lname").innerHTML = "First name must be filled out.";
      document.getElementsByName("fname").innerHTML = "Last name must be filled out.";
      document.getElementsByName("fav_food").innerHTML = "Favorite food must be filled out.";
  } else {
      function update() {
        document.getElementById("fullName").innerHTML = document.getElementsByName("fname").innerHTML;
        document.getElementById("fillName").innerHTML = document.getElementsByName("lname").innerHTML ;
        document.getElementById("favoriteFood").innerHTML = document.getElementsByName("fav_food").innerHTML;
    }
  }
}


window.onload = function(event) {
  var formNode = document.getElementById("myForm");
  formNode.addEventListener("submit", validateForm, false);
}
/*</script>*/