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
        
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        
        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Courses</h1>
            <br>
            <div>
                <img src="images/java2.png" alt="" style="float: right"/>
                <p>Courses provided by VMM are:</p>
                
                <dl>
                    <dt>Java</dt>
                    <dd>The Programmers Cafe</dd>
                    <dt>Android</dt>
                    <dd>Infidelity Spy for Android</dd>
                    <dt>Cloud Computing</dt>
                    <dd>Cloud Computing Tag Line</dd>
                    <dt>Angular</dt>
                    <dd>Angular tag line</dd>
                    <dt>PHP</dt>
                    <dd>Simplicity is prerequisite for reliability</dd>
                    <dt>.Net</dt>
                    <dd>Let's make things better</dd>
                    <dt>Python</dt>
                    <dd>Let's code</dd>
                    <dt>C/C++</dt>
                    <dd>The more I C, the less I see</dd>
                </dl>
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
