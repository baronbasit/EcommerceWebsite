<?php
// include 'config/database.php';
// ob_start();
// session_start();
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    echo "<script>alert('Already logged in')</script>";
    echo "<script> window.location.href = \"./products.php\"; </script>";
}
if(isset($_POST["lgnBtn"])) { 

   // $password = password_hash($_POST['password'] , PASSWORD_DEFAULT);
    //password_verify ( string $password , string $hash )
    $sql_q = "Select password from user where email = '$_POST[email]'";
    $result = $db->query($sql_q);
    // $result->setFetchMode(PDO::FETCH_ASSOC);
    $password = $result->fetchColumn();
    $user_id = ($db->query("Select user_id from user where email = '$_POST[email]'"))->fetchColumn();;
    $firstName = ($db->query("Select f_name from user where email = '$_POST[email]'"))->fetchColumn();;
    $lastName = ($db->query("Select l_name from user where email = '$_POST[email]'"))->fetchColumn();;
    if( password_verify($_POST['password'] , $password)){
        $_SESSION["loggedin"] = true;
        $_SESSION["user_id"] = $user_id;
        $_SESSION["firsname"] = $firstName;
        $_SESSION["lastname"] = $lastName;
        $_SESSION["user_id"] = $user_id;
        $_SESSION["email"] = $_POST['email']; 
         echo "  <script> document.getElementById('login_register').innerHTML='$firstName $lastName';</script>";
         echo "<script> window.location.href = \"./products.php\"; </script>";
    }
    else{
        echo "<script>alert('Invalid Email or Password')</script>";
              echo "<script>window.location = 'login.php'</script>";
    }
}
?>