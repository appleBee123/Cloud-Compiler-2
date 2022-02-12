import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class adminloginresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            ResultSet rs = DBLoader.executeSQl("select * from admin where username='" + username + "' and password='" + password + "'");
            if(rs.next())
            {
                request.getSession().setAttribute("adminusername",username);
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
