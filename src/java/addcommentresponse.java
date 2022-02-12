import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
import java.sql.*;
public class addcommentresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String comment = request.getParameter("comment");
            int sharedcodeid = Integer.parseInt(request.getParameter("sharedcodeid"));
            String susername = request.getSession().getAttribute("username").toString();
            ResultSet rs = DBLoader.executeSQl("select * from comments");
            rs.moveToInsertRow();
            rs.updateString("comment", comment);
            rs.updateString("commentedby", susername);
            rs.updateInt("sharedcodeid", sharedcodeid);
            rs.insertRow();
            out.println("success");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
