<%-- 
    Document   : topartistspage
    Created on : Mar 14, 2019, 5:10:09 PM
    Author     : asus
--%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        
        <title>Mashup</title>
    </head>
    <body style="width: 100%;height: 100%;">
        <div style="width: 100%;height: 100%;background: none;">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from artists where artists_id in (select artists_id from tracks);");
                while(rs.next()){
            %>
            <div Style="
                    display: inline-block;
                    background: none;
                    width: 23%;
                    border-radius: 5px;
                    margin-right: 1.5%;
                    margin-top: 1.5%;
                    cursor: pointer;">
                <div Style="height: 100%;border-radius: 100px;background: none;">
                    <button 
                            style="
                            outline: none!important;
                            width: 100%;
                            height: 27vh;
                            border: none;
                            padding: 0;
                            cursor: pointer;
                            border-radius: 100px;"
                        onclick="OpenSongArtists('<%=rs.getString("artists_id")%>')">
                        <img src="<%=rs.getString("artists_picture")%>" title="<%=rs.getString("artists_name")%>" height="100%" width="100%" style="border-radius: 100px;"/>
                    </button>
                </div>
                <div class="containerr">
                    <p class="card-text" Style="white-space: nowrap;overflow: hidden;text-align: center;"><%=rs.getString("artists_name")%></p>
                </div>
            </div>
            <%
                }
                con.close();
            %>
        </div>
    </body>
</html>
