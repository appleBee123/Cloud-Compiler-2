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
      function adminchangepassword()
      {
          var errormessage = document.getElementById("errormessage");
          errormessage.innerHTML = "";
          var username = document.getElementById("ausername").value;
          var oldpassword = document.getElementById("aoldpassword").value;
          var newpassword = document.getElementById("anewpassword").value;
          var confirmpassword = document.getElementById("aconfirmpassword").value;
          if(oldpassword == "" || newpassword == "" || confirmpassword == "")
          {
              errormessage.innerHTML = "All Fields are Mandatory";
          }
          else if(newpassword != confirmpassword)
          {
              errormessage.innerHTML = "New Password and Confirm Password Must Be the Same";
          }
          else
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
                        errormessage.style.color = "green";
                        errormessage.innerHTML = "Password Changed Successfully. You can Now Login with Your New Password";
                        setTimeout(gotoindex,2000);
                    }
                    else
                    {
                        errormessage.innerHTML = "Invalid Old Password";
                    }
                }
              };
              var url = "./adminchangepasswordresponse?username=" + username + "&oldpassword=" + oldpassword + "&newpassword=" + newpassword;
              xhttp.open("GET",url,true);
              xhttp.send();
          }
      }
      function gotoindex()
      {
          location.href = "index.jsp";
      }
  </script>
    </head>
    <body>
        <%  
            String username = session.getAttribute("adminusername").toString();
        %>
        <div class="container">                        
                <h1 class="mt-4">Change Password</h1>
                <div class="col-12">
                    <input type="text" class="form-control mb-3" id="ausername" value="<%= username %>" readonly />
                </div>
                <div class="col-12">
                    <input type="password" class="form-control mb-3" id="aoldpassword" placeholder="Enter Old Password" />
                </div>
                <div class="col-12">
                    <input type="password" class="form-control mb-3" id="anewpassword" placeholder="Enter New Password" />
                </div>
                <div class="col-12">
                    <input type="password" class="form-control mb-3" id="aconfirmpassword" placeholder="Enter Confirm Password" />
                </div>
                <div class="col-12">
                    <input type="button" class="btn btn-primary" value="CHANGE" onclick="adminchangepassword()" />
                </div>
                <h3 id="errormessage" style="color: red"></h3>           
        </div>
                
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
