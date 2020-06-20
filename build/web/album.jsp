<%-- 
    Document   : album
    Created on : Feb 23, 2019, 5:57:12 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/AdminPageStyling.css" rel="stylesheet" type="text/css" />
        <script src="javascript/AdminJavascript.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body style="width: 100%;height: 100%;">
        <div style="border-right: 1px solid black;width: 20%;height: 84vh;float: left;" >
            <div style="padding-top: 20px;width: 100%;text-align: center;">
                <h1>Add Album</h1>
                <div style="margin: 10px;width: 90%;text-align: center;border: 2px solid black">
                    <form action="addalbum" method="POST" enctype="multipart/form-data" onSubmit="return addalbumvalidate();">
                        <p style="padding-top: 20px;">Enter Album Name<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="text" name="albumname" id="albumname"  style="width: 80%;"/>
                        <p style="padding-top: 20px;">Enter Release Date<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="date" name="releasedate" id="releasedate" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Upload image<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="file" name="file" id="imagefile" accept="image/*" style="width: 80%;"/>
                        <br><br>
                        <input type="submit" value="Add" style="width: 30%;height: 30px;cursor: pointer;"/>
                        <br><br>
                    </form>
                </div>
            </div>
        </div>
        <div style="width: 79.9%;height: 84vh;float: left;">
            <div style="border-bottom: 2px solid black;width: 100%;height: 10%;">
                <h1 style="text-align: center;padding-top: 7px;">Albums</h1>
            </div>
            <div style="text-align: center;width: 100%;">
                <form name="delalbum" action="delAlbum" method="POST"><input type="hidden" name="ids" />
                <table border="1" class="albumtable">
                    <tr>
                        <th>No.</th>
                        <th>Album id</th>
                        <th>Album Name</th>
                        <th>Album ReleaseDate</th>
                        <th>Poster path</th>
                        <th></th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                        Statement st=con.createStatement();
                                
                        ResultSet rs3=st.executeQuery("select * from albums");
                        while(rs3.next()){
                    %>
                    <tr>
                        <td class="counterCell"></td>
                        <td><%=rs3.getString("album_id")%></td>
                        <td><%=rs3.getString("album_name")%></td>
                        <td><%=rs3.getString("album_releasedate")%></td>
                        <td><%=rs3.getString("album_picture")%></td>
                        <td>
                            <input type="button" value="delete" id="<%=rs3.getString("album_id")%>" onclick="{document.delalbum.ids.value=this.id;document.delalbum.submit();}"/>
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
