<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Educenter</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
      function adminloginlogic()
      {
          var username = document.getElementById("ausername").value;
          var password = document.getElementById("apassword").value;
          var message = document.getElementById("amessage");
          message.innerHTML = "";
          if(username == "" || password == "")
          {
              message.innerHTML = "All Fields are Mandatory";
              message.style.color = "red";
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
                        message.innerHTML = "Login Successfull";
                        message.style.color = "green";
                        setTimeout(gotoadminhome,1000);
                    }
                    else
                    {
                        message.innerHTML = "Invalid Username/Password";
                        message.style.color = "red";
                    }
                }
              };
              var url = "./adminloginresponse?username=" + username + "&password=" + password;
              xhttp.open("GET",url,true);
              xhttp.send();
          }
      }
            function gotoadminhome()
            {
                location.href = "adminhome.jsp";
            }
  </script>
    </head>

    <body>
         <!-- preloader start -->
  <div class="preloader">
    <img src="images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

        <%@include file="header.jsp" %>
       

        
        
        <!-- hero slider -->
<section class="hero-section overlay bg-cover" data-background="images/banner/banner-1.jpg">
  <div class="container">
    <div class="hero-slider">
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">Your bright future is our mission</h1>
            <br>
            <p class="text-muted mb-4" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">
                <strong>Compile and run your code on Cloud Compiler !</strong>
            </p>
            
          </div>
        </div>
      </div>
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutUp" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">Your bright future is our mission</h1>
            <br>
            <p class="text-muted mb-4" data-animation-out="fadeOutUp" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".4">
                <strong>Make friends along the way !</strong>
               </p>
            
          </div>
        </div>
      </div>
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutDown" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Your bright future is our mission</h1>
            <p class="text-muted mb-4" data-animation-out="fadeOutDown" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".4">
                <strong>Save your code and share it with friends !</strong>
            </p>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /hero slider -->


        <!-- banner-feature -->
<section class="bg-gray overflow-md-hidden">
  <div class="container-fluid p-0">
    <div class="row no-gutters">
      <div class="col-xl-4 col-lg-5 align-self-end">
        <img class="img-fluid w-100" src="images/banner/banner-feature.png" alt="banner-feature">
      </div>
      <div class="col-xl-8 col-lg-7">
        <div class="row feature-blocks bg-gray justify-content-between">
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-book mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4">Online Compiler</h3>
            <p>In the beginning of your programming journey, it might be overwhelming to download different softwares. Or your device may not have enough memory. So you came to the right place.</p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-blackboard mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4">Multiple Choices</h3>
            <p>We have compilers for Java, C, C++, and Python.</p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-agenda mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4">See the Output</h3>
            <p>After compilation, you may run your code and see the output. Any errors during compilation and/or runtime will be displayed so that you can make corrections.</p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-write mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4">Make Friends</h3>
            <p>Make friends while you're on this platform so that you can have friends who share your love of coding. </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /banner-feature -->

        <!-- about us -->
        <section class="section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 order-2 order-md-1">
                        <h2 class="section-title">About Cloud Compiler</h2>
                        <p>We have different compilers installed on our servers so that you can use them and get started with coding without having to worry about downloading this and that software.</p>
                        <p>You can make friends and share your code with them. Friends can like and comment on each other's codes.</p>
                        
                    </div>
                    <div class="col-md-6 order-1 order-md-2 mb-4 mb-md-0">
                        
                        <img class="img-fluid w-100" src="images/pexels-startup-stock-photos-7112.jpg" alt="about image"/>
                    </div>
                </div>
            </div>
        </section>
        <!-- /about us -->

        <!-- courses -->
        <section class="section-sm">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex align-items-center section-title justify-content-between">
                            <h2 class="mb-0 text-nowrap mr-3">Our Compilers</h2>
                            <div class="border-top w-100 border-primary d-none d-sm-block"></div>
                            
                        </div>
                    </div>
                </div>
                <!-- course list -->
                <div class="row justify-content-center">
                    <!-- course item -->
                    <div class="col-lg-4 col-sm-6 mb-5">
                        <div class="card p-0 border-primary rounded-0 hover-shadow">
                            
                            <div class="card-body">
                                
                                <a >
                                    <h4 class="card-title">Java</h4>
                                </a>
                                <p class="card-text mb-4">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.</p>
                                
                            </div>
                        </div>
                    </div>
                    <!-- course item -->
                    <div class="col-lg-4 col-sm-6 mb-5">
                        <div class="card p-0 border-primary rounded-0 hover-shadow">
                            
                            <div class="card-body">
                                
                                <a >
                                    <h4 class="card-title">C</h4>
                                </a>
                                <p class="card-text mb-4">C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system.</p>
                                
                            </div>
                        </div>
                    </div>
                    <!-- course item -->
                    <div class="col-lg-4 col-sm-6 mb-5">
                        <div class="card p-0 border-primary rounded-0 hover-shadow">
                            
                            <div class="card-body">
                                
                                <a >
                                    <h4 class="card-title">C++</h4>
                                </a>
                                <p class="card-text mb-4">C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or "C with Classes".</p>
                                
                            </div>
                        </div>
                    </div>
                    <!-- course item -->
                    <div class="col-lg-4 col-sm-6 mb-5">
                        <div class="card p-0 border-primary rounded-0 hover-shadow">
                            
                            <div class="card-body">
                                
                                <a>
                                    <h4 class="card-title">Python</h4>
                                </a>
                                <p class="card-text mb-4">Python is an interpreted high-level general-purpose programming language. Python's design philosophy emphasizes code readability with its notable use of significant indentation.</p>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- /course list -->
                <!-- mobile see all button -->
                <div class="row">
                    <div class="col-12 text-center">
                        <a href="courses.html" class="btn btn-sm btn-primary-outline d-sm-none d-inline-block">sell all</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- /courses -->
        

        <section class="section-sm">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex align-items-center section-title justify-content-between">
                            <h2 class="mb-0 text-nowrap mr-3">Admin</h2>
                            <div class="border-top w-100 border-primary d-none d-sm-block"></div>
                            
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#adminmodal">
                                        Admin Login
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
        <br><br><br><br>
        
         <!-- Modal -->
 <div class="modal fade" id="adminmodal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content rounded-0 border-0 p-4">
                    <div class="modal-header border-0">
                        <h3>Admin Login</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" class="row">
                            
                            <div class="col-12">
                                <input type="text" class="form-control mb-3" id="ausername"  placeholder="Enter Username">
                            </div>
                            <div class="col-12">
                                <input type="password" class="form-control mb-3" id="apassword"  placeholder="Enter Password">
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" style="width: 100px" onclick="adminloginlogic()">LOGIN</button>
                            </div>
                        </form>
                        <h3 id="amessage">
                            
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        
           
          
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