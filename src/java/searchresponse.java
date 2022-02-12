import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
public class searchresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
            String keyword = request.getParameter("keyword");
            if(request.getSession().getAttribute("username") == null)
            {
                String jsondata = new RDBMS_TO_JSON().generateJSON("select * from users where name like '%" + keyword + "%'");
                out.println(jsondata);
            }
            else
            {
                String username = request.getSession().getAttribute("username").toString();
                String jsondata = new RDBMS_TO_JSON().generateJSON("select * from users where name like '%" + keyword + "%' and username != '" + username + "'");
                out.println(jsondata);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
