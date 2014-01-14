<?php
 session_start();

if(isset($_SESSION["username"])){
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Soccer Portal</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/dropdown.css" rel="stylesheet" type="text/css" />
<link rel="SHORTCUT ICON" href="../sp.ico" type="image/x-icon">

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="../js/shoutbox.js"></script>
<script src="../js/frontend.js"></script>

</head>
<body>
  <div id="frontendHead">
    <div id="frontendNavi">
      <div id="logoSpacer">
        <div id="frontlogo"></div>
      </div> <!-- close logoSpacer -->

    <div id="navspace">
      <div id="navBtns">

        <div id="nav">
          <ul>
            <li>
              <div id="button1" class="leftBtn">
                <div class="frontbtnsTxt">Nachrichten</div>
              </div> <!-- close button1 -->
                <div class ="dropspace">
                  <ul>
                    <li class="navitem"><div id="posteingang" class="innerdrp"><div id="mInIco"><img src="../images/site/frontend/icons/messageIn.png"></img>&nbsp Posteingang</div></li>
                    <li class="navitem"><div id="postausgang" class="innerdrp"><div id="mOutIco"><img src="../images/site/frontend/icons/messageOut.png"></img>&nbsp Postausgang</div></li>
                    <li class="navitem"><div id="verfassen" class="innerdrp"><div id="mCreIco"><img src="../images/site/frontend/icons/createMessage.png"></img>&nbsp Verfassen</div></li>
                  </ul>
                </div> <!-- close dropspace -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button2" class="rightBtn">
                <div class="frontbtnsTxt">Wetten</div>
              </div> <!-- close button2 -->
                <div class ="dropspace">
                  <ul>
                    <li class="navitem"><div id="posteingang" class="innerdrp"><div id="mInIco">&nbsp Einzelwette</div></li>
                    <li class="navitem"><div id="postausgang" class="innerdrp"><div id="mOutIco">&nbsp Kombiwette</div></li>
                    <li class="navitem"><div id="verfassen" class="innerdrp"><div id="mCreIco">&nbsp Aktive Wetten</div></li>
                    <li class="navitem"><div id="verfassen" class="innerdrp"><div id="mCreIco">&nbsp Alte Wetten</div></li>
                  </ul>
                </div> <!-- close dropspace -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button3" class="rightBtn">
                <div class="frontbtnsTxt">Home</div>
              </div> <!-- close button3 -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button4" class="rightBtn">
                <div class="frontbtnsTxt">Bestenliste</div>
              </div> <!-- close button2 -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button5" class="rightBtn">
                <div class="frontbtnsTxt">Profil</div>
              </div> <!-- close button2 -->
                <div class ="dropspace">
                  <ul>
                    <li class="navitem"><div id="posteingang" class="innerdrp"><div id="mInIco">&nbsp Eigenes Profil</div></li>
                    <li class="navitem"><div id="postausgang" class="innerdrp"><div id="mOutIco">&nbsp Profil bearbeiten</div></li>
                  </ul>
                </div> <!-- close dropspace -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button6" class="rightBtn">
                <div class="frontbtnsTxt">Ligen</div>
              </div> <!-- close button2 -->
                <div class ="dropspace">
                  <ul>
                    <li class="navitem"><div id="posteingang" class="innerdrp"><div id="mInIco">&nbsp 1. Liga</div></li>
                    <li class="navitem"><div id="postausgang" class="innerdrp"><div id="mOutIco">&nbsp 2. Liga</div></li>
                    <li class="navitem"><div id="verfassen" class="innerdrp"><div id="mCreIco">&nbsp 3. Liga</div></li>
                  </ul>
                </div> <!-- close dropspace -->
            </li>
          </ul>

          <ul>
            <li>
              <div id="button7" class="rightBtn last">
                <div class="frontbtnsTxt">WM</div>
              </div> <!-- close button2 -->
            </li>
          </ul>

          </div> <!-- close nav -->

      </div> <!-- close navBtns -->
      <div id="navgreen"></div>
    </div> <!-- close navspace -->

    <div id="score">
      <div id="coin"></div>
      <div id="money"><?php echo $_SESSION["kontostand"]; ?></div>
      <div id="toplist" class="utext">Toplist</div>
      <div id="arrows"></div>
    </div> <!-- close score -->

    <div id="profilspacer">
      <a href="http://en.wikipedia.org/wiki/Gandalf">
        <div id="profilPic"></div>
      </a>
    </div> <!-- close profilspacer -->

    <div id="username" class="utext">
      <?php echo $_SESSION["username"]; ?>
    </div> <!-- close profilspacer -->

    <a href="logout.php">
      <div id="logoutBtn"></div>
    </a>

  </div> <!-- close frontendHead -->

  <div id="frontcontent">

    <div id="frontendhead">
      <div id="news">
        <div id="newsBtnSpacer">
          <div id="news1" class="newsBtn"><div class="newsPic"></div><div class="newsBtnTxt boxText">text</div></div>
          <div id="news2" class="newsBtn"><div class="newsPic"></div><div class="newsBtnTxt boxText">text</div></div>
          <div id="news3" class="newsBtn"><div class="newsPic"></div><div class="newsBtnTxt boxText">text</div></div>
          <div id="news4" class="newsBtn"><div class="newsPic"></div><div class="newsBtnTxt boxText">text</div></div>
        </div> <!-- close newsBtnSpacer -->
        <div id="newsSpacer">
          <div id="newsContent" class="frontendGradient">
            <div id="newsContPic">
              <div id="newsContTxtbx">
                <div class="newsContTxt">sfsfdsfjhgjhfgjhgjhgjghjhgjhgjhgjhg</div>
              </div>
            </div>
          </div> <!-- close newsContent -->
        </div> <!-- close newsSpacer -->
      </div> <!-- close news -->

      <div id="lastMouter" class="frontendGradient">
        <div id="lastMoutertxt" class="defaultTxt">last matches</div>
        <div id="lastMinner">

          <div class="lastMatchbox">
            <div class="matchWon"><div class="lastMatchWidTxtL">won</div></div>
            <div class="matchScore"><div class="lastMatchWidTxtL lastMatchWidTxtR">1000 credits</div></div>

            <div class="lastMatchinner">
              <div class="lastMatchLft frontendGradient"><div class="LMLinner"></div></div>
              <div class="lastMatchMid">
                <div class="lastMatchMlft frontendGradient"><div class="lMMltxtL">Bayern</div></div>
                <div class="lastMatchMmid frontendGradient"><div class="lMMltxtL lMMMtxt">2:1</div></div>
                <div class="lastMatchMrght frontendGradient"><div class="lMMltxtL lMMltxtR">St. Pauli</div></div>
              </div>
              <div class="lastMatchLft Rght frontendGradient"><div class="LMLinner LMR"></div></div>
            </div> <!-- close lastMatchinner -->

          </div> <!-- close lastMatchbox -->

          <div class="lastMatchbox">
            <div class="matchWon"><div class="lastMatchWidTxtL">won</div></div>
            <div class="matchScore"><div class="lastMatchWidTxtL lastMatchWidTxtR">1000 credits</div></div>

            <div class="lastMatchinner">
              <div class="lastMatchLft frontendGradient"><div class="LMLinner"></div></div>
              <div class="lastMatchMid">
                <div class="lastMatchMlft frontendGradient"><div class="lMMltxtL">Bayern</div></div>
                <div class="lastMatchMmid frontendGradient"><div class="lMMltxtL lMMMtxt">2:1</div></div>
                <div class="lastMatchMrght frontendGradient"><div class="lMMltxtL lMMltxtR">St. Pauli</div></div>
              </div>
              <div class="lastMatchLft Rght frontendGradient"><div class="LMLinner LMR"></div></div>
            </div> <!-- close lastMatchinner -->

          </div> <!-- close lastMatchbox -->

        </div> <!-- close lastMinner -->
      </div> <!-- close lastMouter -->

    </div> <!-- close frontendhead -->

    <div id="frontendmain">

      <div id="onlineListOuter">
        <div id="onlineListInner" class="frontendGradient">

          <div class="onlineListEntry">
            <div class="onlineListUsrIcon"></div>
            <div class="onlineListUsrName defaultTxt">heinz</div>
            <div class="onlineIcon"></div>
          </div> <!-- close onlineListEntry -->
          <div class="onlineLineGlow"></div>

          <div class="onlineListEntry">
            <div class="onlineListUsrIcon"></div>
            <div class="onlineListUsrName defaultTxt">heinz</div>
            <div class="onlineIcon"></div>
          </div> <!-- close onlineListEntry -->
          <div class="onlineLineGlow"></div>

        </div> <!-- close onlineListInner -->
      </div> <!-- close onlineListOuter -->

      <div id="betOuter">
        <div id="betHeader"><div class="betHeadertxt">Aktuelle Top-Wetten:</div>
          <div class="betNavBtn">Bundesliga</div>
          <div class="betNavBtn">Weltmeisterschaft 2014</div>
        </div> <!-- close betHeader -->
        <div id="betContent">

          <div id="text">
            <div class="betCompetitions">
               <div class="match">
                   <div class="compFBLft">
                    <div class="compFlgLft" style="background-image:url(images/site/matchlogos/bayernM.png)
                    ;">
                    </div> <!-- close compFlgLft -->
                   </div> <!-- close compFBLft -->
                     <div class="matchoptions">
                         <div class="matchinfo">
                          <div class="matchmembl">Heimspiel</div>
                          <div class="matchtime">02.12.2013 14:00</div>
                          <div class="matchmembl matchmembr">Gast</div>
                         </div>
                         <div class="competitorSel bgGradient"><div class="compTextL">1FC Bayern M�nchen</div><div class="compquote">Sieg 3.20</div></div>
                         <div class="drwSel bgGradient"><div class="compTextL compdrwText">unentschieden</div><div class="compquote compquoteM">1.0</div></div>
                         <div class="competitorSel bgGradient"><div class="compTextL compTextR">BVB</div><div class="compquote compquoteR">Sieg 3.20</div></div>
                     </div> <!-- close matchoptions -->
                   <div class="compFBRght">
                    <div class="compFlgRght" style="background-image:url(images/site/matchlogos/bvb.png)
                    ;">
                    </div>
                   </div>
               </div> <!-- close match -->
            </div> <!-- close betCompetitions -->
          </div> <!-- close text -->

        </div> <!-- close betContent -->
      </div> <!-- close betOuter -->

    </div> <!-- close frontendmain -->

  </div> <!-- close frontcontent -->


  <!------------------------------------------->
  <!-- open shoutbox -->
  <!--<?php $bild="zuklappen.png" ?>
    <div id="shoutboxbutton">
      <img src="<?php echo "../images/site/shoutbox/" . $bild; ?>" id="shoutboxpicture" alt="shoutbox" onclick="changePic();"/>
    </div>
    <div id="shoutbox" class="ui-widget-content">
      <p>
        Hier steht dann sp�ter die shoutbox drinnen. Dort kann man chatten und so ein Mist...
      </p>
    </div> -->
    <!-- close shoutbox -->

</body>
</html>

<?php
}
else{
?>
  Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
  <meta http-equiv="refresh" content="0; URL=:../index.php" />
<?php
}
