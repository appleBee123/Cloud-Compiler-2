import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import vmm.DBLoader;
public class fetchfriendsresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
            String susername = request.getParameter("susername");
            String jsondata = new RDBMS_TO_JSON().generateJSON("select * from friends where requestfrom='" + susername + "' and status = 'friends' ");
            out.println(jsondata);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
