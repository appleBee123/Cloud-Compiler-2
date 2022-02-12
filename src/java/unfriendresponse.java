import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class unfriendresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String fid = request.getParameter("fid");
            ResultSet rs = DBLoader.executeSQl("select * from friends where fid=" + fid);
            if(rs.next())
            {
               String requestfrom = rs.getString("requestfrom");
               String requestto = rs.getString("requestto");
               rs.deleteRow();
               ResultSet rs1 = DBLoader.executeSQl("select * from friends where requestfrom='" + requestto + "' and requestto='" + requestfrom + "' and status='friends'");
               if(rs1.next())
               {
                   rs1.deleteRow();
                   out.println("success");
               }
               else
               {
                   out.println("fail");
               }
            }
            else
            {
                out.println("fail");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
