
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<?php
include 'config/database.php';
include 'bootstrap.php';
$page_title= "Home Shopping ";
include 'loginCode.php';
include 'navigation.php';

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
  $fname = $_SESSION['firsname'];
      $lname = $_SESSION['lastname'];
      echo " <script> document.getElementById('login_register').innerHTML='$fname $lname';</script>";
      echo "  <script> document.getElementById('registerhref').href='index.php';
      </script>";


      echo "<script>document.getElementById('toggler').style.visibility = 'visible'; </script>";

}
?>

<button type="button" class="btn btn-success">
  <a href="./products.php?catid=1" style="color:inherit">   Electronic Devices </a>
</button>
<button type="button" class="btn btn-info">
  <a href="./products.php?catid=2" style="color:inherit">   Electronic Accessories </a>
</button>
<button type="button" class="btn btn-warning">
  <a href="./products.php?catid=3" style="color:inherit">   TV & HOME APPLIANCES</a>
</button>
<button type="button" class="btn btn-light">
  <a href="./products.php?catid=4" style="color:inherit">   HEALTH & BEAUTY </a>
</button>
<button type="button" class="btn btn-light">
  <a href="./products.php?" style="color:inherit">   VIEW ALL</a>
</button>
</body>
</html>
