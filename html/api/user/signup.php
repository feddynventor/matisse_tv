<?php
 
// get database connection
include_once '../config/database.php';
 
// instantiate user object
include_once '../objects/user.php';

if ($_POST['confpass'] != $_POST['password']){
    print_r(array(
        "status" => false,
        "message" => "Password non corrisp!"
    ));
    return;
}

$database = new Database();
$db = $database->getConnection();
 
$user = new User($db);
// set user property values
$user->username = $_POST['username'];
$user->password = base64_encode($_POST['password']);
$user->created = date('Y-m-d H:i:s');

// create the user
if($user->signup()){
    $user_arr=array(
        "status" => true,
        "message" => "Ottimo! TORNA INDIETRO oppure VAI ALLA PAGINA PRINCIPALE, quindi effettua il login!",
        "username" => $user->username,
        "id" => $user->id
    );
    echo "<script type='text/javascript'>window.top.location='https://feddynventor.ddns.net:31713/matisse/am4rpp.php';</script>"; exit;
}
else{
    $user_arr=array(
        "status" => false,
        "message" => "Esisti gia'"
    );
}
//print_r(json_encode($user_arr));
?>
