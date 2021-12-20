<?php
require('db.php');
$query = "SELECT * FROM reg";
$stm = $db->prepare($query);
$stm->execute();
$myarray = array();
while ($resultFrom =$stm -> fetch()){
    array_push(
        $myarray,array(
            "mobile"=>$resultFrom['mobile'],
            "name" =>$resultFrom['name'],
            "email" => $resultFrom['email'],
            "pincode" =>$resultFrom['pincode'],
            "password" => $resultFrom['password']
        )
    );
}
echo json_encode($myarray);

?>