<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/user.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user object
$user = new User($db);
if (empty($_GET['username']))
  die();
// set ID property of user to be edited
$user->username = isset($_GET['username']) ? $_GET['username'] : die();
$user->password = base64_encode(isset($_GET['password']) ? $_GET['password'] : die());
// read the details of user to be edited
$stmt = $user->login();
if($stmt->rowCount() > 0){
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    //Success login
    ?>
        <h3> Stai per essere reindirizzato <br>all'applicazione, attendi <u>5 secondi</u> max </h3>
        <form id="my_form" action="app.php" method="post">
            <input type="hidden" name="ddata" value="<?php echo base64_encode(serialize(array('id'=>$row['id'],'email'=>$row['username'],'credit'=>$row['credit']))); ?>" >
            <input type="hidden" name="to_watch" value="<?php echo -1; ?>">
            <input type="submit" name="submission_button" value="Clicca qui se sei bloccato in questa pagina">
        </form>
        
        <script type="text/javascript">
            function submitForm() {
                document.getElementById('my_form').submit();
            }
            window.onload = submitForm;
        </script>
    
    <?php
}
else{
    print_r(json_encode(array(
        "status" => false,
        "message" => "Username o pass errati",
    )));
}

?>
