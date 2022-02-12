import vmm.RDBMS_TO_JSON;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import java.sql.*;
public class getcomments extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        int scid;
        try
        {
            int sharedcodeid = Integer.parseInt(request.getParameter("sharedcodeid"));
            
            ResultSet rs = DBLoader.executeSQl("select * from sharedcodes where shid=" + sharedcodeid);
            if(rs.next())
            {
                scid = rs.getInt("scid");
                String jsondata = new RDBMS_TO_JSON().generateJSON("select * from comments inner join sharedcodes on comments.sharedcodeid=sharedcodes.shid where scid=" + scid);
                out.println(jsondata);
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
