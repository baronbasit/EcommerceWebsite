<HTML>
<HEAD>
    <META NAME="GENERATOR" Content="Microsoft Visual Studio">
    <link rel="stylesheet" type="text/css" href="home\style.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <TITLE>Shop Online</TITLE>
</HEAD>
<BODY>

    <div class="main-body">

        <div class="main">
          
            <div class="header">
                <div class="logo">
                    <img src="home\logo.png" width="220" />
                </div>
                <div class="menu">
                    <a href="#"> Home</a>
                    <a href="products.php"> Shop</a>
                    <a href="order.php"> View Order</a>
                    <a href="cart.php"> Cart</a>
                    <a href="Register.php"> Register</a>
                    <a href="Login.php"> Login</a>

                </div>
            </div>

            <div class="sec1">
                <div class="sec1-text">
                    <h1>NEW COLLECTION</h1>
                    <h2><u>Feel The Difference</u></h2>
                    <a href="products.php" class="cover-link"> SHOP NOW</a>
                </div>
            </div>

        </div>

        <div class="sec-2">
            <div class="h1-sec-2">
                <h1>Collections</h1>
                <hr>
            </div>

            <div class="col c1">
            <a href="./products.php?catid=2" >
                <img src="home\products\electronic accessories.jpg" >
             </a>
            </div>
            <div class="col c2">
            <a href="./products.php?catid=1" >
                <img src="home\products\electronic devices.jpg">
                </a>
            </div>
            <div class="col c3">
            <a href="./products.php?catid=4" >
                <img src="home\products\Health&Beauty.jpg">
                </a>
            </div>
        </div>

        <div class="sec-3">
            <div class="col c1">
            <a href="./products.php?catid=3" >
                <img src="home\products\home appliances.jpg">
                </a>
            </div>
            <div class="col c2">
            <a href="./products.php?catid=6" >
                <img src="home\products\pets.jpg">
                </a>
            </div>
            <div class="col c3">
            <a href="./products.php?catid=5" >
                <img src="home\products\toys.jpg">
                </a>
            </div>

        </div>
        <div style="padding-top:50px;height:150px;text-align:center;"><a href="products.php" style="padding:12px 40px; background:black;color:white;">View all items</a></div>



    </div>

    <div class="footer">

        <div class="footer-main">
            Follow us at:
            <a href="https://facebook.com" target="_blank" class="fa fa-facebook"></a>
            <a href="https://twitter.com" target="_blank" class="fa fa-twitter"></a>
            <a href="https://gmail.com" target="_blank" class="fa fa-google"></a>
            <a href="https://youtube.com" target="_blank" class="fa fa-youtube"></a>
            <a href="https://instagram.com" target="_blank" class="fa fa-instagram"></a>

            <form action="submit.html">

                <label><b><u>Subscribe for our latest offers</u></b><br></label>
                <input placeholder="Email.." required>
                <button type="submit" class="reg-btn">Sign Up</button>

            </form>

        </div>

        <div class="footer-bottom">
            ©2019 Home Shopping - All rights reserved.
        </div>
    </div>
<?php

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
  $fname = $_SESSION['firsname'];
      $lname = $_SESSION['lastname'];
      echo " <script> document.getElementById('login_register').innerHTML='$fname $lname';</script>";
      echo "  <script> document.getElementById('registerhref').href='index.php';
      </script>";


      echo "<script>document.getElementById('toggler').style.visibility = 'visible'; </script>";

}
?>

</BODY>
</HTML>
