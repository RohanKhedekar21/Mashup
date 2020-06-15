<%-- 
    Document   : newjsp
    Created on : Feb 11, 2019, 8:12:45 PM
    Author     : asus
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <script src="javascript/javascript.js" type="text/javascript"></script>
        <title>Mashup</title>
    </head>
    <body>
        <%
            String sp=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from albums inner join tracks on albums.album_id=tracks.album_id where albums.album_id="+sp+";");
            rs.next();
        %>
        <div Style="width: 100%;height: 100%;">
            <div class="songdetails">
                <div class="songposter">
                    <img src="<%=rs.getString("album_picture")%>" width="100%" height="100%">  
                </div>
                <div class="posterdetails">
                    <p style="font-weight: bold;font-size: 30px;margin: 0;"><%=rs.getString("album_name")%></p>
                    <table>
                        <tr>
                            <td>
                                <span style="color: darkturquoise">Release:</span>
                            </td>
                            <td style="vertical-align: central">
                                <p Style="margin: 0;padding-top: 5px"><%=rs.getString("album_releasedate")%></p>
                            </td>
                        </tr>
                    </table>
                            <%
                                Statement st3=con.createStatement();
                                ResultSet rs4=st3.executeQuery("select * from albums inner join tracks on albums.album_id=tracks.album_id where albums.album_id="+sp+";");
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
                                    String selectSQL = "select track_url,track_name from tracks where track_id = '"+id+"' ";
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
                                        } %>
                                            playsongs(src,name);
                                }
                            </script>
                </div>
            </div>
                                   
            <div class="albumsonglist">
                <table Style="width: 100%" >
                    <%
                        String username= (String) session.getAttribute("user"); 
                        
                        Statement st2=con.createStatement();
                        ResultSet rs3=st2.executeQuery("select * from albums inner join tracks on albums.album_id=tracks.album_id where albums.album_id="+sp+";");
                        while(rs3.next()){
                    %>
                    <tr style="border-bottom: 1px solid #ccc;height: 50px;width: 100%;" >
                        <td style="display: none;"><%=rs3.getString("track_id")%></td>
                        <td Style="width: 30px;">
                            <button class="playbtn" onclick="playSingle('<%=rs3.getString("track_url")%>','<%=rs3.getString("track_name")%>')"><i class="far fa-play-circle"></i></button>
                        </td>
                        <td style="width: 250px;text-align: center;" id="tableA"><span onclick="playSingle('<%=rs3.getString("track_url")%>','<%=rs3.getString("track_name")%>')" style="cursor: pointer"><%=rs3.getString("track_name")%></span></td>
                        <td style="width: 5px;text-align: right;"><%=rs3.getString("track_playtime")%></td>
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
