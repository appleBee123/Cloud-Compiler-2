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
      var gotp = "";
      function forgotpasswordlogic()
      {
          document.getElementById("otpmessage").innerHTML = "";
          var username = document.getElementById("username3").value;
          if(username == "")
          {
              document.getElementById("otpmessage").innerHTML = "Please Enter Username";
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
                if(res == "fail")
                {
                    document.getElementById("otpmessage").innerHTML = "Wrong Username";
                }
                else
                {
                    gotp = res;
                    document.getElementById("section1").style.display = "none";
                    document.getElementById("section2").style.display = "block";
                }
            }
          };
          var url = "./forgotpasswordresponse?username=" + username;
          xhttp.open("GET",url,true);
          xhttp.send();
          }
      }
      function checkotplogic()
      {
          var checkotpmessage = document.getElementById("checkotpmessage");
          checkotpmessage.innerHTML = "";
          var otp = document.getElementById("otp").value;
          if(otp == "")
          {
              checkotpmessage.innerHTML = "Please Enter the OTP"; 
          }
          else
          {
              if(otp == gotp)
              {
                  document.getElementById("section2").style.display = "none";
                  document.getElementById("section3").style.display = "block";
              }
              else
              {
                  checkotpmessage.innerHTML = "Wrong OTP";
              }
          }
      }
      function forgotpasswordstep2()
      {
          var passwordmessage = document.getElementById("passwordmessage");
          passwordmessage.innerHTML = "";
          var newpassword = document.getElementById("newpassword3").value;
          var confirmpassword = document.getElementById("confirmpassword3").value;
          if(newpassword == "" || confirmpassword == "")
          {
              passwordmessage.innerHTML = "Please Fill Out All Fields";
          }
          else if(newpassword != confirmpassword)
          {
              passwordmessage.innerHTML = "New Password and Confirm Password Must Be Same";
          }
          else
          {
              var username = document.getElementById("username3").value;
              var xhttp = new XMLHttpRequest();
              xhttp.onreadystatechange = function()
              {
                if(this.readyState == 4 && this.status == 200)
                {
                    var res = this.responseText;
                    res = res.trim();
                    if(res == "success")
                    {
                        passwordmessage.style.color = "green";
                        passwordmessage.innerHTML = "Password Changed Successfully. You can Login Now.";
                        setTimeout(gotoindex,3000);
                    }
                    else
                    {
                        passwordmessage.innerHTML = "Some Error Occured";
                    }
                }
              };
              var url = "./forgotpasswordstep2?username=" + username + "&newpassword=" + newpassword;
              xhttp.open("GET",url,true);
              xhttp.send();
          }
      }
      
  </script>
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        
        <div class="container" style="margin-top: 200px">
            <div id="section1">
                <input type="text" id="username3" class="form-control" placeholder="Enter Username" />
                <br>
                <input type="button" value="Submit" class="btn btn-primary" onclick="forgotpasswordlogic()" />
                <p id="otpmessage" style="color: red; font-weight: bold"></p>
            </div>
            <div id="section2" style="display: none">
                <input type="text" id="otp" class="form-control" placeholder="Enter OTP" />
                <br>
                <input type="button" value="Submit" class="btn btn-primary" onclick="checkotplogic()" />
                <p id="checkotpmessage" style="color: red; font-weight: bold"></p>
            </div>
            <div id="section3" style="display: none">
                <input type="password" id="newpassword3" class="form-control" placeholder="Enter New Password" />
                <br>
                <input type="password" id="confirmpassword3" class="form-control" placeholder="Confirm Password" />
                <br>
                <input type="button" value="Change" class="btn btn-primary" onclick="forgotpasswordstep2()" />
                <p id="passwordmessage" style="color: red; font-weight: bold"></p>
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
