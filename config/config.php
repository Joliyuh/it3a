<?php
session_start();

require_once(__DIR__ . '/../functions/activity.php');
require_once(__DIR__ . '/../functions/auth.php');
require_once(__DIR__ . '/../functions/redirect.php');
require_once(__DIR__ . '/../functions/session.php');


//define('', '');

define('BASE_URL','http://localhost/it3a');

define('DB_HOST','localhost');
define('DB_NAME','it3a_lab_db');
define('DB_USER','root');
define('DB_PASS','');

$user_id = "root" ?? null;
$user_email = "root" ?? null;


try{
    $pdo = new PDO(
        'mysql:host='.DB_HOST.';dbname='.DB_NAME,
        DB_USER,
        DB_PASS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    //echo ("Connection Successful");
    // echo ($user_id , $user_email , 'connect_db', 'success');
    // logActivity($pdo,$user_id,$user_email,'connect_db', 'success');

}catch(PDOException $e){
    die("Connection failed: " . $e->getMessage());
}


?>