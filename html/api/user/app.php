<?php include_once '../config/database.php'; include_once '../objects/video.php'; include_once '../objects/channel.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare video object
$videos = new Video($db);
$channels = new Channel($db);

$ddata =  unserialize(base64_decode($_POST['ddata']));
$ID = $ddata['id'];
$USR = $ddata['email'];
$CRD = $ddata['credit'];
$SRT = $_POST['to_watch'];
$CAT = $_POST['cat'];
$REC = $_POST['rec'];

// Streams con rec tag =1
$recorded = array();

if (isset($_POST['titolo'])){
    $NOM = $_POST['titolo'];
}
$DESC = ""; //tramite il caricamento da query, compilazione tabella
$AIR = 0;

if (!isset($ddata) or $ddata==""){
    header('Location: https://feddynventor.ddns.net:31713/matisse/am4rpp.php');
}

?>

<html>
<!--
## NON SI FOTTE CON LA COOPERATIVA MATISSE SHDRONZI ##

  __          _     _                            _             
 / _| ___  __| | __| |_   _ _ ____   _____ _ __ | |_ ___  _ __ 
| |_ / _ \/ _` |/ _` | | | | '_ \ \ / / _ \ '_ \| __/ _ \| '__|
|  _|  __/ (_| | (_| | |_| | | | \ V /  __/ | | | || (_) | |   
|_|  \___|\__,_|\__,_|\__, |_| |_|\_/ \___|_| |_|\__\___/|_|   
                      |___/                                    

-->
    <head>
        <meta name="viewport" content="width=device-width">
	<title><?php
	if (isset($_POST['titolo'])){
		echo $NOM;
	} else {
		echo "Matisse TV by feddy";
	}
	?></title>
        <!-- <title>Babbiscia TV</title> -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/clappr@latest/dist/clappr.min.js"> </script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/clappr-chromecast-plugin@latest/dist/clappr-chromecast-plugin.min.js"> </script>

        <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
        <link rel='stylesheet prefetch' href='../epg.css'>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    </head>

<script>
class FastForward extends Clappr.UICorePlugin {
  get name() { return 'fast_forward' }
  get attributes() { return { class: 'fast-forward' } }

  get events() {
    const events = { click: 'onClick' }
    return events
  }

  constructor(core) {
    super(core)
    this.bindEvents()
  }

  bindEvents() {
    this.stopListening(this.core)
    this.listenTo(this.core, Clappr.Events.CORE_ACTIVE_CONTAINER_CHANGED, this.onContainerChanged)
    this.listenTo(this.core, Clappr.Events.CORE_READY, this.bindMediaControlEvents)
  }

  bindMediaControlEvents() {
    this.stopListening(this.core.mediaControl)
    this.listenTo(this.core.mediaControl, Clappr.Events.MEDIACONTROL_RENDERED, this.render)
  }

  onContainerChanged() {
    this.container && this.stopListening(this.container)
    this.container = this.core.activeContainer
  }

  onClick() {
    this.core.getCurrentPlayback().seek(this.core.getCurrentPlayback().getCurrentTime() + 5)
  }

  show() {
    this.$el.show()
  }

  hide() {
    this.$el.hide()
  }

  render() {
    this.$el.append(Clappr.Styler.getStyleFor('.fast-forward { position: static; float: left; height: 30px; width: 30px; z-index: 999; background-color: green}'))
    this.core.mediaControl && this.core.mediaControl.$('.media-control-right-panel').append(this.el)
    return this
  }
}

class Backward extends Clappr.UICorePlugin {
  get name() { return 'backward' }
  get attributes() { return { class: 'backward' } }

  get events() {
    const events = { click: 'onClick' }
    return events
  }

  constructor(core) {
    super(core)
    this.bindEvents()
  }

  bindEvents() {
    this.stopListening(this.core)
    this.listenTo(this.core, Clappr.Events.CORE_ACTIVE_CONTAINER_CHANGED, this.onContainerChanged)
    this.listenTo(this.core, Clappr.Events.CORE_READY, this.bindMediaControlEvents)
  }

  bindMediaControlEvents() {
    this.stopListening(this.core.mediaControl)
    this.listenTo(this.core.mediaControl, Clappr.Events.MEDIACONTROL_RENDERED, this.render)
  }

  onContainerChanged() {
    this.container && this.stopListening(this.container)
    this.container = this.core.activeContainer
  }

  onClick() {
    this.core.getCurrentPlayback().seek(this.core.getCurrentPlayback().getCurrentTime() - 5)
  }

  show() {
    this.$el.show()
  }

  hide() {
    this.$el.hide()
  }

  render() {
    this.$el.append(Clappr.Styler.getStyleFor('.backward { position: static; float: left; height: 30px; width: 30px; z-index: 999; background-color: red; }'))
    this.core.mediaControl && this.core.mediaControl.$('.media-control-right-panel').append(this.el)
    return this
  }
}
</script>

<script>
function refreshAt(hours, minutes, seconds) {
    var now = new Date();
    var then = new Date();

    if(now.getHours() > hours ||
       (now.getHours() == hours && now.getMinutes() > minutes) ||
        now.getHours() == hours && now.getMinutes() == minutes && now.getSeconds() >= seconds) {
        then.setDate(now.getDate() + 1);
    }
    then.setHours(hours);
    then.setMinutes(minutes);
    then.setSeconds(seconds);

    var timeout = (then.getTime() - now.getTime());
    setTimeout(function() { window.location.reload(true); }, timeout);
}
</script>

    <body class="has-bg-img">

<?php $images = array(
1 => "https://cultura.biografieonline.it/wp-content/uploads/2018/01/Meditazione-dopo-il-bagno-Meditation-apres-le-bain-Meditation-after-the-bath-Matisse-1920-1921.jpg",
2 => "https://cultura.biografieonline.it/wp-content/uploads/2018/02/Donna-e-anemoni-Femme-et-anemones-Matisse-1920.jpg",
3 => "https://cultura.biografieonline.it/wp-content/uploads/2018/01/Piume-bianche-quadro-Matisse-picture-White-Plumes.jpg",
4 => "https://cultura.biografieonline.it/wp-content/uploads/2017/04/Tristezza-Tristezza-del-re-Sorrow-of-the-king-Matisse-1952.jpg",
5 => "https://cultura.biografieonline.it/wp-content/uploads/2017/04/Le-Violoniste-a-la-fenetre-The-Violinist-at-the-window-1918-Matisse.jpg",
6 => "https://cultura.biografieonline.it/wp-content/uploads/2017/03/Escargot-Matisse-1953.jpg",
7 => "https://cultura.biografieonline.it/wp-content/uploads/2017/02/Il-pittore-e-la-modella-Matisse-dettaglio.jpg",
8 => "https://cultura.biografieonline.it/wp-content/uploads/2016/11/Lezione-di-piano-Piano-lesson-Matisse.jpg",
9 => "https://cultura.biografieonline.it/wp-content/uploads/2016/09/Testa-bianca-e-rosa-Matisse-Tete-blanche-et-rose-White-and-rose-head.jpg",
10 => "https://cultura.biografieonline.it/wp-content/uploads/2016/01/Vaso-di-nasturzi-e-La-Danza-Matisse-dettaglio-del-vaso.jpg",
11 => "https://cultura.biografieonline.it/wp-content/uploads/2015/12/Pesci-rossi-Goldfish-Matisse-detail-dettaglio.jpg",
12 => "https://cultura.biografieonline.it/wp-content/uploads/2015/12/Lo-studio-rosa-Henri-Matisse-The-Pink-Studio-1911.jpg",
13 => "https://cultura.biografieonline.it/wp-content/uploads/2015/11/Matisse-Natura-morta-con-frutta-1910.jpg",
14 => "https://cultura.biografieonline.it/wp-content/uploads/2015/09/Conversazione-The-Conversation-Matisse-1908-1912.jpg",
15 => "https://cultura.biografieonline.it/wp-content/uploads/2014/11/Matisse-Musica-Music-Musique-1910.jpg",
16 => "https://cultura.biografieonline.it/wp-content/uploads/2012/12/matisse-stanza-rossa-armonia-in-rosso.jpg",
17 => "https://cultura.biografieonline.it/wp-content/uploads/2014/07/Matisse-self-portrait-autoritratto-1906.jpg",
18 => "https://cultura.biografieonline.it/wp-content/uploads/2014/07/Gioia-di-vivere-Matisse.jpg",
19 => "https://cultura.biografieonline.it/wp-content/uploads/2014/07/Woman-with-hat-Donna-con-cappello-Matisse-1905.jpg",
20 => "https://cultura.biografieonline.it/wp-content/uploads/2014/05/studio-sotto-i-tetti-matisse.jpg",
21 => "https://cultura.biografieonline.it/wp-content/uploads/2014/05/Buffet-e-tavolo-Matisse.jpg",
22 => "https://cultura.biografieonline.it/wp-content/uploads/2014/04/Natura-morta-con-due-bottiglie-Matisse.jpg",
23 => "https://cultura.biografieonline.it/wp-content/uploads/2012/11/matisse-la-danza-the-dance.jpg",
24 => "https://cultura.biografieonline.it/wp-content/uploads/2012/12/matisse-stanza-rossa-armonia-in-rosso.jpg"
);
$BK_IMAGE=$images[rand(1,24)]
?>

<style type="text/css">
th, td {
  padding: 3px;
}
.has-bg-img{
    background-color: #000000;
    display: flex;
    justify-content: center;
    position: relative;
}
.has-bg-img:after {
    content:'';
    background: url(<?php echo $BK_IMAGE ?>) center;
    position: absolute;
    top:0px;
    left: 0px;
    width:100%;
    height:100%;
    z-index:-1;
    opacity: 0.45;
}
.logo_footer {
    position: fixed;
    bottom: 10px;
    transform: translateX(-50%);
}
</style>

            <center>

            <img src="https://feddynventor.ddns.net:31713/images/logodef.png" width="400" height="150">
            <font color="#FFFFFF" face="Open Sans"> <h5> <?php echo date("d/m/Y H:i");?> </h5></font>
            <!-- <h1 style="color:white;"> TV a babbiscia </h1> -->
            </td><td>
            <table><tr><td>
                <font color="#FFFFFF" face="Open Sans"> <h5> <i>Benvenuto</i> <?php echo substr($USR, 0, strpos($USR, "@")); ?> </h5></font> </td><td>
                <form id="home" action="../../am4rpp.php" method="post"> <input type="submit" class="btn btn-light" value="LOGOUT"> </form> </td></tr> <tr><td>
                <font color="#FFFFFF" face="Open Sans"> <h6> <i>Hai a disposizione</i> <?php echo $CRD ?> crediti </h6></font> </td><td align='right'>
                <form id="my_form" action="app.php" method="post">
                    <input name="ddata" type="hidden" value="<?php echo base64_encode(serialize(array('id'=>$ID,'email'=>$USR,'credit'=>$CRD))); ?>" >
                    <input type="hidden" name="to_watch" value="<?php echo -1; ?>">
                    <input type="submit" class="btn btn-light" name="submission_button" value="HOME">
                </form>
            </td></tr> </table>

		<div style="width: 95vw; overflow: auto; <?php echo (($SRT === '-1')?'visibility:visible':'display:none'); ?>">
		    <table style="background-color: rgb(240,240,255,0.3)">
			   <thead>
				<tr>
				<th class='epg-th'>Canale</th>
				<?php foreach(range(intval(date('H'))*4,95) as $h){
				    if ($h%4 == 0)
					echo "<th class='epg-th'>".strval(floor($h/4)).":00</th>";
				    else if ($h%4 == 1)
					echo "<th class='epg-th'>".strval(floor($h/4)).":15</th>";
				    else if ($h%4 == 2)
					echo "<th class='epg-th'>".strval(floor($h/4)).":30</th>";
				    else if ($h%4 == 3)
					echo "<th class='epg-th'>".strval(floor($h/4)).":45</th>";
				} ?>
				</tr>
			   </thead>
			   <tbody>
<?php				$channels_tb = $channels->list();
				while ($ch = $channels_tb->fetch()) {
				    $prev_stop = strtotime(date("Ymd"))+intval(date('H'))*3600; //stop time of previous live
				    $videos_tb = $videos->list(date("Ymd"), $ch[0]);
				    echo "<tr> <th class='epg-th' style='border-right: solid 2px #f00; background-color:rgb(102,194,224,0.75)'><center><img src='".$ch[3]."'><center></th>";
				    while ($row = $videos_tb->fetch()) {
					if ($row[8] == "1" && $row[2]=="-1"){
					    array_push($recorded, $row);
//					    continue;
					}
					$t_start = strtotime($row[4]);
					if ($row[3] == "1"){
					    $t_start = strtotime(date("H")."0000");
					}
					$t_stop = strtotime($row[5]);
					if ($SRT == $row[0]) $DESC = $row[7];
					if (strtotime(date(His)) < $t_stop){
//					if (True){
					    if (floor(($t_start-$prev_stop)/900) > 0){
						if ($row[3]=='1'){
						    echo "<td class='epg-td' style='border-right: solid 2px #f00' colspan='".strval((intval(substr($t_stop,2,4))>=45)?ceil((strtotime(date('Ymd'))-$prev_stop)/900):floor((strtotime(date('Ymd'))-$prev_stop)/900))."'></td>";
					} else {
						    echo "<td class='epg-td' style='border-right: solid 2px #f00' colspan='".strval((intval(substr($t_stop,2,4))>=45)?ceil(($t_start-$prev_stop)/900):floor(($t_start-$prev_stop)/900))."'></td>";
						}
					    }
					    echo "<td class='epg-td-program' colspan='".strval(abs(round(($t_start-$t_stop)/900,0)))."'><button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal".$row[0]."' name='video' class='btn btn-success' style='width:100%'>".(($row[8]=='1')?"<b><u><font color='#ff0000'>REC </font></u></b>":"").(($row[3]=='1')?"<b><u><font color='#FF0000'>LIVE</font></b></u> ":"").$row[1]." <b>".(($row[2]==0)?"GRATIS":("cc".$row[2]))."</b></button></td>";

?>
<form action="buy.php" method="post">
<div class="modal fade" id="exampleModal<?= $row[0] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel<?= $row[0] ?>"><?= $row[1] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align:left">
        <input name="ddata" type="hidden" value="<?php echo base64_encode(serialize(array('id'=>$ID,'email'=>$USR,'credit'=>$CRD))); ?>">
	<input name="video" type="hidden" value="<?php echo $row[0] ?>">
	<input name="rec" type="hidden" value="<?php echo $row[8] ?>">
        <?= $row[7] ?><br><hr><?php if($row[8]=="1") echo "<font color='#FF0000'>⦿ Questa diretta è registrata.</font><br>"?>Costo: <?= $row[2] ?> crediti<br>Inizio: <?= implode(':', str_split($row[4], 2)) ?><br>Fine: <?= implode(':', str_split($row[5], 2))?>
      </div>
      <div class="modal-footer">
	<span class="form-control-static pull-left"><i>Se hai già acquistato, non pagherai di nuovo</i></span>
        <button type="button" class="btn btn-critical" data-dismiss="modal">Annulla</button>
        <button type="submit" class="btn btn-success">Acquista</button>
      </div>
    </div>
  </div>
</div>
</form>
<?php
					    $prev_stop = $t_stop;
					}
				    }
				    echo "</tr>";
				} ?>
			   </tdoby>
			</table>
		    </div>

		    <div style="<?php echo (($SRT === '-1')?'visibility:visible':'display:none'); ?>">
		    <form action="buy.php" method="post">
		    <font color="#FFFFFF" face="Open Sans">
		    <input name="ddata" type="hidden" value="<?php echo base64_encode(serialize(array('id'=>$ID,'email'=>$USR,'credit'=>$CRD))); ?>">
		    <input name="rec" type="hidden" value="1"/>
		    <!---Seleziona evento registrato:<select class="form-control" name="video">
		    <?php
			foreach($recorded as $row){
			    echo "<option value=".$row['id'].">". $row['nome']." | ".$row['giorno']." | ".$row['inizio']."</option>";
			}
//			$present = 0;
//                        if ($SRT == -1) {
//                            echo "<font color='#FFFFFF' face='Open Sans'>Seleziona evento: <select class='form-control' name='video'>";
//                            $stmt = $videos->list();
//                            while ($row = $stmt->fetch()) {
//                                $present = 1;
//				echo "<option value=".$row['id'].">". $row['nome']."</option>";
//                                // echo "<form><button type='submit' onclick='buy(".$row['id'].")'>".$row['nome']." =".$row['cost']."cc </button></form> \n";
//                            }
//                            echo "</select>";
//			    if ($present == 1){
//			    	echo "<input type='submit' class='btn btn-success' name='btnSubmit' value='Acquista/Guarda' />";
//			    } else {
//				echo "<br><p>Non c'è nessun evento imminente programmato.</p>";
//			    }
//                        }
                    ?>
		    </select>
		    <input type="submit" class="btn btn-success" name="btnSubmit" value="Acquista/Guarda" />
		</form>-->
	    </div>
	    <br>
            <?php
            if ($SRT != -1){
                $stmt = $videos->isLive($SRT);
                if($stmt->rowCount() > 0){
                    $row = $stmt->fetch();
                    if ($row['air'])
			$AIR = 1;
                    if ($row['air'] == 1 || $REC == "1"){
			echo "<table style='width:screen.width/1.5;border: 2px solid white;'><tr><td style='text-align:center'><font color='#FFFFFF'><h4>".$NOM."</h4>".$DESC."</font></td></tr></table>";
                        echo "<div id='player'></div>";
                    } elseif ($row['air'] == 0){
			$AIR = 0;
                        echo "<p style='font-size:3vw; color:white; display:inline-block'><u>La diretta non è ancora iniziata!</u></p><script>refreshAt(16,30,10)</script>";
                    }
                }
            }
            ?>
            <br><br><br><br>
            <img class="logo_footer" src="https://feddynventor.ddns.net:31713/images/logo1footer.png" width="200" height="48">
        </center>
        
	<?php
	    if ($REC == "1"){
		$REC = "r";
	    } else {
		$REC = "s";
	    }
	?>
        <script>
            var player = new Clappr.Player({
            source: 'https://feddynventor.ddns.net:31713/hls/<?=$REC?><?=$CAT?>/<?=$ID?>Z<?=$SRT?>.m3u8',
            autoPlay: true,
            plugins: [ChromecastPlugin,Backward,FastForward],
            chromecast: {
                appId: '9DFB77C0',
                media: {
                    title: '<?php echo explode("[",$NOM)[0];?>',
                    subtitle: 'Matisse TV'
                }
            },
            watermark: "https://feddynventor.ddns.net:31713/images/watermark.png",
            position: 'bottom-right',
            mute: false,
	    <?php
	    if ($REC == "r"){
		echo 'events: {
    onPlay: function() {
      if (player._hasSeek) {
        return
      }
      player.seek(0);
      player._hasSeek = true;
    },
  },';
	    }
	    ?>
            height: screen.width/16*9/1.2,
            width: screen.width/1.2,
            parentId: "#player"
            });
        </script>
    </body>

</html>
