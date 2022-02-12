import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class acceptrequestresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        try
        {
            String fid = request.getParameter("fid");
            ResultSet rs = DBLoader.executeSQl("select * from friends where fid='" + fid + "'");
            if(rs.next())
            {
                String requestfrom = rs.getString("requestfrom");
                String requestto = rs.getString("requestto");
                rs.updateString("status", "friends");
                rs.updateRow();
                rs.moveToInsertRow();
                rs.updateString("requestto", requestfrom);
                rs.updateString("requestfrom", requestto);
                rs.updateString("status", "friends");
                rs.insertRow();
                out.println("success");
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
