<%-- 
    Document   : OpenSongArtists
    Created on : Mar 14, 2019, 10:18:39 PM
    Author     : asus
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Mashup</title>
    </head>
    <body>
        <%
            String sp=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from tracks inner join artists on artists.artists_id=tracks.artists_id where artists.artists_id="+sp+";");
            rs.next();
        %>
        <div Style="width: 100%;height: 100%;">
            <div class="songdetails">
                <div class="songposter">
                    <img src="<%=rs.getString("artists_picture")%>" width="100%" height="100%">  
                </div>
                <div class="posterdetails">
                    <p style="font-weight: bold;font-size: 30px;margin: 0;"><%=rs.getString("artists_name")%></p>
                            <%
                                Statement st3=con.createStatement();
                                ResultSet rs4=st3.executeQuery("select * from tracks inner join artists on artists.artists_id=tracks.artists_id where artists.artists_id="+sp+";");
                                ArrayList<Integer> playallsonglist = new ArrayList();
                                    while (rs4.next()) {
                                        playallsonglist.add(rs4.getInt("track_id"));
                                    }
                            %>
                            <%
                                int id;
                                ArrayList<String> src=new ArrayList();
                                ArrayList<String> names=new ArrayList();
                                int i;
                                for(i=0;i<playallsonglist.size();i++){
                                    id=playallsonglist.get(i);
                                    System.out.println(id);
                                    String selectSQL = "select * from tracks inner join artists on artists.artists_id=tracks.artists_id where tracks.track_id="+id+"; ";
                                    Statement st4 = con.createStatement();
                                    ResultSet rs2 = st4.executeQuery(selectSQL);
                                    if(rs2.next()){
                                        src.add(rs2.getString("track_url"));
                                        names.add(rs2.getString("track_name"));
                                    }
                                }
                            %>
                                    <button class="btnplayall" onclick="playall()">Play All</button>
                            <script>
                                function playall(){
                                    var src = [];
                                    var name=[];
                                    <%
                                        for(i=0;i<src.size();i++){
                                    %>
                                            src.push("<%= src.get(i)%>");
                                            name.push("<%=names.get(i)%>");
                                    <%
                                        }
                                    %>
                                            playsongs(src,name);
                                }
                            </script>
                </div>
            </div>
            <div class="albumsonglist">
                <table Style="width: 100%" id="tableA">
                    <%
                        String username= (String) session.getAttribute("user"); 
                        int ino1=0;
                        int ino2=0;
                        Statement st2=con.createStatement();
                        ResultSet rs3=st2.executeQuery("select * from tracks inner join artists on artists.artists_id=tracks.artists_id where artists.artists_id="+sp+";");
                        while(rs3.next()){
                    %>
                    <tr style="border-bottom: 1px solid #ccc;height: 50px;" id="tableArow<%=ino1++%>">
                        <td style="display: none;"><%=rs3.getString("track_id")%></td>
                        <td Style="width: 70px;">
                            <button class="playbtn" onclick="playSingle('<%=rs3.getString("track_url")%>','<%=rs3.getString("track_name")%>')"><i class="far fa-play-circle"></i></button>
                        </td>
                        <td><span onclick="playSingle('<%=rs3.getString("track_url")%>','<%=rs3.getString("track_name")%>')" style="cursor: pointer"><%=rs3.getString("track_name")%></span></td>
                        <td><%=rs3.getString("track_playtime")%></td>
                        <td style="width: 5px;text-align: right;">
                            <form method="get" name="downloadsong" action="<%=rs3.getString("track_url")%>">
                                <button class="btndownload" title="Download" <% if (username == null) { %>type="button" onclick="openalertmsg()" <% }else{ %> type="submit" <% } %> ><i class="far fa-arrow-alt-circle-down"></i></button>
                            </form>
                        </td>
                        <td style="width: 5px;text-align: right;">
                            <form name="addtoplaylist" action="addtoplaylist" method="post">
                                <input type="hidden" name="trackid" value="<%=rs3.getString("track_id")%>" />
                                <button class="btndownload" title="Add to Playlist" <% if (username == null) { %>type="button" onclick="openalertmsg()" <% }else{ %> type="submit" <% } %> ><i class="fas fa-plus"></i></button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                        con.close();
                    %>
                </table>
                        <script>
                            function playSingle(url,names){
                                var src = [];
                                var name=[];
                                src.push(url);
                                name.push(names);
                                playsongs(src,name);
                            }
                        </script>
            </div>
        </div>
    </body>
</html>
