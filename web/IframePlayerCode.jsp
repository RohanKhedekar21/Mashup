<%-- 
    Document   : openSong_rightside
    Created on : Feb 28, 2019, 5:25:58 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="javascript/javascript.js" type="text/javascript"></script>
        
        <title>JSP Page</title>
    </head>
    <body style="width: 100%;height: 100%;">
            <table style="width: 100%;height: 100vh;">
                <tr Style="height: 50px;border-bottom: 1px solid #ecf0f1;vertical-align: middle;width: 100%;">
                    <td>
                        Queue
                    </td>
                </tr>
                <tr style="height: 100%">
                    <td>
                    
                    </td>
                </tr>
                <tr style="height: 100%">
                    <td>
                        <div class="musicplayer" Style="">
                            <div Style="height: 40%">
                                <p id="trackname">Demo</p>
                                <span id="curtimetext">00:00</span> / <span id="durtimetext">00:00</span>
                            </div>
                            <div Style="height: 18%;text-align: center;">
                                <input id="fillBar" type="range" min="1" max="100" value="0" step="1" Style="width: 90%;">
                            </div>
                            <div Style="height: 40%;text-align: center;">
                                <button id="btnprevious" class="buttonbackward"><i class="fas fa-step-backward"></i></button>
                                <button class="buttonplay" id="playbutton" ><i class="far fa-play-circle"></i></button>
                                <button class="buttonforward" id="btnnext"><i class="fas fa-step-forward"></i></button>
                            </div>
                            <audio id="idid" class="idid" type="audio/mp3">
                                <source id="urlsrc" src="music/The Humma Song.mp3" />
                            </audio>
                        </div>
                    </td>
                </tr>
            </table>
    </body>
</html>
