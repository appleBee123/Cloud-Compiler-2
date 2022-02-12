import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import java.sql.*;
public class userloginresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            ResultSet rs = DBLoader.executeSQl("select * from users where username='" + username + "' and password='" + password + "'");
            if(rs.next())
            {
                String status = rs.getString("status");
                if(status.equals("pending"))
                {
                    out.println("notactive");
                }
                else
                {
                    request.getSession().setAttribute("username", username);
                    out.println("success");
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
