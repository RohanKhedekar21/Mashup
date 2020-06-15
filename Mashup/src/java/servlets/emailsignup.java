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
@WebServlet(name = "emailsignup", urlPatterns = {"/emailsignup"})
public class emailsignup extends HttpServlet {

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
            //String databaseemails;
            String cpass=request.getParameter("cpass");
            
            int iend = email.indexOf("@"); //this finds the first occurrence of "." 
            String sessionusername = null;
            if (iend != -1) 
            {
                sessionusername= email.substring(0 , iend); //this will give abc
            }
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            ResultSet rs=st.executeQuery("select u_email from email_user where u_email='"+email+"';");
            if(rs.next()){
                out.println("<script type=\"text/javascript\">");
                out.println("location.replace(document.referrer);");
                out.println("alert('Enter Email has alredy Register please enter another Email Id');");
                out.println("</script>");
            }
            else{
                int r=st.executeUpdate("insert into email_user(u_email,password) values('"+email+"','"+cpass+"')");
                if(r!=0){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", sessionusername);
                    ResultSet rs2=st.executeQuery("select * from email_user where u_email='"+email+"' and password='"+cpass+"'");            
                    rs2.next();
                    String sessionusernameid=rs2.getString("user_id");
                    session.setAttribute("userid",sessionusernameid);
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(emailsignup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
