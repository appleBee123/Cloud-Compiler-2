import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import java.sql.*;
public class friendrequestresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            if(request.getSession().getAttribute("username") != null)
            {
               String susername = request.getSession().getAttribute("username").toString();
               ResultSet rs = DBLoader.executeSQl("select * from friends where requestfrom='" + susername + "' and requestto='" + username + "'");
               if(rs.next())
               {
                   out.println("Already Sent");
               }
               else
               {
                   rs.moveToInsertRow();
                   rs.updateString("requestfrom", susername);
                   rs.updateString("requestto", username);
                   rs.insertRow();
                   out.println("success");
               }
                       
            }
            else                                                       // username = null
            {
                out.println("not in session");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
