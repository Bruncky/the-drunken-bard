/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap';

const doseForm = document.getElementById('dose-form');
const addIngredientsButton = document.getElementById('add-ingredients-button');
const cancelButton = document.getElementById('cancel-button');

// Handling the button changing from "Add Ingredient" to "Cancel"
addIngredientsButton.addEventListener("click", () => {

  // Toggle Bootstrap classes to turn from blue to red
  addIngredientsButton.classList.toggle("btn-outline-primary");
  addIngredientsButton.classList.toggle("btn-danger");

  // Check inner text and change accordingly
  if (addIngredientsButton.innerText === "Add Ingredient") {
    addIngredientsButton.innerText = "Cancel";
  } else {
    addIngredientsButton.innerText = "Add Ingredient";
  }

  // Unfocus the button after pressing
  addIngredientsButton.blur();

  // ----- Dropdown -----

  // Toggle between invisible and visible using Bootstrap class "d-none"
  doseForm.classList.toggle("active");
});

const navbar = document.getElementById("navbar")
const navbarToggleButton = document.getElementById("navbar-button")

navbarToggleButton.addEventListener("click", () => {
  console.log("Hello")
  navbar.classList.toggle("navbar-expanded")
});
