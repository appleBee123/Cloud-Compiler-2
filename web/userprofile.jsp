<%@page import="java.sql.*" %>
<%@page import="vmm.DBLoader" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          
         <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">
  
  <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
  
        <script src="js/jquery-3.6.0.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        
        <script>
            function sendfriendrequestlogic(username)
            {
                var username = username;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                  if(this.readyState == 4 && this.status == 200)
                  {
                     var res = this.responseText;
                     res = res.trim();
                     if(res == "success")
                     {
                         document.getElementById("buttonfriend").value = "Friend Request Sent";
                     }
                     else if(res == "not in session")
                     {
                         alert("You have to Login to Send Request");
                         location.href = "index.jsp";
                     }
                     else
                     {
                         alert(res);
                     }
                  }
                };
                var url = "./friendrequestresponse?username=" + username;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
          function putformatting()
          {
              var userimage = document.getElementById("userimage"); 
              userimage.style.border = "dotted 5px #ffcccc";
              userimage.style.width = "330px";
              userimage.style.height = "330px";
          }
          function removeformatting()
          {
              var userimage = document.getElementById("userimage");
              userimage.style.border = "";
              userimage.style.width = "300px";
              userimage.style.height = "300px";
          }
        </script>
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        
        <% 
            try{
           String username = request.getParameter("username"); 
          
           String name = "";
           String email = "";
           String phoneno = "";
           String gender = "";
           String photo = "";
           String primarylanguage = "";
           ResultSet rs = DBLoader.executeSQl("select * from users where username='" + username + "'");
           if(rs.next())
           {
               name = rs.getString("name");
               email = rs.getString("email");
               phoneno = rs.getString("phoneno");
               gender = rs.getString("gender");
               photo = rs.getString("photo");
               primarylanguage = rs.getString("primarylanguage");
           }
        %>
        <div class="container" style="margin-top: 200px">
            <div class="row">
                <div class="col-md-5 text-center">
                    <img src="<%= photo %>" style="width: 300px; height: 300px" id="userimage" onmouseover="putformatting()" onmouseout="removeformatting()" />
                </div>
                <div class="col-md-7">
                    <h1><%= name %></h1>
                    <h6><%= email %></h6>
                    <h6><%= phoneno %></h6>
                    <h6><%= gender %></h6>
                    <h6><%= primarylanguage %></h6>
                    <% 
                        if(session.getAttribute("username") != null)
                        {
                            String susername = session.getAttribute("username").toString();
                            ResultSet rs1 = DBLoader.executeSQl("select * from friends where requestfrom='" + susername + "' and requestto='" + username + "'");
                            if(rs1.next())
                            {
                                String status = rs1.getString("status");
                                if(status.equals("pending"))
                                {
                    %>
                                  <input type="button" value="Request Sent" id="buttonfriend" /> 
                    <%
                                }
                                else
                                {
                    %>
                                  <input type="button" value="Friends" id="buttonfriend" />
                    <%   
                                }
                            }
                            else
                            {
                    %>
                               <input type="button" value="Add Friend" onclick="sendfriendrequestlogic('<%= username %>')" id="buttonfriend" />
                    <%
                            }
                        }
                        else
                        {
                    %>
                            <input type="button" value="Add Friend" onclick="sendfriendrequestlogic('<%= username %>')" id="buttonfriend" />
                    <%
                        }
}
catch(Exception ex)
{
  ex.printStackTrace();
}
                    %>
                    
                </div>
            </div>
        </div>
              
        <br><br><br><br>
              
                    <%@include file="footer.jsp" %>
                    
                     <!-- jQuery -->
        <script src="plugins/jQuery/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="plugins/bootstrap/bootstrap.min.js"></script>
        <!-- slick slider -->
        <script src="plugins/slick/slick.min.js"></script>
        <!-- aos -->
        <script src="plugins/aos/aos.js"></script>
        <!-- venobox popup -->
        <script src="plugins/venobox/venobox.min.js"></script>
        <!-- filter -->
        <script src="plugins/filterizr/jquery.filterizr.min.js"></script>
        <!-- google map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
        <script src="plugins/google-map/gmap.js"></script>

        <!-- Main Script -->
        <script src="js/script.js"></script>
    </body>
</html>
