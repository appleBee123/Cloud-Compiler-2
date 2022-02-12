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
        
        <script>
            function cancelrequestlogic(fid)
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                   if(this.readyState == 4 && this.status == 200)
                   {
                        var res = this.responseText;
                        res = res.trim();
                        if(res == "success")
                        {
                          location.href = "viewsentrequests.jsp";
                        }
                        else
                        {
                            alert(res);
                            alert("Something Went Wrong");
                        }
                   }
                };
                var url = "./cancelrequestresponse?fid=" + fid;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Friend Requests Sent By You</h1>
            <%  
                try{
               String susername = session.getAttribute("username").toString();
               ResultSet rs = DBLoader.executeSQl("select * from friends where requestfrom='" + susername + "' and status='pending'");
               while(rs.next())
               {
                  String username = rs.getString("requestto");
                  String fid = rs.getString("fid");
                  ResultSet rs1 = DBLoader.executeSQl("select * from users where username='" + username + "'");
                  if(rs1.next())
                  {
                      String photo = rs1.getString("photo");
                      String name = rs1.getString("name");
                      String gender = rs1.getString("gender");
                      String email = rs1.getString("email");
            %>
            <div style="border: 10px dotted black; margin: 40px">
                <div class="row">
                    <div class="col-md-2">
                        <img src="<%= photo %>" style="width: 100px; height: 100px; margin: 10px" class="rounded-circle" />
                    </div>
                    <div class="col-md-3">
                        <h4 style="margin-top: 10px"><%= name %></h4>
                        <h5><%= gender %></h5>
                        <h5><%= email %></h5>
                    </div>
                    <div class="offset-md-3 col-md-2">
                        <input type="button" value="Cancel Request" class="btn btn-warning" style="margin-top: 35px; font-weight: bold" onclick="cancelrequestlogic(<%= fid %>)" />
                    </div>
                </div>
            </div>
            <%
                  }
               }
}
catch(Exception ex)
{
  ex.printStackTrace();
}
            %>
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
