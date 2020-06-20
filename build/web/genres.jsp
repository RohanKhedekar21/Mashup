<%-- 
    Document   : genres
    Created on : Feb 24, 2019, 8:22:16 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="border-right: 1px solid black;width: 20%;height: 84vh;float: left;" >
            <div style="padding-top: 20px;width: 100%;text-align: center;">
                <h1>Add Genres</h1>
                <div style="margin: 10px;width: 90%;text-align: center;border: 2px solid black">
                    <form action="addgenres" method="POST" onsubmit="return addgenresvalidation();">
                        <p style="padding-top: 20px;">Enter Genres Name<span style="color:red;font-weight: bold;">*</span></p>
                        <input type="text" name="genresname" id="genresname" style="width: 80%;"/>
                        <p style="padding-top: 20px;">Enter Genres Description</p>
                        <input type="text" name="genresdescription" style="width: 80%;"/>
                        <br><br>
                        <input type="submit" value="Add" style="width: 30%;height: 30px;cursor: pointer;"/>
                        <br><br>
                    </form>
                </div>
            </div>
        </div>
        <div style="width: 79.9%;height: 84vh;float: left;">
            <div style="border-bottom: 2px solid black;width: 100%;height: 10%;">
                <h1 style="text-align: center;padding-top: 7px;">Genres</h1>
            </div>
            <div style="text-align: center;width: 100%;">
                <form name="delgenres" action="delGenres" method="POST"><input type="hidden" name="ids" />
                <table border="1" class="albumtable">
                    <tr>
                        <th>No.</th>
                        <th>Genres id</th>
                        <th>Genres Name</th>
                        <th>Genres Description</th>
                        <th></th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashup?useSSL=false","root","root");
                        Statement st=con.createStatement();
                                
                        ResultSet rs3=st.executeQuery("select * from genres");
                        while(rs3.next()){
                    %>
                    <tr>
                        <td class="counterCell"></td>
                        <td><%=rs3.getString("genres_id")%></td>
                        <td><%=rs3.getString("genres_name")%></td>
                        <td>
                            <%
                                if(rs3.getString("genres_description")==null || rs3.getString("genres_description").isEmpty()){
                                    out.println("-");
                                }else{
                                    out.println(rs3.getString("genres_description"));
                                }
                            %>
                        </td>
                        <td>
                            <input type="button" value="delete" id="<%=rs3.getString("genres_id")%>" onclick="{document.delgenres.ids.value=this.id;document.delgenres.submit();}"/>
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
