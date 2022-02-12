import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.DBLoader;

public class savecoderesponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String language = request.getParameter("language");
            language = language.toLowerCase();
            String title = request.getParameter("title");
            String foldername = "public";
            if(request.getSession().getAttribute("username") == null)
            {
                out.println("notinsession");
            }
            else
            {
                String username = request.getSession().getAttribute("username").toString();
                String filename = request.getSession().getAttribute("filename").toString();
                String extension = language;
                extension = extension.toLowerCase();
                if(extension.equals("python"))
                {
                    extension = "py";
                }
                String absolutepath = request.getServletContext().getRealPath("/all_users_data");
                String oldpath = absolutepath + "\\" + foldername + "\\" + language + "\\" + filename + "." + extension;
                String newpath = absolutepath + "\\" + username + "\\" + language + "\\" + title + "." + extension;
                String databasepath = "all_users_data/" + username + "/" + language + "/" + title + "." + extension;
                FileReader fr = new FileReader(oldpath);
                File fn=new File(absolutepath + "\\" + username);
                if(!fn.exists())
                {
                fn.mkdirs();
                }
                
                File f1 = new File(absolutepath + "\\" + username + "\\" + language);
        if (!f1.exists()) 
        {
            f1.mkdir();
        }
                FileWriter fw = new FileWriter(newpath);
                String str = "";
                int i;
                while((i = fr.read()) != -1)
                {
                    str += (char)i;
                }
                fw.write(str);
                fr.close();
                fw.flush();
                fw.close();
                ResultSet rs = DBLoader.executeSQl("select * from savedcodes");
                rs.moveToInsertRow();
                rs.updateString("language", language);
                rs.updateString("username", username);
                rs.updateString("filepath", databasepath);
                rs.updateString("title", title);
                rs.insertRow();
                out.println("success");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
