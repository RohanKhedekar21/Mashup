/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import MyDb.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "delGenres", urlPatterns = {"/delGenres"})
public class delGenres extends HttpServlet {

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
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            int rs=st.executeUpdate("delete from genres where genres_id='"+id+"';");
            if(rs!=0){
                response.sendRedirect("Admin.jsp");
            }else{
                out.println("faild");
            }
        } catch (SQLException ex) {
            Logger.getLogger(delGenres.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
