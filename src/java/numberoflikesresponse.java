import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class numberoflikesresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            int scid = Integer.parseInt(request.getParameter("scid"));
            int likes = 0;
            ResultSet rs = DBLoader.executeSQl("select shid from sharedcodes where scid=" + scid);
            {
                while(rs.next())
                {
                    int shid = rs.getInt("shid");
                    ResultSet rs1 = DBLoader.executeSQl("select * from liketable where sharedcodeid=" + shid);
                    while(rs1.next())
                    {
                        likes++;
                    }
                }
            }
            out.println(likes);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
