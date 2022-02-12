import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class numberofsharedcodesresponse2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String susername = request.getSession().getAttribute("username").toString();
            int count = 0;
          ResultSet rs = DBLoader.executeSQl("select * from sharedcodes where sharedwith='" + susername + "'");  
          while(rs.next())
          {
            count++;  
          }
          out.println(count);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
