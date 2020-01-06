<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cart</title>
    <link rel="stylesheet" href="style.css">
    
    <?php
    $totalPrice=0;
include 'config/database.php';
include 'bootstrap.php';
include 'loginCode.php';
require_once( './objects/component.php');
$database = new Database();
$connection = $database->getConnection();
$page_title="Products";
include 'navigation.php';
if(!isset($_SESSION["loggedin"])){
    echo "<script>alert('Please login in')</script>";
    echo "<script> window.location.href = \"./login.php\"; </script>";
}
$fname = $_SESSION['firsname'];
$lname = $_SESSION['lastname'];
echo "  <script> document.getElementById('login_register').innerHTML='$fname $lname';
</script>";
echo "  <script> document.getElementById('registerhref').href='index.php';

</script>";
echo "<script>document.getElementById('toggler').style.visibility = 'visible'; </script>";

if (isset($_POST['remove'])){
    if ($_GET['action'] == 'remove'){
        foreach ($_SESSION['cart'] as $key => $value){
            if($value["product_id"] == $_GET['id']){
                $productID  = $_GET['id'];
                $rn = $_SESSION['user_id']; 
                $query = "SELECT cart_id  from shopping_cart where customer_id = $rn";
                $res = $connection->prepare($query);
                $res->execute();
                $result = $res->fetchAll();
                $cart_id = $result[0][0];
                $sql = "delete from shopping_item where cart_id = $cart_id AND item_id = $productID";
                ($connection->prepare($sql))->execute(); 
                unset($_SESSION['cart'][$key]);
                echo "<script>alert('Product has been Removed...!')</script>";
              echo "<script>window.location = 'cart.php'</script>";
             
            }
        }
    }
  }

  if (isset($_POST['plus'])){
    
    if ($_GET['action'] == 'remove'){
        $id = $_GET['id'];
        $rn = $_SESSION['user_id']; 
        $query = "SELECT cart_id  from shopping_cart where customer_id = $rn";
        $res = $connection->prepare($query);
        $res->execute();
        $result = $res->fetchAll();
        //print_r( $result[0][0]);
        $cart_id = $result[0][0];
        $item_id = $_GET['id'];
        $sql = "Update shopping_item
        Set  item_quantity = item_quantity + 1
        Where cart_id = $cart_id AND item_id = $item_id";
        ($connection->prepare($sql))->execute();
        $getitemPriceQuery = "select item_price from item where item_id = $id";
        $itemQuery = $connection->prepare($getitemPriceQuery);
        $itemQuery->execute();
        $item_pricequeryResult = $itemQuery->fetchAll();
        $totalPrice = $totalPrice + $item_pricequeryResult[0][0];
    }
}


if (isset($_POST['minus'])){
    
    if ($_GET['action'] == 'remove'){
        $id = $_GET['id'];
        $rn = $_SESSION['user_id']; 
        $query = "SELECT cart_id  from shopping_cart where customer_id = $rn";
        $res = $connection->prepare($query);
        $res->execute();
        $result = $res->fetchAll();
        //print_r( $result[0][0]);
        $cart_id = $result[0][0];
        $item_id = $_GET['id'];
        $sql = "Update shopping_item
        Set  item_quantity = item_quantity -1
        Where cart_id = $cart_id AND item_id = $item_id AND item_quantity <> 1";
        ($connection->prepare($sql))->execute();
         
    }
}



if (isset($_POST['placeorder'])){
    $custid = $_SESSION['user_id'];
   

    $cartIDsql = "select cart_id from shopping_cart where customer_id = $custid";
    $cart = $connection->prepare($cartIDsql);
    $cart->execute();
    $CartID_ = $cart->fetchAll();
    $cartID = $CartID_[0][0];
    $amountQuery = "SELECT SUM(F.price)
    FROM 
   (SELECT SUM(item.item_price * shopping_item.item_quantity)  as price
    FROM shopping_item, item 
    WHERE shopping_item.item_id = item.item_id AND cart_id = $cartID) as F;";



     $amount_ = $connection->prepare($amountQuery);
     $amount_->execute();
     $amountPayable_ = $amount_->fetchAll();
     $amount = $amountPayable_[0][0];


     
    $amountPayable = $_SESSION["AmountPayable"];
    $insertcustOrder = "INSERT INTO customer_order (order_status,cust_id,amountPayable)
    VALUES (\"Order Confirmed\" , $custid, $amount)";
    ($connection->prepare($insertcustOrder))->execute();
    $orderNoquery = "select MAX(order_no) from customer_order ";
    $res = $connection->prepare($orderNoquery);
    $res->execute();
    $orderNo = $res->fetchAll();
    $order_no = $orderNo[0][0];
    $item = "select item_id,item_quantity from shopping_item where cart_id in (select cart_id from shopping_cart where customer_id = $custid AND cart_id is not null) ";
    $res = $connection->prepare($item);
    $res->execute();
    $qres = $res->fetchAll();
    for($x  = 0 ; $x < sizeof($qres) ; $x++){
        $q = $qres[$x][1];
        $id = $qres[$x][0];
      $insertQuery = "INSERT INTO order_item(order_no,quantity, item_id) VALUES($order_no,$q,$id)";  
      ($connection->prepare($insertQuery))->execute();
    }

    $inventoryUpdateSQL = "UPDATE item,shopping_item
      SET item.item_stock = item.item_stock - shopping_item.item_quantity
      WHERE item.item_id = shopping_item.item_id AND shopping_item.cart_id = $cartID";
  $inventoryUpdate = $connection->prepare($inventoryUpdateSQL);
  $inventoryUpdate->execute();


     $query_delete1 = "delete from shopping_item where cart_id in (select cart_id from shopping_cart where customer_id = $custid)";
    ($connection->prepare($query_delete1))->execute();
     $query_delete2 = "delete from shopping_cart where customer_id = $custid";
     ($connection->prepare($query_delete2))->execute();
     $deliveryCharges = $_SESSION['deliveryCharges'];
     $getAddressID = "select address_id from address where customer_id = $custid";
     $getAddressIDarray = $connection->prepare($getAddressID);
    $getAddressIDarray->execute();
    $addressIDarray = $getAddressIDarray->fetchAll();
    $addressID = $addressIDarray[0][0];
     $insertShippingQuery = "INSERT INTO shipping(shipping_partner , method , cost,order_no, address_id) VALUES('TCS', 'Cash On Delivery',$deliveryCharges,$order_no,$addressID)";  
      ($connection->prepare($insertShippingQuery))->execute();
      
  
    unset($_SESSION["cart"]);
}



if (isset($_POST['wishlist'])){
    if ($_GET['action'] == 'remove'){
        foreach ($_SESSION['cart'] as $key => $value){
            if($value["product_id"] == $_GET['id']){
                $productID  = $_GET['id'];
                $rn = $_SESSION['user_id']; 
                $query = "SELECT cart_id  from shopping_cart where customer_id = $rn";
                $res = $connection->prepare($query);
                $res->execute();
                $result = $res->fetchAll();
                $cart_id = $result[0][0];

                $sql = "delete from shopping_item where cart_id = $cart_id AND item_id = $productID";
                ($connection->prepare($sql))->execute();
                $countQuery = "select count(*) from wish_list where customer_id = $rn AND item_id = $productID";
                $res = $connection->prepare($countQuery);
                $res->execute();
                $result = $res->fetchAll();
                $count = $result[0][0];
                if($count == 0 ){
                    $insert_wishlistQuery = "INSERT into wish_list VALUES($rn , $productID)";
                    $res = $connection->prepare($insert_wishlistQuery);
                    $res->execute();
                }
                unset($_SESSION['cart'][$key]);
                echo "<script>alert('Product has been added to wish list')</script>";
              echo "<script>window.location = 'cart.php'</script>";
             
            }
        }
    }
  }



?>

</head>
<body class="bg-light">
<script src="script.js"></script>
<div class="container-fluid">
<div class="row px-5">
<div class="col-md-7">
<div class="shopping-cart">
<?php
if(isset($_SESSION['cart'])){
echo "<div class=\"alert alert-primary text-center \" role=\"alert\">
My Cart
  
</div>";

}
else{
    echo "<div class=\"alert alert-danger text-center \" role=\"alert\">
    No items in the cart!
      
  </div>";
}
?>
<?php
    if(isset($_SESSION['cart'])){
        $rn = $_SESSION['user_id']; 
        
        $product_id = array_column($_SESSION['cart'],'product_id');
        $query = "SELECT item_id,item_price,item_name  from item";
        $res = $connection->prepare($query);
        $res->execute();
        $result = $res->fetchAll();
       for ($i = 0; $i < sizeof($result); $i++) {
        $temp[$i] = $result[$i][0];
      }
    //   $del = "delete from shopping_item where cart_id  = $cartid";
    //   $res =  $connection->prepare($del);
    //   $res->execute();
        for ($count = 0; $count < sizeof($product_id); $count++) {
            if (in_array($product_id[$count], $temp))
            {
               
                $key = array_search($product_id[$count], $temp);
                $itemid = $temp[$key];
                $totalPrice = $totalPrice + (int)$result[$key][1];
                // print_r($key);   
                // echo "<br>";
                // print_r($result[$key][2]);
                $query44 = "SELECT cart_id  from shopping_cart where customer_id = $rn";
                $x = $connection->prepare($query44);
                $x->execute();
                $yy = $x->fetchAll();
                $cartid  = $yy[0][0];
                $_SESSION['cartid'] =  $cartid; 
                $item_quantity = "SELECT item_quantity from shopping_item where item_id = $temp[$key] AND cart_id = $cartid ";
                $exc = $connection->prepare($item_quantity);
                $exc->execute();
                $result_query = $exc->fetchAll();
                //print_r($result_query[0]);
                cartElement($temp[$key],$result[$key][2],$result[$key][1],$result_query[0][0]);
 
               
            }
        }

    }

    ?>
</div>  
</div>
<div class="col-md-4 offset-md-1 border rounded mt-5 bg-white h-25">
<div class="pt-4">
<h6> PRICE DETAILS </h6>
<hr>
<div class="row price-details">
    <div class="col-md-6">
    <?php
    if(isset($_SESSION['cart'])){
        echo "<h6> Price( ALL  items) </h6>";


    }else{
        echo "<h6> Price(0 items) </h6>";
    }
    
    
    ?>
    <h6>Delivery Charges </h6>
    <hr>
    <h6>Amount Payable</h6>
    </div>
    <div class="col-md-6">
    <h6><?php 
    if(isset($_SESSION["cartid"])){
    $cart_id = $_SESSION['cartid'];
    $tPriceQuery = "SELECT SUM(F.price)
    FROM 
   (SELECT SUM(item.item_price * shopping_item.item_quantity)  as price
    FROM shopping_item, item 
    WHERE shopping_item.item_id = item.item_id AND cart_id = $cart_id) as F;";
    $sqlResult = $connection->prepare($tPriceQuery);
    $sqlResult->execute();
    $tPricearr = $sqlResult->fetchAll();
    $totalPrice = $tPricearr[0][0];

    }
    
    echo "PKR ";echo $totalPrice; ?></h6>
    <h6 class = "text-success"><?php 
        $deliveryCharges = 0;
    if($totalPrice > 10000) {
        echo "Free Delivery";
        
        $_SESSION["totalPrice"]  = $totalPrice;
        $_SESSION['deliveryCharges'] = $deliveryCharges;
    }
        else if($totalPrice <= 10000 && $totalPrice > 0)
        {   $deliveryCharges = 300;
            $_SESSION['deliveryCharges'] = $deliveryCharges;
            echo  $deliveryCharges;
        }
        else{
            echo  'PKR 0';
        }
    ?></h6>
<br>
<h6><?php 
    echo "PKR ";
    echo $totalPrice + $deliveryCharges ;
    $_SESSION["AmountPayable"] = $totalPrice + $deliveryCharges;
    ?></h6>
    <br>
    <?php if(isset($_SESSION['cart'])){
        
        echo "<form action=\" \" method=\"post\">
        <button name = \"placeorder\" type=\"submit\" class=\"btn btn-primary\">CheckOut</button>
        
        </form>";
    } ?>
    
    </div>
</div>
</div>
</div>
</div>
</div>




<link rel="stylesheet" href="style.css">
</body>
</html>