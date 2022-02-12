import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class runpythonresponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
           String language = request.getParameter("language");
           String userinput = request.getParameter("userinput");
           String filename = request.getSession().getAttribute("filename").toString();
           String foldername = "public";
           userinput = userinput.replace(",", " ");
           String absolutepath = request.getServletContext().getRealPath("/all_users_data");
           absolutepath += "\\" + foldername + "\\" + language;
           File f = new File(absolutepath);
           ProcessBuilder pb = new ProcessBuilder("cmd","/c",filename + ".py" + " " + userinput);
           pb.directory(f);
           Process p = pb.start();
           InputStreamReader isr = new InputStreamReader(p.getInputStream());
           BufferedReader br = new BufferedReader(isr);
           InputStreamReader isr1 = new InputStreamReader(p.getErrorStream());
           BufferedReader br1 = new BufferedReader(isr1);
           String ans1 = "", ans2 = "";
           while((ans1 = br.readLine()) != null)
           {
               out.println(ans1);
           }
           while((ans2 = br1.readLine()) != null)
           {
               out.println(ans2);
           }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
