<%-- 
    Document   : artists
    Created on : Feb 24, 2019, 6:57:16 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/AdminPageStyling.css" rel="stylesheet" type="text/css" />
        <script src="javascript/AdminJavascript.js" type="text/javascript"></script>
    </head>
    <body>
        <div style="border-right: 1px solid black;width: 20%;height: 84vh;float: left;" >
            <div style="padding-top: 20px;width: 100%;text-align: center;">
                <h1>Add Artists</h1>
                <div style="margin: 10px;width: 90%;text-align: center;border: 2px solid black">
                    <form action="addartists" method="POST" enctype="multipart/form-data" onsubmit="return addartistsvalidation();">
                        <p style="padding-top: 20px;">Enter Artists Name<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="text" name="artistsname" id="artistsname" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Enter Artists Description</p>
                        <input type="text" name="artistsdescription" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Enter Artists Year Active</p>
                        <input type="text" name="activeyear" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Artists Information</p>
                        <input type="text" name="artistsinfo" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Add Artists Picture<span style="color:red;font-weight: bold;">*</span></p>
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
                <h1 style="text-align: center;padding-top: 7px;">Artists</h1>
            </div>
            <div style="text-align: center;width: 100%;">
                <form name="delartists" action="delArtists" method="POST"><input type="hidden" name="ids" />
                <table border="1" class="albumtable">
                    <tr>
                        <th>No.</th>
                        <th>Artists id</th>
                        <th>Artists Name</th>
                        <th>Artists Description</th>
                        <th>Artists Year Active</th>
                        <th>Artists Information</th>
                        <th>Artists Picture</th>
                        <th></th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                        Statement st=con.createStatement();
                                
                        ResultSet rs3=st.executeQuery("select * from artists");
                        while(rs3.next()){
                    %>
                    <tr>
                        <td class="counterCell"></td>
                        <td><%=rs3.getString("artists_id")%></td>
                        <td><%=rs3.getString("artists_name")%></td>
                        <td>
                            <%
                                if(rs3.getString("artists_description")==null || rs3.getString("artists_description").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("artists_description"));
                                }
                            %>
                        </td>
                        <td>
                            <%
                                if(rs3.getString("artists_year_active")==null || rs3.getString("artists_year_active").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("artists_year_active"));
                                }
                            %>
                        </td>
                        <td>
                            <%
                                if(rs3.getString("artists_otherinfo")==null || rs3.getString("artists_otherinfo").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("artists_otherinfo"));
                                }
                            %>
                        </td>
                        <td>
                            <%
                                if(rs3.getString("artists_picture")==null || rs3.getString("artists_picture").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("artists_picture"));
                                }
                            %>
                        </td>
                        <td>
                            <input type="button" value="delete" id="<%=rs3.getString("artists_id")%>" onclick="{document.delartists.ids.value=this.id;document.delartists.submit();}"/>
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
