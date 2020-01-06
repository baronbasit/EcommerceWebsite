<?php
// 'product image' object
class ProductImage{

      // database connection and table name
      private $conn;
      private $table_name = "item";

      // object properties
      public $item_id;
      public $item_name;
      public $timestamp;

      // constructor
      public function __construct($db){
          $this->conn = $db;
      }

      // read the first product image related to a product
      function readFirst(){
        // select query
        $query = "SELECT item_id, item_name
                FROM " . $this->table_name . "
                WHERE item_id = ?
                ORDER BY item_id ASC
                LIMIT 0, 1";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->item_id=htmlspecialchars(strip_tags($this->item_id));

        // bind prodcut id variable
        $stmt->bindParam(1, $this->item_id);

        // execute query
        $stmt->execute();

        // return values
        return $stmt;
      }
}
