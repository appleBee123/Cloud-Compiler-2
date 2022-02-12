import vmm.DBLoader;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
public class activeusersresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
           String jsondata = new RDBMS_TO_JSON().generateJSON("select * from users where status='active' ");
           out.println(jsondata);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
