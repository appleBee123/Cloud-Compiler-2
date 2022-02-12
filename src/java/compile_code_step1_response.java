import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;    

@MultipartConfig
public class compile_code_step1_response extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       try
       {
           String language = request.getParameter("language");
           language = language.toLowerCase();
           String codetext = request.getParameter("codetext");
           String foldername = "public";
           String filename = "";
           String absolutepath = getServletContext().getRealPath("/all_users_data");
           File f = new File(absolutepath + "\\" + foldername);
           if(!f.exists())
           {
               f.mkdir();
           }
           File f1 = new File(absolutepath + "\\" + foldername + "\\" + language);
           if(!f1.exists())
           {
               f1.mkdir();
           }
           if(language.equals("c") || language.equals("cpp") || language.equals("python"))
           {
               filename = new Date().getTime() + "";
           }
           else
           {
               filename = codetext.substring(codetext.indexOf("class") + 6, codetext.indexOf("{")).trim();
           }
           if(language.equals("python"))
           {
               language = "py";
           }
           FileWriter fw = new FileWriter(f1 + "\\" + filename + "." + language);
           for(int i = 0; i<codetext.length(); i++)
           {
               fw.write(codetext.charAt(i));
           }
           fw.flush();
           fw.close();
           request.getSession().setAttribute("filename", filename);
           out.println("success");
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
    }

}
