<head> <meta name='viewport' content='width=device-width'> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> </head></head>
<style>
body{
    background-color: #000000 !important;
    color: #FFFFFF !important;
}
</style>

<?php
include_once '../config/database.php';
include_once '../objects/video.php';
include_once '../objects/user.php';
include_once '../objects/purchases.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare video object
$videos = new Video($db);
$usero = new User($db);
$purchase = new Purchase($db);

$ddata =  unserialize(base64_decode($_POST['ddata']));
$ID = $ddata['id'];
$CRD = $ddata['credit'];
$USR = $ddata['email'];
$VID = $_POST['video'];
$REC = $_POST['rec'];

$NOME = '';
$COST = -1;
$CAT = -1;

?>

<html><body><center>

<?php

$stmt = $videos->details($VID);
if($stmt->rowCount() > 0){
    // get retrieved row
    $row = $stmt->fetch();

    $NOME = $row['nome'];
    $COST = $row['cost'];
    $CAT = $row['channel'];
}

$BUY = 1;
$purchase->user_id = $ID;
$purchase->video_id = $VID;
$stmt = $purchase->verify();
if($REC==1 && $COST==1){
    $BUY=0;
} else {
if($stmt->rowCount() > 0){
    $BUY = 0;
} else {
    if ($COST > $CRD){
        $BUY = 2;
    } else {
        $BUY = 1;
        $CRD = $CRD-$COST;
        $purchase->addnew();
        if ($usero->creditcharge($ID, $CRD) == FALSE){
            echo "FATAL SOOS";
            return;
        }
    }
}
}

?>

<form id="toLive" action="app.php" method="post">
    <input type="hidden" name="ddata" value="<?php echo base64_encode(serialize(array('id'=>$ID,'email'=>$USR,'credit'=>$CRD))); ?>" >
    <?php

    if ($BUY==1) {
        echo "<h3><i>Hai appena acquistato </i>".$NOME."<br>Ti rimangono <b><u>".$CRD." crediti</u></b> </h3>";
    } elseif ($BUY==0) {
        echo "<h3>Hai già acquistato ".$NOME."<br>Buona visione</h3>";
    }

    if ($BUY==2) {
        echo "<h3>Non hai abbastanza crediti</h3> <input type='hidden' name='to_watch' value=-1>";
        echo "<br><br><input class='btn btn-warning' style='width:100%;padding:12px 28px;' type='submit' name='submission_button' value='Clicca qui per tornare alla HOME'>";
    } else {
	echo "<input type='hidden' name='rec' value=".$REC.">";
	echo "<input type='hidden' name='to_watch' value=".$VID.">";
	echo "<input type='hidden' name='cat' value=".$CAT.">";
	echo "<input type='hidden' name='titolo' value='{$NOME}'>";
        echo "<input class='btn btn-warning' style='width:100%;padding:48px 28px;' type='submit' name='submission_button' value='Clicca qui per avviare la LIVE'>";
	?><script type="text/javascript">
	    document.getElementById("toLive").submit();
	</script><?php
    }

    ?>
    
</form>

</center></body></html>
