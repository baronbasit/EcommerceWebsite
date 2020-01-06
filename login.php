<html lang="en">
<head>
</head>
<body>
<?php
    include 'config/database.php';
    include 'bootstrap.php';
    include 'navigation.php';

    // get database connection
    $database = new Database();
    $db = $database->getConnection();

    // set page title
    $page_title="Login";
?>
<form method = "post">
    <br>
<div class="container ">
<div class="row ">
<div class="col-sm 4"> </div>
<div class="col-sm 4 shadow-lg bg-white rounded py-5 px-5"> 
    <div class="display-5 text-info size-3 text-center">
    <h3> Login</h3>
    </div>
  <div class="form-group">
    <label for="InputEmail1">Email address</label>
    <input type="email" name= "email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="InputPassword1">Password</label>
    <input type="password" name= "password" class="form-control" id="InputPassword1" placeholder="Password">
  </div>
  <div class="text-center">
  <button class="btn btn-primary" id="regBtn" name = "lgnBtn" type= "submit">Submit</button>
  </div>
  <div class=" text-center display-5 pt-3">
      <b class= "text-danger"> Forgot Password? </b>
      <a href="register.php">
      <b class="text-success"> | Register </b>
      </a>
  </div>
</form>
  </div>
  <div class="col-sm 4"> </div>
</div>
</div>
<?php include 'loginCode.php';?>
</body>

</html>