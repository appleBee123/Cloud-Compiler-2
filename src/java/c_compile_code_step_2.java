import java.io.*;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;

public class c_compile_code_step_2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
           String language = request.getParameter("language");
           String filename = request.getSession().getAttribute("filename").toString();
           String foldername = "public";
           ProcessBuilder pb = new ProcessBuilder("cmd","/c","gcc " + filename + ".c -o " + filename + ".exe");
           Map<String,String> environment = pb.environment();
           environment.clear();
           environment.put("Path",path.c);
           String absolutepath = request.getServletContext().getRealPath("/all_users_data");
           absolutepath += "\\" + foldername + "\\" + language;
           File f = new File(absolutepath);
           pb.directory(f);
           Process p = pb.start();
           String ans = "";
           InputStream is;
           int exitCode = p.waitFor();
           if(exitCode == 0)
           {
               is = p.getInputStream();
               out.println("File Saved and Compiled Successfully");
           }
           else
           {
               is = p.getErrorStream();
               File f1 = new File(absolutepath + "\\" + filename + ".c");
               if(f1.exists())
               {
                   f1.delete();
               }
           }
               InputStreamReader isr = new InputStreamReader(is);
               BufferedReader br = new BufferedReader(isr);
               while(true)
               {
                   String s = br.readLine();
                   if(s == null)
                   {
                       break;
                   }
                   out.println(s);
               }
               br.close();
           }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}
