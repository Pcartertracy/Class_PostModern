
<script type="text/javascript" language="javascript">
// A form validation function template.
function validateForm(event) {
  alert('Form is being submitted. Delete this line from the js.');
  event.preventDefault(); // don't submit the form, because we're going to work with data on the client only.
  var formIsValid = true;
  // TODO
  // Inspect the values of each input element to make sure they are not blank.
  // If any of the fields are blank, formIsValid should be set to false.
  // AND the error message node in the dom should describe the errors.
  // eg: First name is blank. Favorite food is blank.
  if (!formIsValid) {
    // TODO update the error div and display it.
  } else {
    // TODO update the h1 span contents. Hint: see element.innerHTML
  }
}

// "Only once the document is loaded, execute the following function."
window.onload = function(event) {
  alert('Window (and document) has loaded. Delete this line from the js.');
  // Get the form element, so we can manipulate it.
  var formNode = document.getElementById("myForm");
  // When the form is submitted, execute the following function.
  formNode.addEventListener("submit", validateForm, false);
  // Notice how the identifier `validateForm` itself is passed, not the
  // return value from calling the `validateForm` function.
  // eg. validateForm vs validateForm().
  // We are literally passing the `addEventListener` method a function.
  // In JavaScript, and other functional langs,
  // functions are "first-class citizens".
}
</script>