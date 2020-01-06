<html lang="en">
<head>
</head>
<body>
<?php
    include 'config/database.php';
    include 'bootstrap.php';

    // // include objects
    // include_once "objects/product.php";
    // include_once "objects/product_image.php";
    // include_once "objects/cart_item.php";


    // get database connection
    $database = new Database();
    $db = $database->getConnection();

    // set page title
    $page_title="Register";
include 'layout_head.php';
?>


<div class="container ">
<form method = "post">
    <br>
<div class="row ">
<div class="col-sm 3"> </div>
<div class="col-sm 6 shadow-lg bg-white rounded py-5 px-5"> 
    <div class="display-5 text-info size-3 text-center">
    <h3>Create your account now </h3>
    </div>
    <div class="form-group">
    <label for="fname">First Name</label>
    <input type="text" required name= "fname" class="form-control" id="fname" aria-describedby="emailHelp" placeholder="Enter your first name">
  </div>
  <div class="form-group">
    <label for="lname">Last Name</label>
    <input type="text" required name= "lname" class="form-control" id="lname" aria-describedby="lnameHelp" placeholder="Enter your last name">
  </div>
  <div class="form-group">
    <label for="InputEmail1">Email address</label>
    <input type="email" name= "email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="InputPassword1">Password</label>
    <input type="password" name= "password" class="form-control" id="InputPassword1" placeholder="Password" required>
  </div>
  <div class="form-group">
    <label for="InputPassword2">Confirm Password</label>
    <input type="password" name= "cpassword" class="form-control" id="InputPassword2" placeholder="Password" required>
  </div>
  <div class="form-group">
    <label for="mNumber">Mobile Number</label>
    <input type="text" name= "mNumber" class="form-control" id="mNumber" placeholder="Mobile Number" required>
  </div>

  <div class="form-group">
    <label for="pNumber">Phone Number</label>
    <input type="text" name= "pNumber" class="form-control" id="pNumber" placeholder="Phone Number">
  </div>

  <div class="">
  <br>
<span>Shipping Address</span>
<br>
<br>
<div class="form-group">
    <label for="add1">Address 1</label>
    <input type="text" required name= "add1" class="form-control" id="add1" aria-describedby="add1Help" placeholder="">
  </div>
  <div class="form-group">
    <label for="add2">Address 2</label>
    <input type="text" required name= "add2" class="form-control" id="add2" aria-describedby="add2Help" placeholder="">
  </div>
  <div class="form-group">
    <label for="Country">Country</label>
    <input type="text" required name= "Country" class="form-control" id="Country" aria-describedby="CountryHelp" placeholder="Enter your country">
  </div>
  <div class="form-group">
    <label for="state">State</label>
    <input type="text" required name= "state" class="form-control" id="state" aria-describedby="stateHelp" placeholder="">
  </div>
  <div class="form-group">
    <label for="zip">Zip Code</label>
    <input type="text" required name= "zip" class="form-control" id="zip" aria-describedby="zipHelp" placeholder="">
  </div>
<br>

<div id="billing">
<span>Billing Address</span>
<br>
<br>
<div class="form-group" >
<label for="add1Billing">Address 1</label>
    <input type="text"  name= "add1Billing" class="form-control" id="add1Billing" aria-describedby="add1Help" placeholder="">
  </div>
  <div class="form-group">
    <label for="add2Billing">Address 2</label>
    <input type="text"  name= "add2Billing" class="form-control" id="add2Billing" aria-describedby="add2Help" placeholder="">
  </div>
  <div class="form-group">
    <label for="CountryBilling">Country</label>
    <input type="text"  name= "CountryBilling" class="form-control" id="CountryBilling" aria-describedby="CountryHelp" placeholder="Enter your country">
  </div>
  <div class="form-group">
    <label for="stateBilling">State</label>
    <input type="text"  name= "stateBilling" class="form-control" id="stateBilling" aria-describedby="stateHelp" placeholder="">
  </div>
  <div class="form-group">
    <label for="zipBilling">Zip Code</label>
    <input type="text"  name= "zipBilling" class="form-control" id="zipBilling" aria-describedby="zipHelp" placeholder="">
  </div>
  </div>
  <label for="checkBox">Billing Address same as shipping address</label>
  <input id= "cBox" class="checkBox pb-4 mb-4" type="checkbox" name="checkBox" value="1"/>
  <br>


<script>
$(document).ready(function(){
 $('#cBox').change(function() {
  $("#billing").hide();
    if($('#cBox').is(":checked"))   
        $("#billing").hide();
    else
        $("#billing").show();
});   
});
</script>
</div>
<div class="text-center">
  <button class="btn btn-primary btn-md" id="regBtn" name = "submit" type= "submit">Submit</button>
  </div>
  <div class=" text-center display-5">
      <div class="pt-2">
      <b class= "text-danger"> Forgot Password? </b>
      <a href="login.php">
      <b class="text-success"> | Login </b>
      </a>
  </div>
  </div>
</div>


<div class="col-sm 3"> </div>
</div>

  </form>
  </div>


<?php include 'registerCode.php';?>

</body>

</html>