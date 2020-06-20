<%-- 
    Document   : index
    Created on : Jan 21, 2019, 11:49:56 PM
    Author     : Khedekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="javascript/javascript.js" type="text/javascript"></script>
        
        <title>Mashup</title>
    </head>
    <body style="background-color: #ffffff;height: 100%;">
        <div style="height: 100%;width: 100%;">
            
            <nav class="navbar sticky-top">
                <div class="nav-item">
                    <a href="javascript:centerpage()">
                        <span Style="height: 100%;"><img src="images/MashUp_Logo.png" alt="" /></span>
                    </a>
                </div>
                <div class="col">
                    <div class="nav-item dropdown " style="float: left;">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Browse
                        </a>
                        <div class="dropdown-menu open" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item open"  href="javascript:OpenAllAlbums()">All Albums</a>
                            <a class="dropdown-item open" href="javascript:OpenAllArtists()">Top Artists</a>
                        </div>
                    </div>
                    <div style="float: left;padding-left: 48px;">
                            
                            <div class="search-box">
                                <input class="search-txt" type="text" id="searchcontent" placeholder="serach" autocomplete="off">
                                <a class="search-btn" href="javascript:search()"><i class="fas fa-search"></i></a>
                            </div>
                            
                    </div>
                </div>
                <%
                    String username= (String) session.getAttribute("user");                     
                    if (username == null) {
                %>
                <div class="nav">
                    <a class="nav-link" href="Login.jsp">Log In</a>
                    <!--<input type="button" value="Singup" class="nav-link" onclick="showcontactusform()"/>-->
                </div>
                <%
                    }else{
                %>
                <div >
                    <form action="logout" method="post">
                        <p style="display: inline-block;cursor: default;">Welcome,<%=username%></p>
                        <button class="nav-link logout" type="submit" style="display: inline-block">Logout</button>
                    </form>
                </div>
                <%
                    }
                %>
            </nav>
            
            <!--<div class="contain">-->
                <div class="rows" style="height: 100%;border: 0px;margin: 0;">
                <!--Left side menu-->
                <div class="columnleft leftsidediv" style="">
                    <button class="playlistbtn" onclick="<% if (username == null) { %> openalertmsg() <% }else{ %> openplaylistpage() <% } %>">
                        <i class="fas fa-music"></i>
                        My Playlists
                    </button>
                    <div style="text-align: center;margin: 15px;width: 90%;height: 87%;background-color: #ecf0f1">
                        <label style="padding-top: 15px;font-size: 20px">Ad closed by <b>Google</b></label>
                    </div>
                </div>
                <!--Center side menu-->
                <div class="columncenter" style="overflow-y: auto;" id="centerpage">
                    <div id="loading"></div>
                </div>
                <!--Right side menu
                <iframe src="IframePlayerCode.jsp" id="musiciframe" class="columnright" frameborder="0">
                    
                </iframe>-->
                <div class="columnright">
                    <table style="width: 100%;height: 100%">
                <tr Style="height: 50px;border-bottom: 1px solid #ecf0f1;vertical-align: middle;width: 100%;">
                    <td>
                        <b>Queue</b>
                    </td>
                </tr>
                <tr style="height: 100%;">
                    <td>
                        <div style="overflow-y: auto;width: 100%;height: 100%;text-align: center;" id="tableB">
                            <h3 style="padding-top: 50px">Your Queue is Empty</h3>
                        </div>
                    </td>
                </tr>
                <tr style="height: 100%">
                    <td>
                        <div class="musicplayer" Style="">
                            <div Style="height: 40%">
                                <p id="trackname"></p>
                                <span id="curtimetext">--:--</span> / <span id="durtimetext">--:--</span>
                            </div>
                            <div Style="height: 18%;text-align: center;">
                                <input id="fillBar" type="range" min="1" max="100" value="0" step="1" Style="width: 90%;">
                            </div>
                            <div Style="height: 40%;text-align: center;">
                                <button id="btnprevious" class="buttonbackward"><i class="fas fa-step-backward"></i></button>
                                <button class="buttonplay" id="playbutton" ><i class="far fa-play-circle"></i></button>
                                <button class="buttonforward" id="btnnext"><i class="fas fa-step-forward"></i></button>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
                </div>
            </div>
            <!--</div>-->
        </div>
    </body>
</html>
