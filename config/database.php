<?php
/**
 * used to get a connection to the mysql database
 */
class Database {

//   $servername = "127.0.0.1";
// $username = "webaccess";
// $password = "sst2RkAusKWr87hY";
// $dbname = "ecommerce";
  private $host = "localhost";
  private $db_name = "ecommerce";
  private $username = "webaccess";
  private $password = "sst2RkAusKWr87hY";
  public $conn;

  //get the db connection
  public function getConnection(){
    $this->conn = null;

    try{
      $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
    }catch(PDOException $exception){
      echo "Connection error: " . $exception->getMessage();
    }

    return $this->conn;
  }
}


?>
