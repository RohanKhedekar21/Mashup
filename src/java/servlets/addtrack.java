/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import MyDb.dbConnection;
import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author asus
 */
@MultipartConfig
@WebServlet(name = "addtrack", urlPatterns = {"/addtrack"})
public class addtrack extends HttpServlet {

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
        
        String trackname=request.getParameter("trackname");
        String track_playtime=request.getParameter("trackplaytime");
        String albumname=request.getParameter("album");
        String artistsname=request.getParameter("artists");
        String lyric=request.getParameter("lyric");
        
        final Part filePart = request.getPart("file");
        final String path = "D:\\rohan\\My Projects\\Mashup\\web\\music";
        final String fileName = (String) getFileName(filePart);
        OutputStream outStream = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();
        String location="music/"+fileName;
        
        try (PrintWriter out = response.getWriter()) {
            
            
            
            outStream = new FileOutputStream(new File(path + File.separator + fileName));
            filecontent = filePart.getInputStream();
            
            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                outStream.write(bytes, 0, read);
            }
            writer.println("New file " + fileName + " created at " + path);
            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", new Object[]{fileName, path});
            
            dbConnection db=new dbConnection();
                Connection con =db.getCon();
                Statement st=con.createStatement();
                int er=st.executeUpdate("insert into tracks(track_name,track_playtime,track_url,album_id,track_lyric,artists_id) values('"+trackname+"','"+track_playtime+"','"+location+"','"+albumname+"','"+lyric+"','"+artistsname+"');");
                if(er!=0){
                    response.sendRedirect("Admin.jsp");
                }else{
                    System.out.println("not done");
                }
            
        } catch (FileNotFoundException fne) {
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + fne.getMessage());
            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                    new Object[]{fne.getMessage()});
        } catch (SQLException ex) {
            Logger.getLogger(addtrack.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (outStream != null) {
                outStream.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (writer != null) {
                writer.close();
            }
        }
    }
    
    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
}
