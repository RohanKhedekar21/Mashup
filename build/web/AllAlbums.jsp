<%-- 
    Document   : AllAlbums
    Created on : Mar 3, 2019, 6:41:45 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        
        <title>Mashup</title>
    </head>
    <body style="width: 100%;height: 100%;">
        <div style="width: 100%;height: 100%">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from albums where album_id in (select album_id from albums);");
                while(rs.next()){
            %>
            <div class="cardd" Style="display: inline-block;">
                <div Style="height: 100%">
                    <button class="btnsong" onclick="OpenSong('<%=rs.getString("album_id")%>')">
                        <img src="<%=rs.getString("album_picture")%>" title="<%=rs.getString("album_name")%>" height="100%" width="100%" />
                    </button>
                </div>
                <div class="containerr">
                    <p class="card-text" Style="white-space: nowrap;overflow: hidden;"><%=rs.getString("album_name")%></p>
                </div>
            </div>
            <%
                }
                con.close();
            %>
        </div>
    </body>
</html>
