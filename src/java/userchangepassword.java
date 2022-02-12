import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import java.sql.*;
public class userchangepassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            String oldpassword = request.getParameter("oldpassword");
            String newpassword = request.getParameter("newpassword");
            ResultSet rs = DBLoader.executeSQl("select * from users where username='" + username + "' and password='" + oldpassword + "'" );
            if(rs.next())
            {
                request.getSession().removeAttribute("username");
                rs.updateString("password", newpassword);
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
