<%-- 
    Document   : track
    Created on : Feb 24, 2019, 11:04:14 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/AdminJavascript.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div style="border-right: 1px solid black;width: 20%;height: 84vh;float: left;" >
            <div style="padding-top: 20px;width: 100%;text-align: center;">
                <h1>Add Track</h1>
                <div style="margin: 10px;width: 90%;text-align: center;border: 2px solid black">
                    <form action="addtrack" method="POST" enctype="multipart/form-data" onsubmit="return addtrackvalidation();">
                        <p style="padding-top: 20px;">Enter Track Name<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="text" name="trackname" id="trackname" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Upload Track<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="file" name="file" id="audiofile" accept="audio/*" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Enter Track Playtime<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="text" name="trackplaytime" id="trackplaytime" readonly="readonly" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Select Album<span style="color:red;font-weight: bold;">*</span></p>
                        <select name="album" id="selectalbum" style="width: 80%;">
                            <option disabled="disabled" selected="selected" value=""> -- select an option -- </option>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                                
                                Statement st=con.createStatement();
                                ResultSet rs=st.executeQuery("select * from albums");
                                while(rs.next()){
                            %>
                            <option value="<%=rs.getString("album_id")%>"><%=rs.getString("album_name")%></option>
                            <%
                                }
                            %>
                        </select>
                        <p style="padding-top: 20px;">Select Artists<span style="color:red;font-weight: bold;">*</span></p>
                        <select name="artists" id="selectartists" style="width: 80%;">
                            <option disabled selected value=""> -- select an option -- </option>
                            <%
                                ResultSet rs2=st.executeQuery("select * from artists");
                                while(rs2.next()){
                            %>
                            <option value="<%=rs2.getString("artists_id")%>"><%=rs2.getString("artists_name")%></option>
                            <%
                                }
                            %>
                        </select>
                        <p style="padding-top: 20px;">Enter Track Lyric</p>
                        <input type="text" name="lyric" style="width: 80%;"/>
                        <br><br>
                        <input type="submit" value="Add" style="width: 30%;height: 30px;cursor: pointer;"/>
                        <br><br>
                    </form>
                        <audio id="audio"></audio>
                        <script>
                            document.getElementById('audio').addEventListener('canplaythrough', function(e){ 
                                var durmins = Math.floor(e.currentTarget.duration / 60);
                                var dursecs = Math.floor(e.currentTarget.duration - durmins * 60);
                                if(dursecs < 10){ dursecs = "0"+dursecs; }
                                if(durmins < 10){ durmins = "0"+durmins; }
                                document.getElementById('trackplaytime').value = durmins+":"+dursecs;
                                URL.revokeObjectURL(obUrl); 
                            }); 
                            var obUrl; 
                            document.getElementById('audiofile').addEventListener('change', function(e){ 
                                var file = e.currentTarget.files[0]; 
                                if(file.name.match(/\.(avi|mp3|mp4|mpeg|ogg)$/i)){ 
                                    obUrl = URL.createObjectURL(file); 
                                    document.getElementById('audio').setAttribute('src', obUrl); 
                                }
                            });
                        </script>
                </div>
            </div>
        </div>
        <div style="width: 79.9%;height: 84vh;float: left;">
            <div style="border-bottom: 2px solid black;width: 100%;height: 10%;">
                <h1 style="text-align: center;padding-top: 7px;">Track</h1>
            </div>
            <div style="text-align: center;width: 100%;">
                <form name="deltrack" action="delTrack" method="POST"><input type="hidden" name="ids" />
                <table border="1" class="albumtable">
                    <tr>
                        <th>No.</th>
                        <th>Track id</th>
                        <th>Track Name</th>
                        <th>Track Time</th>
                        <th>Track Path</th>
                        <th>Track Lyric</th>
                        <th>Album Name</th>
                        <th>Artists Name</th>
                        <th></th>
                    </tr>
                    <%
                        ResultSet rs3=st.executeQuery("select * from tracks");
                        while(rs3.next()){
                    %>
                    <tr>
                        <td class="counterCell"></td>
                        <td><%=rs3.getString("track_id")%></td>
                        <td><%=rs3.getString("track_name")%></td>
                        <td><%=rs3.getString("track_playtime")%></td>
                        <td><%=rs3.getString("track_url")%></td>
                        <td>
                            <%
                                if(rs3.getString("track_lyric")==null || rs3.getString("track_lyric").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("track_lyric"));
                                }
                            %>
                        </td>
                        <td>
                            <%
                                if(rs3.getString("album_id")==null){
                                    out.println("-");
                                }else{
                                    String albumid=rs3.getString("album_id");
                                    Statement st2=con.createStatement();
                                    ResultSet rs4=st2.executeQuery("select album_name from albums where album_id="+albumid+"");
                                    if(rs4.next()){
                                        out.println(rs4.getString("album_name"));
                                    }
                                }
                            %>
                        </td>
                        <td>
                            <%
                                if(rs3.getString("artists_id")==null){
                                    out.println("-");
                                }else{
                                    String artistsid=rs3.getString("artists_id");
                                    Statement st3=con.createStatement();
                                    ResultSet rs5=st3.executeQuery("select artists_name from artists where artists_id="+artistsid+"");
                                    if(rs5.next()){
                                        out.println(rs5.getString("artists_name"));
                                    }
                                }
                            %>
                        </td>
                        <td>
                            <input type="button" value="delete" id="<%=rs3.getString("track_id")%>" onclick="{document.deltrack.ids.value=this.id;document.deltrack.submit();}"/>
                        </td>
                    </tr>
                    <%
                        }
                        con.close();
                    %>
                </table>
                </form>
            </div>
        </div>
    </body>
</html>
