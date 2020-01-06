<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order
    </title>
    <link rel="stylesheet" href="style.css">
    <?php
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

?>
  </head>
  <body class="bg-light">
    <script src="script.js">
    </script>
    <div class="container-fluid">
      <div class="row px-5">
        <div class="col-md-7">
          <div class="shopping-cart">
            <?php
$user_id = $_SESSION['user_id'];
$sql = "select count(*) from customer_order where cust_id = $user_id ";
$res = $connection->prepare($sql);
$res->execute();
$result = $res->fetchAll();
$order_no = $result[0][0];
if($order_no == 0){
echo "<div class=\"alert alert-danger text-center \" role=\"alert\">
No order placed
</div>";
}
else  {
echo "<div class=\"alert alert-primary text-center \" role=\"alert\">
My Orders
</div>";
}
$sql_ordernoQuery = "Select order_no,order_status from customer_order where cust_id = $user_id";
$getOrderno = $connection->prepare($sql_ordernoQuery);
$getOrderno->execute();
$ordernoarray = $getOrderno->fetchAll();
for($i =0 ; $i < sizeof($ordernoarray) ; $i++){
$order__no = $ordernoarray[$i][0];
$orderStatus = $ordernoarray[$i][1];
$sql = "select DISTINCT item_id from order_item where order_no =$order__no";
echo "<div class=\"alert alert-primary text-center \" role=\"alert\">
Order number : $order__no
</div>";
$res = $connection->prepare($sql);
$res->execute();
$result = $res->fetchAll();
for($x =0 ; $x < sizeof($result) ; $x++){
$item_id = $result[$x][0];
$sqlQ = "select item_name , item_price from item where item_id = $item_id";
$r = $connection->prepare($sqlQ);
$r->execute();
$resu = $r->fetchAll();
$item_name = $resu[0][0];
$item_price = $resu[0][1];
$query_get_itemquantity = "select quantity from order_item where order_no = $order__no AND item_id = $item_id";
$run = $connection->prepare($query_get_itemquantity);
$run->execute();
$itemquantityresult = $run->fetchAll();
$itemquantity = $itemquantityresult[0][0];
OrderedItems($item_id,$item_name,$item_price,$itemquantity,$orderStatus);
}
}
?>
            <?php
?>
          </div>  
        </div>
        <?php 
        $user_id = $_SESSION['user_id'];
        $order_detailsQuery = "select order_no, amountPayable from customer_order where cust_id = $user_id";
        $orderdetails_r = $connection->prepare($order_detailsQuery);
        $orderdetails_r->execute();
        $order_details = $orderdetails_r->fetchAll();
        //print_r($order_details);
        echo "<div class=\"col-md-4 offset-md-1 border rounded mt-5 bg-white h-25\">";
        for($c = 0 ; $c < sizeof($order_details) ; $c++){
        $orderNumber = $order_details[$c][0];
        $cq = "select count(*) from order_item where order_no = $orderNumber";
        $c_q = $connection->prepare($cq);
        $c_q->execute();
        $countitems = $c_q->fetchAll();
        $counter = $countitems[0][0];
        $gettotalpriceq = "select amountpayable from customer_order where order_no = $orderNumber";
        
        $gettotalpriceResult = $connection->prepare($gettotalpriceq);
        $gettotalpriceResult->execute();
        $getTotalPricearray = $gettotalpriceResult->fetchAll();
        $totalprice = $getTotalPricearray[0][0];
        $amountpayable = $order_details[$c][1];
        $getDeliveryCost = "select cost from shipping where order_no = $orderNumber";
        $getCostArray = $connection->prepare($getDeliveryCost);
        $getCostArray->execute();
        $getCostArrayResult = $getCostArray->fetchAll();
        $DeliveryCost = $getCostArrayResult[0][0];
        priceDetails($counter,$totalprice,$DeliveryCost,$amountpayable,$orderNumber);
         echo"<hr>";

        } 
        

        if (isset($_POST['review'])){
    if ($_GET['action'] == 'addReview'){
        $product_ID  = $_GET['id'];
        $item_rating = $_POST['rating'];
        $insert_review = "INSERT into review  (item_rating, comment , customer_id , item_id ) values ($item_rating,'$_POST[comment]', $user_id,$product_ID)";
        $addReview = $connection->prepare($insert_review);
        $addReview->execute();
      }
  }

echo "</div>";
        ?>
      </div>
    </div>
    <link rel="stylesheet" href="style.css">
  </body>
</html>
