<%-- 
    Document   : Admin
    Created on : Feb 22, 2019, 7:10:27 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/AdminPageStyling.css" rel="stylesheet" type="text/css" />
        <script src="javascript/AdminJavascript.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <title>Admin</title>
    </head>
    <body style="height: 100%;width: 100%;">
        <!--Navigation bar-->
        <div class="navbar">
            <div class="logo">
                <img src="images/MashUp_Logo.png" alt="" width="100%" height="100%"/>
            </div>
        </div>
        <div class="menubar">
            <button class="menubtns" onclick="openhomepage()">Home</button>
            <button class="menubtns" onclick="openalbumpage()">Album</button>
            <button class="menubtns" onclick="openartistspage()">Artists</button>
            <button class="menubtns" onclick="opengenrespage()">Genres</button>
            <button class="menubtns" onclick="opentrackpage()">Tracks</button>
            <button class="menubtns" onclick="openadvertiespage()">Adverties</button>
            <button class="menulogout" onclick="Logout()"><span style="font-weight: bold;">Logout</span></button>
        </div>
        <div style="width: 100%;height: 84vh;" id="centerpage">
            
        </div>
    </body>
</html>
