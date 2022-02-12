import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminlogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("adminusername");
        response.sendRedirect("index.jsp");
    }
}
