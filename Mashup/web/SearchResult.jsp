<%-- 
    Document   : SearchResult
    Created on : Mar 7, 2019, 7:31:49 PM
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
        <%
            String searchcontent=request.getParameter("searchcontent");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from albums where album_name='"+searchcontent+"';");
            if(rs.next()){
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
            }else{
                String username= (String) session.getAttribute("user"); 
                        
                ResultSet rs2=st.executeQuery("select * from tracks where track_name='"+searchcontent+"';");
                if(rs2.next()){
        %>
        <div class="albumsonglist">
            <table Style="width: 100%" id="tableA">
                <tr style="border-bottom: 1px solid #ccc;height: 50px;">
                    <td style="display: none;"><%=rs2.getString("track_id")%></td>
                    <td Style="width: 70px;">
                        <button class="playbtn" onclick="playSingle('<%=rs2.getString("track_url")%>','<%=rs2.getString("track_name")%>')"><i class="far fa-play-circle"></i></button>
                    </td>
                    <td style="width: 250px;text-align: center;" id="tableA"><span onclick="playSingle('<%=rs2.getString("track_url")%>','<%=rs2.getString("track_name")%>')" style="cursor: pointer"><%=rs2.getString("track_name")%></span></td>
                        <td style="width: 5px;text-align: right;"><%=rs2.getString("track_playtime")%></td>
                        <td style="width: 5px;text-align: right;">
                            <form method="get" name="downloadsong" action="<%=rs2.getString("track_url")%>">
                                <button class="btndownload" title="Download" <% if (username == null) { %>type="button" onclick="openalertmsg()" <% }else{ %> type="submit" <% } %> ><i class="far fa-arrow-alt-circle-down"></i></button>
                            </form>
                        </td>
                        <td style="width: 5px;text-align: right;">
                            <form name="addtoplaylist" action="addtoplaylist" method="post">
                                <input type="hidden" name="trackid" value="<%=rs2.getString("track_id")%>" />
                                <button class="btndownload" title="Add to Playlist" <% if (username == null) { %>type="button" onclick="openalertmsg()" <% }else{ %> type="submit" <% } %> ><i class="fas fa-plus"></i></button>
                            </form>
                        </td>
                </tr>
            </table>
                <%
                    }else{
                        ResultSet rs3=st.executeQuery("select * from artists where artists_name='"+searchcontent+"';");
                        if(rs3.next()){
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
                        onclick="OpenSongArtists('<%=rs3.getString("artists_id")%>')">
                        <img src="<%=rs3.getString("artists_picture")%>" title="<%=rs3.getString("artists_name")%>" height="100%" width="100%" style="border-radius: 100px;"/>
                    </button>
                </div>
                <div class="containerr">
                    <p class="card-text" Style="white-space: nowrap;overflow: hidden;text-align: center;"><%=rs3.getString("artists_name")%></p>
                </div>
            </div>
                <%
                    }else{
                %>
                <div>
                    <h2>No Result Found</h2>
                </div>
                <%
                    }
                %>
        </div>
        <%
                }
            }
            con.close();
        %>
    </body>
</html>
