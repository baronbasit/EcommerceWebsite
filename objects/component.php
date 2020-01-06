<?php
function component($productID,$productName, $productPrice, $productDescription){
    $element = "
    <div class=\"col-md-3 col-sm-6 my-3 my md-0\">
    <form action=\"\" method=\"post\">
    <div class=\"card shadow\">
    <div class=\"\">
    <img src=\"./uploads/images/$productName.jpg\" alt=\"image1\" class=\"img-fluid card-img-top\">
    </div>
    <div class=\"card-body text-center \">
    <h5 class=\"card-title\">$productName</h5>
    <p class=\"card-text\">
    $productDescription
    </p>
    <h5>
    <span class=\"price\">
    PKR $productPrice
    </span>
    </h5>
    <button type=\"submit\" name=\"add\" class=\"btn btn-warning my-3\"> Add to Cart
    <i class=\"fas fa-shopping-cart\"></i>
    </button>
    <input type='hidden' name='product_id' value='$productID'>
    </div>
    </div>
    </form>

    </div>
    ";
    echo $element;
}




function cartElement($productID,$productName, $productPrice, $item_quantity){
$element = "<form action=\"./cart.php?action=remove&id=$productID\" method = \"post\" class=\"cart-items\">
<div class=\"border rounded\">
<div class=\"row bg-white\">
<div class=\"col-md-3\">
<img src=\"./uploads/images/$productName.jpg\" alt=\"product\" class=\"img-fluid\" style=\"height:200px;width=auto;\">
</div>
<div class=\"col-md-6 pt-5\">
<h5 class=\"pt-2\">$productName</h5>
<small class=\"text-secondary\">Seller: dailytution</small>
<h5 class=\"pt-2\">PKR $productPrice</h5>
<button name=\"wishlist\" type=\"submit\" class=\"btn btn-warning\">Add to WishList</button>
<button type=\"submit\" class=\"btn btn-danger mx-2\" name=\"remove\">Remove</button>
</div>  
<div class=\"col-md-3 py-5 my-5\">
<div>
<button name = \"minus\" type=\"submit\" class=\"btn bg-light border-rounded-circle\"><i class=\"fas fa-minus\"></i></button>
<input type=\"text\" value=\"$item_quantity\" class=\"form-control w-25 d-inline px-2\" id=$productID >
<button name=\"plus\"   type=\"submit\" class=\"btn bg-light border-rounded-circle\"><i class=\"fas fa-plus\"></i></button>
</div>
</div> 
</div>
</div>
</form>";
echo $element;
}



function OrderedItems($productID ,   $productName , $productPrice,$productQuantity,$status){
$element = "<form action=\"./order.php?action=addReview&id=$productID\" method = \"post\" name = \"_review\"class=\"cart-items\">
<div class=\"border rounded\">
<div class=\"row bg-white\">
<div class=\"col-md-3\">
<img src=\"./uploads/images/$productName.jpg\" alt=\"product\" class=\"img-fluid\" style=\"height:200px;width=auto;\">
</div>
<div class=\"col-md-6 pt-5 pb-3\">
<h5 class=\"pt-2\">$productName</h5>
<h6 class=\"pt-2\">PKR $productPrice</h6>
<h6 class=\"pt-2\">Quantity : $productQuantity</h6>
<h6 class=\"pt-2\">Order status : $status</h6>
<div class=\"form-group\">
<label for=\"exampleInputEmail1\">Email address</label>
<input name = \"rating\" type=\"text\" class=\"form-control\" id=\"rating\" aria-describedby=\"rating\" placeholder=\"Enter rating from 1 to 10\">
</div>
  <div class=\"form-group\">
    <label for=\"exampleFormControlTextarea1\">Comment</label>
    <textarea name = \"comment\" class=\"form-control\" id=\"Comment\" rows=\"2\"></textarea>
  </div>
<button id=\"$productID\" type=\"submit\" class=\"btn btn-info mx-2\" name=\"review\" onClick=\"review()\">Add a Review</button>
</div>

<div class=\"col-md-3 py-5 my-5\">
<div>

</div>
</div> 
</div>
</div>
</form>\"
";


    echo $element;
}


function priceDetails($counter, $totalPrice, $deliveryCharges, $amountPayable, $orderno){
$element = "        
<div class=\"pt-4\">
  <h6>  Order Number $orderno PRICE DETAILS 
  </h6>
  <hr>
  <div class=\"row price-details\">
    <div class=\"col-md-6\">                
<h6> Price of all items </h6>

      <h6>Delivery Charges 
      </h6>
      <hr>
      <h6>Amount Payable
      </h6>
    </div>
    <div class=\"col-md-6\">
      <h6>
        $totalPrice
      </h6>
      <h6 class = \"text-success\">
        $deliveryCharges

      </h6>
      <br>
      <h6>
PKR $amountPayable

      </h6>
      <br>
    </div>
  </div>
</div>";
echo $element;
}