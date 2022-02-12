import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class userlogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("username");
        response.sendRedirect("index.jsp");
    }
}
