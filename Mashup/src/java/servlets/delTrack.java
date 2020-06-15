/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import MyDb.dbConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
@WebServlet(name = "delTrack", urlPatterns = {"/delTrack"})
public class delTrack extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String id=request.getParameter("ids");
            String path = "D:\\rohan\\My Projects\\Mashup\\web";
            String path2 = null;
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            ResultSet rs2=st.executeQuery("select track_url from tracks where track_id="+id+";");
            if(rs2.next()){
                path2=rs2.getString("track_url");
            }
            
            String path3=path+File.separator+path2;
            File deletefile=new File(path3);
            
            int rs=st.executeUpdate("delete from tracks where track_id='"+id+"';");
            if(rs!=0){
                if(deletefile.delete()){
                    response.sendRedirect("Admin.jsp");
                }
            }else{
                out.println("faild");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(delTrack.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
