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
import javax.resource.cci.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author asus
 */
@WebServlet(name = "emaillogin", urlPatterns = {"/emaillogin"})
public class emaillogin extends HttpServlet {

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
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            
            int iend = email.indexOf("@"); //this finds the first occurrence of "." 
            String sessionusername = null;
            if (iend != -1) 
            {
                sessionusername= email.substring(0 , iend); //this will give abc
            }
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            java.sql.ResultSet rs=st.executeQuery("select * from email_user where u_email='"+email+"' and password='"+pass+"'");            
            if(rs.next()){
                HttpSession session = request.getSession(true);
                session.setAttribute("user", sessionusername);
                String sessionusernameid=rs.getString("user_id");
                session.setAttribute("userid",sessionusernameid);
                response.sendRedirect("index.jsp");
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("location.replace(document.referrer);");
                out.println("alert('Please enter valid Email and Password');");
                out.println("</script>");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(emaillogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
