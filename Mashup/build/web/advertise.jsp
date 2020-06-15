<%-- 
    Document   : adverties
    Created on : Feb 24, 2019, 11:05:06 PM
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
        <title>Admin page</title>
    </head>
    <body style="width: 100%;height: 100%;">
        <div style="border-right: 1px solid black;width: 20%;height: 84vh;float: left;" >
            <div style="padding-top: 20px;width: 100%;text-align: center;">
                <h1>Add Advertise</h1>
                <div style="margin: 10px;width: 90%;text-align: center;border: 2px solid black">
                    <form action="addadv" method="POST" enctype="multipart/form-data" onsubmit="return addadvvalidation();">
                        <p style="padding-top: 20px;">Upload image<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="file" name="file" id="imagefile" accept="image/*" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Select Album<span style="color:red;font-weight: bold;">*</span></p>
                        <select name="album" id="albumselector" style="width: 80%;">
                            <option disabled selected value=""> -- select an option -- </option>
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
                        <br><br>
                        <input type="submit" value="Add" style="width: 30%;height: 30px;cursor: pointer;"/>
                        <br><br>
                    </form>
                </div>
            </div>
        </div>
        <div style="width: 79.9%;height: 84vh;float: left;">
            <div style="border-bottom: 2px solid black;width: 100%;height: 10%;">
                <h1 style="text-align: center;padding-top: 7px;">Advertise</h1>
            </div>
            <div style="text-align: center;width: 100%;">
                <form name="deladv" action="deladv" method="POST"><input type="hidden" name="ids" />
                <table border="1" class="albumtable">
                    <tr>
                        <th>No.</th>
                        <th>Advertise</th>
                        <th>Album Name</th>
                        <th></th>
                    </tr>
                    <%
                        ResultSet rs3=st.executeQuery("select * from advertise");
                        while(rs3.next()){
                    %>
                    <tr>
                        <td class="counterCell"></td>
                        <td style="width: 600px;height: 250px;">
                            <img src="<%=rs3.getString("adv_poster")%>" width="100%" height="100%"/>
                        </td>
                        <td>
                            <%
                                String albumid=rs3.getString("album_id");
                                Statement st2=con.createStatement();
                                ResultSet rs4=st2.executeQuery("select album_name from albums where album_id="+albumid+";");
                                if(rs4.next()){
                                    out.println(rs4.getString("album_name"));
                                }
                            %>
                        </td>
                        <td>
                            <input type="button" value="delete" id="<%=rs3.getString("adv_id")%>" onclick="{document.deladv.ids.value=this.id;document.deladv.submit();}"/>
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
