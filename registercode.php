<?php
//$servername = "127.0.0.1";
// $username = "webaccess";
// $password = "sst2RkAusKWr87hY";
// $dbname = "ecommerce";
// // Create connection
// $connection = new mysqli($servername, $username, $password,$dbname);

// // Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }
if(isset($_POST["submit"])) { 
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];
    $pswdMatch = $password == $cpassword;
    if($pswdMatch == true){
    $password = password_hash($_POST['password'] , PASSWORD_DEFAULT);
    $sql = "INSERT INTO user (f_name,l_name, email, password)
        VALUES ('$_POST[fname]','$_POST[lname]','$_POST[email]' , '$password')";
    
    if ($db->query($sql)) {
        $userid = ($db->query("Select user_id from user where email = '$_POST[email]'"))->fetchColumn();;
        $sql_2 = "INSERT INTO customer(customer_id,phone_number,mobile_number) VALUES ($userid,'$_POST[pNumber]' ,$_POST[mNumber])";
        $db->query($sql_2);
        if(isset($_POST['checkBox'])){
            $sql_5 = "INSERT INTO address(bill_ship,address_1,address_2,country,state,zip,customer_id) VALUES('X','$_POST[add1]','$_POST[add2]','$_POST[Country]','$_POST[state]','$_POST[zip]',$userid)";
            $db->query($sql_5);
            }
        else{
            $sql_6 = "INSERT INTO address(bill_ship,address_1,address_2,country,state,zip,customer_id) VALUES('S','$_POST[add1]','$_POST[add2]','$_POST[Country]','$_POST[state]','$_POST[zip]',$userid)";
            $db->query($sql_6);
            $sql_7 = "INSERT INTO address(bill_ship,address_1,address_2,country,state,zip,customer_id) VALUES('B','$_POST[add1Billing]','$_POST[add2Billing]','$_POST[CountryBilling]','$_POST[stateBilling]','$_POST[zipBilling]',$value)";
            $db->query($sql_7);
        }    echo "<script>alert('Registration successful')</script>";
              echo "<script>window.location = 'login.php'</script>";     
        }
        else {

            echo "<script>alert('User already exists')</script>";
              echo "<script>window.location = 'register.php'</script>";
    } 
    }
    else
    echo "<script>alert('Passwords do not match')</script>";
              echo "<script>window.location = 'register.php'</script>";
    }



?>