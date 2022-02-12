<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
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
            function fetchactiveusers()
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                  if(this.readyState == 4 && this.status == 200)
                  {
                      var res = this.responseText;
                      res = res.trim();
                      var mainobj = JSON.parse(res);
                      var arr = mainobj["ans"];
                      var username = "";
                      var ans = "<table class=\" table table-bordered table-hover table-responsive \"  >";
                      ans += "<thead style=\" font-weight: bold \" class=\" bg-light \" >";
                      ans += "<tr>";
                      ans += "<td>Photo</td><td>Username</td><td>Name</td><td>Email</td><td>Password</td><td>Phone No.</td><td>Gender</td><td>Primary Language</td><td></td>";
                      ans += "</tr>";
                      ans += "</thead>";
                      ans += "<tbody>";
                      for(var i=0; i<arr.length; i++)
                      {
                          ans += "<tr>";
                          ans += "<td><img src=\"" + arr[i]["photo"] + "\" style=\" width: 50px; height: 50px \" /></td>";
                          username = arr[i]["username"];
                          ans += "<td>" + username + "</td>";
                          ans += "<td>" + arr[i]["name"] + "</td>";
                          ans += "<td>" + arr[i]["email"] + "</td>";
                          ans += "<td>" + arr[i]["password"] + "</td>";
                          ans += "<td>" + arr[i]["phoneno"] + "</td>";
                          ans += "<td>" + arr[i]["gender"] + "</td>";
                          ans += "<td>" + arr[i]["primarylanguage"] + "</td>";
                          ans += "<td><input type=\"button\" value=\"Block\" class=\" btn btn-warning \" onclick=\"blockuserlogic('" + username + "')\" /></td>";
                          ans += "</tr>";
                      }
                      ans += "</tbody>";
                      ans += "</table><br><br><br><br>";
                      document.getElementById("activeusers").innerHTML = ans;
                      fetchblockedusers();
                  }
                };
                var url = "./activeusersresponse";
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function blockuserlogic(username)
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
                          location.href = "adminhome.jsp";
                      }
                      else
                      {
                          alert("Some Error Occurred");
                      }
                  }
                };
                var url = "./blockuserresponse?username=" + username;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function fetchblockedusers()
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];
                        var username = "";
                        var ans = "<table class=\" table table-bordered table-hover table-responsive \" >";
                        ans += "<thead style=\" font-weight: bold \" class=\" bg-light \" >";
                        ans += "<tr>";
                        ans += "<td>Photo</td><td>Username</td><td>Name</td><td>Email</td><td>Password</td><td>Phone No.</td><td>Gender</td><td>Primary Language</td><td></td>";
                        ans += "</tr>";
                        ans += "</thead>";
                        ans += "<tbody>";
                        for(var i = 0; i < arr.length; i++)
                        {
                            ans += "<tr>";
                            ans += "<td><img src=\"" + arr[i]["photo"] + "\" style=\" width: 50px; height: 50px \" /></td>";
                            username = arr[i]["username"];
                            ans += "<td>" + username + "</td>";
                            ans += "<td>" + arr[i]["name"] +"</td>";
                            ans += "<td>" + arr[i]["email"] + "</td>";
                            ans += "<td>" + arr[i]["password"] + "</td>";
                            ans += "<td>" + arr[i]["phoneno"] + "</td>";
                            ans += "<td>" + arr[i]["gender"] + "</td>";
                            ans += "<td>" + arr[i]["primarylanguage"] + "</td>";
                            ans += "<td><input type=\"button\" value=\"Activate\" class=\" btn btn-success \" onclick=\"activateuserlogic('" + username + "')\" /></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("blockedusers").innerHTML = ans;
                    }
                };
                var url = "./blockedusersresponse";
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function activateuserlogic(username)
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
                         location.href = "adminhome.jsp";
                     }
                     else
                     {
                         alert("Some Error Occurred");
                     }
                  }
                };
                var url = "./activateuserresponse?username=" + username;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
        </script>
    </head>
    <body onload="fetchactiveusers()">
        <div class="container">
            <br>
            <h1 class="text-center">Manage Users</h1> 
            <br>
                <h2>&nbsp;&nbsp;&nbsp;All Users</h2>
                <div id="activeusers" class="col-md-12">
                    
                </div>
                
                <h2>&nbsp;&nbsp;&nbsp;Blocked Users</h2>
                <div id="blockedusers" class="col-md-12">
                    
                </div>
        </div>
        <br><br><br><br>
     
        <div class="container text-right">
            <a href="adminchangepassword.jsp">Change Password</a>
            <br><br>
            <a  href="adminlogout">Logout</a>
        </div>
        <br><br><br><br>
        
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
