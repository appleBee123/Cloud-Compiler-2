import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class forgotpasswordstep2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            String newpassword = request.getParameter("newpassword");
            ResultSet rs = DBLoader.executeSQl("select * from users where username='" + username + "'");
            rs.next();
            rs.updateString("password", newpassword);
            rs.updateRow();
            out.println("success");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
