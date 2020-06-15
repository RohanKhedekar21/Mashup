<%-- 
    Document   : Login
    Created on : Jan 23, 2019, 8:42:39 PM
    Author     : Khedekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="javascript/javascript.js" type="text/javascript"></script>
        
        <title>Mashup</title>
    </head>
    <body>
        <div Style="width: 100%;">
            <div Style="float: right;padding-top: 5px;padding-right: 8px;">
                <font style="color: darkgrey">No Mashup accout yet?</font>
                <a href="Signup.jsp" Style="text-decoration: none;color:black;padding-left: 10px;"><b>Sign Up</b></a>
            </div>
            <div Style="width: 100%;">
                <div class="Logincenter">
                    <div Style="overflow: hidden;text-align: center;">
                        <a href="index.jsp"><img src="images/mashupsdf.png" alt=""/></a>
                        <label Style=""><font Style="font-size: 13px;color: gold;">________________________________________________________________________________</font></label>
                    </div>
                    <form action="emaillogin" method="post" onsubmit="return Loginvalidate();">
                        <div Style="text-align: center;padding-top: 20px;">
                            <input type="email" name="email" id="email" placeholder="Eamil" Style="width: 400px;height: 35px;padding: 12px 20px;display: inline-block;border: 1px solid #ccc;border-radius: 30px;outline: none;font-size: 15px;"/></br>
                        </div>
                        <div Style="text-align: center;padding-top: 10px;">
                            <input type="password" name="pass" id="pass" placeholder="Password" Style="width: 400px;height: 35px;padding: 12px 20px;display: inline-block;border: 1px solid #ccc;border-radius: 30px;outline: none;font-size: 15px;"/> 
                        </div>
                        <div Style="text-align: center;padding-top: 10px;width: 400px;top: 0;bottom: 0;left: 0;right: 0;margin: auto;">
                            <div Style="float: left;">
                                <button class="loginsignup"><b>FORGOT?</b></button>
                            </div>
                            <div Style="float: right;">
                                <button class="loginsignup" type="submit"><b>LOG IN</b></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
