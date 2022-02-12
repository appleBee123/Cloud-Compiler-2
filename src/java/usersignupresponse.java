import javax.servlet.annotation.MultipartConfig;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import vmm.DBLoader;
import vmm.FileUploader;

@MultipartConfig
public class usersignupresponse extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try 
        {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phoneno = request.getParameter("phoneno");
            String gender = request.getParameter("gender");
            String primarylanguage = request.getParameter("primarylanguage");
            Part photopart = request.getPart("photo");
            ResultSet rs = DBLoader.executeSQl("select * from users where username='"+ username +"'");
            if(rs.next())
            {
                out.println("fail");
            }
            else
            {
                String relpath = "myuploads";
                String abspath = getServletContext().getRealPath("/"+relpath);
                
                String new_file_name = System.currentTimeMillis() + "-" + photopart.getSubmittedFileName();
                
                String ans1 = FileUploader.savefileonserver(photopart, abspath, new_file_name);
                
                rs.moveToInsertRow();
                
                rs.updateString("username", username);
                rs.updateString("name", name);
                rs.updateString("password", password);
                rs.updateString("email", email);
                rs.updateString("phoneno", phoneno);
                rs.updateString("gender", gender);
                rs.updateString("primarylanguage", primarylanguage);
                rs.updateString("photo", relpath + "/" + new_file_name);
                
                rs.insertRow();
                
                out.println("success");
                
            }
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
