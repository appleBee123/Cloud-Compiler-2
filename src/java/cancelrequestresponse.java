import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class cancelrequestresponse extends HttpServlet {

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
                rs.deleteRow();
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
