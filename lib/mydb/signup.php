<?php

require("db.php");

$mobile = $_POST["mobile"];
$name = $_POST["name"];
$email = $_POST["email"];
$pincode = $_POST["pincode"];
$password = $_POST["password"];

$query = "SELECT * FROM reg WHERE email LIKE '$mobile'";
$res = mysqli_query($con, $query);
$data = mysqli_fetch_array($res);

if($data[0]>1){
echo json_encode("account already exists");
}
else{
$query = "INSERT INTO reg(mobile,name,email,pincode,password) VALUES ('$mobile','$name','$email','$pincode','$password')";
$res = mysql_query($query);

if($res){
echo json_encode("true");
}else{
echo json_encode("false");
}

}
?>