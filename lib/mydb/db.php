 <?php

 $dns = 'mysql:localhost;dbname=id18055802_flutter';
 $user = 'id18055802_evstation';
 $pass = 'Dbi/y$04(!&Y?F4%';

 try{
     $db = new PDO ($dns, $user, $pass);
     echo 'connected successfully';
 }catch( PDOException $e){
     $error = $e->getMessage();
     echo $error;
 }