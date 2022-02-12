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
          function gotosharesavedcodes(scid)
          {
              location.href = "sharesavedcodes.jsp?scid=" + scid;
          }
          function viewcodelogic(path,title)
          {
              var xhttp = new XMLHttpRequest();
              xhttp.onreadystatechange = function()
              {
                if(this.readyState == 4 && this.status == 200)
                {
                    var res = this.responseText;
                    res = res.trim();
                    document.getElementById("modalheading").innerHTML = title;
                    document.getElementById("modalbody").innerHTML = res;
                    $('#viewcodemodal').modal('show');
                }
              };
              xhttp.open("GET",path,true);
              xhttp.send();
          }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Saved Codes</h1>
            <% 
                try{
               String susername = session.getAttribute("username").toString();
               ResultSet rs = DBLoader.executeSQl("select * from savedcodes where username='" + susername + "'");
               while(rs.next())
               {
                   String title = rs.getString("title");
                   String path = rs.getString("filepath");
                   int scid = rs.getInt("scid");
                   String language = rs.getString("language");
                   if(language.equals("java"))
                   {
                       language = "Java";
                   }
                   else if(language.equals("c"))
                   {
                       language = "C";
                   }
                   else if(language.equals("cpp"))
                   {
                       language = "C++";
                   }
                   else if(language.equals("python"))
                   {
                       language = "Python";
                   }
                   
            %> 
            <div style="border: 5px dotted #ffcccc; margin: 40px">
                <div class="row">
                    <div class="col-md-6" style="padding: 10px">
                        <label style="margin-top: 10px; margin-left: 70px; font-size: 20px">Title: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em><%= title %></em></label><br>
                        
                        <label style="margin-left: 70px; font-size: 20px">Language: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em><%= language %></em></label>
                    </div>
                    <div class="col-md-6" >
                       <input type="button" value="View Code" class="btn btn-secondary" style="margin-top: 33px; font-weight: bold" onclick="viewcodelogic('<%= path %>' , '<%= title %>')" />
                       <input type="button" value="Share Code" class="btn btn-secondary" style="margin-top: 33px; margin-left: 80px; font-weight: bold" onclick="gotosharesavedcodes(<%= scid %>)" />
                    </div>
                </div>
            </div>
            <%
               }
}
catch(Exception ex)
{
  ex.printStackTrace();
}
            %>
        </div>
        
         <div class="modal" id="viewcodemodal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="modalheading"></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="modalbody">
                        
                    </div>

                    <br><br>

                </div>
            </div>
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
