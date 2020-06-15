<%-- 
    Document   : Signup
    Created on : Jan 24, 2019, 8:17:18 PM
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
                <font style="color: darkgrey">Already have an account?</font>
                <a href="Login.jsp" Style="text-decoration: none;color:black;padding-left: 10px;"><b>Log In</b></a>
            </div>
            <div Style="width: 100%;">
                <div class="Logincenter">
                    <div Style="overflow: hidden;text-align: center;">
                        <a href="index.jsp"><img src="images/mashupsdf.png" alt=""/></a>
                        <label Style=""><font Style="font-size: 13px;color: gold;">________________________________________________________________________________</font></label>
                    </div>
                    <div id="Emailsignup">
                        <form action="emailsignup" name="singupform" method="post" onSubmit="return SignupValidate();">
                            <div Style="text-align: center;padding-top: 20px;">
                                <input type="email" placeholder="Eamil" name="email" id="email" Style="width: 400px;height: 35px;padding: 12px 20px;display: inline-block;border: 1px solid #ccc;border-radius: 30px;outline: none;font-size: 15px;"/></br>
                            </div>
                            <div Style="text-align: center;padding-top: 20px;">
                                <input type="password" placeholder="Password" id="pass" name="pass" Style="width: 400px;height: 35px;padding: 12px 20px;display: inline-block;border: 1px solid #ccc;border-radius: 30px;outline: none;font-size: 15px;"/></br>
                            </div>
                            <div Style="text-align: center;padding-top: 20px;">
                                <input type="password" placeholder="Confirm Password" id="cpass" name="cpass" Style="width: 400px;height: 35px;padding: 12px 20px;display: inline-block;border: 1px solid #ccc;border-radius: 30px;outline: none;font-size: 15px;"/></br>
                            </div>
                            <div Style="text-align: center;padding-top: 20px;">
                                <button class="signupme" type="submit"><b>SIGN UP ME</b></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
