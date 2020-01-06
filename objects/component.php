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
    $$productPrice
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
<h5 class=\"pt-2\">$$productPrice</h5>
<button type=\"submit\" class=\"btn btn-warning\">Save for later</button>
<button type=\"submit\" class=\"btn btn-danger mx-2\" name=\"remove\">Remove</button>
</div>  
<div class=\"col-md-3 py-5 my-5\">
<div>
<button name = \"minus\" type=\"submit\" class=\"btn bg-light border-rounded-circle\"><i class=\"fas fa-minus\"></i></button>
<input type=\"text\" value=\"$item_quantity\" class=\"form-control w-25 d-inline\" id=$productID >
<button name=\"plus\"   type=\"submit\" class=\"btn bg-light border-rounded-circle\"><i class=\"fas fa-plus\"></i></button>
</div>
</div> 
</div>
</div>
</form>";
echo $element;
}