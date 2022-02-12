import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class sharecoderesponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String username = request.getParameter("username");
            int scid = Integer.parseInt(request.getParameter("scid"));
            String susername = request.getSession().getAttribute("username").toString();
            String language = "";
            ResultSet rs = DBLoader.executeSQl("select * from savedcodes where scid=" + scid);
            if(rs.next())
            {
                language = rs.getString("language");
            }
            ResultSet rs1 = DBLoader.executeSQl("select * from sharedcodes");
            rs1.moveToInsertRow();
            rs1.updateString("sharedwith", username);
            rs1.updateInt("scid", scid);
            rs1.updateString("ownedby", susername);
            rs1.updateString("language", language);
            rs1.insertRow();
            out.println("success");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
