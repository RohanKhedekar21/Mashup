<%-- 
    Document   : CenterMenupage
    Created on : Mar 4, 2019, 1:20:02 AM
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
    <body>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <%
                int i=0;
                int count=0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                
                Statement st=con.createStatement();
                ResultSet rs4=st.executeQuery("select * from advertise");
            %>
            <ol class="carousel-indicators">
                <%
                    while(rs4.next()){
                %>
                <li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>" <% if(i==0){ %>class="active"<% } %>></li>
                <%
                    i++;
                    }
                %>
            </ol>
            <div class="carousel-inner">
                <%
                    ResultSet rs5=st.executeQuery("select * from advertise");
                    while(rs5.next()){
                %>
                <button class="carousel-item <% if(count==0){ %> active <% } %>" style="width: 100%;height: 100%;border: none;outline: none!important;background: none;cursor: pointer;" onclick="OpenSong('<%=rs5.getString("album_id")%>')">
                    <img src="<%=rs5.getString("adv_poster")%>" alt="" width="100%" height="100%"/>
                </button>
                <%
                    count++;
                    }
                %>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div Style="padding-top: 20px;">
            <div style="">
                <label>New Releases</label>
                <button class="btnviewall" onclick="OpenMenu()">View all</button>
            </div>
        </div>
        <div Style="height: 100%;">
            <div Style="height: 100%;width: 100%;">
                <%
                    ResultSet rs=st.executeQuery("select * from albums where album_id in (select album_id from albums);");
                    while(rs.next()){
                %>
                <div class="cardd" Style="display: inline-block;">
                    <div Style="height: 100%">
                        <button class="btnsong" id="btnbutton" onclick="OpenSong('<%=rs.getString("album_id")%>')">
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
        </div>
    </body>
</html>
