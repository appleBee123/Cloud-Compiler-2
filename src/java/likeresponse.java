import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;
public class likeresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
           int sharedcodeid = Integer.parseInt(request.getParameter("sharedcodeid"));
           String susername = request.getSession().getAttribute("username").toString();
           ResultSet rs = DBLoader.executeSQl("select * from liketable where likedby='" + susername + "' and sharedcodeid=" + sharedcodeid);
           if(rs.next())
           {
               rs.deleteRow();
           }
           else
           {
               rs.moveToInsertRow();
               rs.updateString("likedby", susername);
               rs.updateInt("sharedcodeid", sharedcodeid);
               rs.insertRow();
           }
            out.println("success");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
