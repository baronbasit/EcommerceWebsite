<?php session_start();
?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />
<link rel="stylesheet" href="style.css">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.php">Home Shopping</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>

<li class="nav-item">
        <a class="nav-link" href="products.php">Products</a>
</li>
<li class="nav-item">
        <a class="nav-link" href="order.php">View order</a>
</li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <ul class= "navbar-nav ml-auto pr-5">
    

<!-- <li class="nav-item ">
        <a class="nav-link" id="logout" href="index.php">
        <span class="text-white font-weight-bold" id="logoutspan"></span> </a>
</li> -->
<div class="mr-auto">
<li class="nav-item">
        <a class="nav-link" id="registerhref" href="register.php">
        <span id="login_register">Login/Register</span> </a>
</li>

    </ul>
    <form class="form-inline my-2 my-lg-0" action=" " method="post">
    <input class="btn btn-light my-2 my-sm-0" name="logout" type="submit" id="toggler" value="Logout" onClick="action();" />
    </form>
    <script>
  document.getElementById('toggler').style.visibility = 'hidden';
  </script>
    <script> 
    
     var hidden = false;
    function action(){
        hidden = !hidden;
        if(hidden) {
            document.getElementById('toggler').style.visibility = 'hidden';
        } else {
            document.getElementById('toggler').style.visibility = 'visible';
        }
    } </script>
    
</div>
  </div>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="mr-auto"></div>
            <div class="navbar-nav">
                <a href="cart.php" class="nav-item nav-link active">
                    <h5 class="px-5 cart">
                        <i class="fas fa-shopping-cart"></i> Cart
                        <?php
                        if (isset($_SESSION['cart'])){
                            $count = count($_SESSION['cart']);
                            echo "<span id=\"cart_count\" class=\"text-warning bg-light\">$count</span>";
                        }else{
                            echo "<span id=\"cart_count\" class=\"text-warning bg-light\">0</span>";
                        }
                        ?>
                    </h5>
                </a>
            </div>
        </div>
</nav>
<?php if (isset($_POST['logout'])){
session_destroy();
echo "<script> window.location.href = \"./index.php\"; </script>";


}?>