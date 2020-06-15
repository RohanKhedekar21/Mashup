/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import MyDb.dbConnection;
import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
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
import javax.servlet.http.HttpSession;
/**
 *
 * @author asus
 */
@WebServlet(name = "addtoplaylist", urlPatterns = {"/addtoplaylist"})
public class addtoplaylist extends HttpServlet {

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
            
            HttpSession session  = request.getSession();
            String userid= (String) session.getAttribute("userid");
            String trackids=request.getParameter("trackid");
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from playlist where track_id="+trackids+" and user_id="+userid+";");
            if(rs.next()){
                response.sendRedirect(request.getContextPath());
            }else{
                int res=st.executeUpdate("insert into playlist(user_id,track_id) values('"+userid+"','"+trackids+"')");
                if(res!=0){
                    response.sendRedirect(request.getContextPath());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(addtoplaylist.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
