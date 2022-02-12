import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class blockuserresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            ResultSet rs = DBLoader.executeSQl("select * from users where username='" + username + "'");
            if(rs.next())
            {
                rs.updateString("status", "pending");
                rs.updateRow();
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
