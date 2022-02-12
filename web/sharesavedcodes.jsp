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
            function sharecode(username,scid,i)
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
                        var sharebutton = document.getElementById("button"+i);
                        sharebutton.value = "Shared";
                        sharebutton.disabled = true;
                      }
                      else
                      {
                        alert("Some Error Occurred");
                      }
                  }
                  
                };
                var url = "./sharecoderesponse?username=" + username + "&scid=" + scid;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        
        <%  
           int scid = Integer.parseInt(request.getParameter("scid"));
           String susername = session.getAttribute("username").toString();
           int i = 1;
        %>
        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Share Your Saved Code With Friends</h1>
            <%  
               ResultSet rs = DBLoader.executeSQl("select * from friends where requestfrom='" + susername + "' and status='friends' ");
               while(rs.next())
               {
                   String username = rs.getString("requestto");
                   
            %>
            <div style="border: 5px dotted #ffcccc; margin: 40px; padding: 15px">
                <div class="row">
                    <div class="col-md text-center">
                        <h5><em><%= username %></em></h5>
                </div>
                <div class="col-md text-center">
                <%  
                   ResultSet rs1 = DBLoader.executeSQl("select * from sharedcodes where sharedwith='" + username + "' and ownedby='" + susername + "' and scid=" + scid);
                   if(rs1.next())
                   {
                %> 
                      <input type="button" id="button<%= i %>" value="Shared" class="btn btn-secondary" disabled />
                <%
                   }
                   else
                   {
                %>
                      <input type="button" id="button<%= i %>" value="Share" class="btn btn-secondary" onclick="sharecode('<%= username %>' , <%= scid %>, <%= i %>)" />
                <%
                       
                   }
                %>
                
                    
                </div>
                </div>
                
            </div>
            <%
                i++;
               }
            %>
        </div>
        
        <br><br><br><br><br>
        
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
