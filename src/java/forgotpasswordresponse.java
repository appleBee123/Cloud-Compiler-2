import java.sql.*;
import java.io.*;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import vmm.smssender;
public class forgotpasswordresponse extends HttpServlet {

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
                String phoneno = rs.getString("phoneno");
                Random obj = new Random();
                int otp = obj.nextInt(9000) + 1000;
                smssender.sendSMS(phoneno,"Your OTP is " + otp);
                out.println(otp);
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
