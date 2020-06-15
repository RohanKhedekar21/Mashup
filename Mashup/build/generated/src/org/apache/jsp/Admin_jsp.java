package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/AdminPageStyling.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"javascript/AdminJavascript.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        \n");
      out.write("        <title>Admin</title>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"height: 100%;width: 100%;\">\n");
      out.write("        <!--Navigation bar-->\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <img src=\"images/MashUp_Logo.png\" alt=\"\" width=\"100%\" height=\"100%\"/>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"menubar\">\n");
      out.write("            <button class=\"menubtns\" onclick=\"openhomepage()\">Home</button>\n");
      out.write("            <button class=\"menubtns\" onclick=\"openalbumpage()\">Album</button>\n");
      out.write("            <button class=\"menubtns\" onclick=\"openartistspage()\">Artists</button>\n");
      out.write("            <button class=\"menubtns\" onclick=\"opengenrespage()\">Genres</button>\n");
      out.write("            <button class=\"menubtns\" onclick=\"opentrackpage()\">Tracks</button>\n");
      out.write("            <button class=\"menubtns\" onclick=\"openadvertiespage()\">Adverties</button>\n");
      out.write("            <button class=\"menulogout\" onclick=\"Logout()\"><span style=\"font-weight: bold;\">Logout</span></button>\n");
      out.write("        </div>\n");
      out.write("        <div style=\"width: 100%;height: 84vh;\" id=\"centerpage\">\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
