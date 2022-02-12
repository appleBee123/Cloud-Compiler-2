
    <script>
            function usersignuplogic()
            {
                var username = document.getElementById("username").value;
                var name = document.getElementById("name").value;
                var password = document.getElementById("password").value;
                var confirmpassword = document.getElementById("confirmpassword").value;
                var email = document.getElementById("email").value;
                var phoneno = document.getElementById("phoneno").value;
                var gender = document.getElementById("gender").value;
                var primarylanguage = document.getElementById("primarylanguage").value;
                var photo = document.getElementById("photo").files[0];
                var photodemo = document.getElementById("photo");
                var message = document.getElementById("message1");
                message.innerHTML = "";
                var ch;
                var aposition = -1;
                var dotposition = -1;
                for (var i = 0; i < email.length; i++)
                {
                    ch = email.charAt(i);
                    if (ch == '@')
                    {
                        aposition = i;
                        break;
                    }
                }
                for(var i = 0; i < email.length; i++)
                {
                    ch = email.charAt(i);
                    if(ch == '.')
                    {
                        dotposition = i;
                        break;
                    }
                }
                if (username == "" || name == "" || password == "" || email == "" || phoneno == "" || photodemo.files.length == 0)
                {
                    message.innerHTML = "All Fields are Mandatory";
                    message.style.color = "red";
                }
                else if (password != confirmpassword)
                {
                    message.innerHTML = "Password and Confirm Password must be the Same";
                    message.style.color = "red";
                } 
                else if (aposition == -1 || dotposition == -1 || aposition > dotposition || email.includes(".com") == false)
                {
                    message.innerHTML = "Enter valid email id";
                    message.style.color = "red";
                }
                else if(isNaN(phoneno) || phoneno.length != 10)
                {
                    message.innerHTML = "Enter Valid Phone Number";
                    message.style.color = "red";
                }
                else if(gender == "--Choose Gender--")
                {
                    message.innerHTML = "Please Choose a Gender";
                    message.style.color = "red";
                }
                else if(primarylanguage == "--Choose Primary Language--")
                {
                    message.innerHTML = "Please Choose a Primary Language";
                    message.style.color = "red";
                }
                else
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function()
                    {
                      if(this.readyState == 4 && this.status == 200)
                      {
                          res = this.responseText.trim();
                          if(res=="success")
                          {
                              message.innerHTML = "Signup Successfull. You can Login Now.";
                              message.style.color = "green";
                              document.getElementById("username").value = "";
                              document.getElementById("name").value = "";
                              document.getElementById("password").value = "";
                              document.getElementById("confirmpassword").value = "";
                              document.getElementById("email").value = "";
                              document.getElementById("phoneno").value = "";
                              document.getElementById("gender").value = "";
                              document.getElementById("primarylanguage").value = "";
                              setTimeout(gotouserlogin,2000);
                          }
                          else if(res=="fail")
                          {
                              message.innerHTML = "Username Already Exists";
                              message.style.color = "red";
                          }
                      }
                    };
                    xhttp.open("POST","./usersignupresponse",true);
                    var formdata = new FormData();
                    formdata.append("username",username);
                    formdata.append("name",name);
                    formdata.append("password",password);
                    formdata.append("email",email);
                    formdata.append("phoneno",phoneno);
                    formdata.append("gender",gender);
                    formdata.append("primarylanguage",primarylanguage);
                    formdata.append("photo",photo);
                    xhttp.send(formdata);
                }
            }
            function gotouserlogin()
            {
                $("#signupModal").modal("hide");
                $("#loginModal").modal("show");
            }
            function userloginlogic()
            {
                var username = document.getElementById("lusername").value;
                var password = document.getElementById("lpassword").value;
                var message = document.getElementById("message2");
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
                        var res = this.responseText.trim();
                        if(res == "success")
                        {
                            message.innerHTML = "Login Successfull";
                            message.style.color = "green";
                            setTimeout(gotoindex,1000);
                        }
                        else if(res == "notactive")
                        {
                            message.innerHTML = "Please Contact Admin. Your Account is Blocked";
                            message.style.color = "red";
                        }
                        else
                        {
                            message.innerHTML = "Invalid Username/Password";
                            message.style.color = "red";
                        }
                      }
                    };
                    var url = "./userloginresponse?username=" + username + "&password=" + password;
                    xhttp.open("GET", url ,true);
                    xhttp.send();
                }
            }
            function gotoindex()
            {
                location.href = "index.jsp";
            }
            function searchlogic()
            {
                var keyword = document.getElementById("searchkeyword").value;
                if(keyword == "")
                {
                    document.getElementById("searchresults").innerHTML = "";
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
                          var jsonobj = JSON.parse(res);
                          var jsonarr = jsonobj["ans"];
                          var content = "";
                          for(var i = 0; i < jsonarr.length; i++)
                          {
                              var obj = jsonarr[i];
                             
                              content += "<p class=\" searchitem \"  onclick=\" gotoprofile('" + obj.username + "') \" >" + obj.name + "</p>";
                          }
                          document.getElementById("searchresults").innerHTML = content;
                      }
                    };
                    var url = "./searchresponse?keyword="+keyword;
                    xhttp.open("GET",url,true);
                
                    xhttp.send();
                }
                
            }
            function gotoprofile(username)
            {
                location.href = "userprofile.jsp?username=" + username;
            }
       
</script>
<!-- header -->
<header class="fixed-top header">
  <!-- top header -->
  <div class="top-header py-2 bg-white">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-4 text-center text-lg-left">
          <a class="text-color mr-3" ><strong>CALL&nbsp;</strong> 6239512009</a>
          <ul class="list-inline d-inline">
              <li class="list-inline-item mx-0"><a class="d-inline-block p-2 text-color" href="https://www.linkedin.com/feed/"><i class="ti-linkedin"></i></a></li>
          </ul>
        </div>
          <div class="col-lg-3 text-center py-2  ">
              <a href="compilecode.jsp" >Compile Code</a>
          </div>
        <div class="col-lg-5 text-center">
          <ul class="list-inline">
              <!--
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="notice.html">notice</a></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="research.html">research</a></li>
            <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="scholarship.html">SCHOLARSHIP</a></li>
              -->
              <div id="searchbarsection" class="list-inline-item" style="position: static">
                  <input type="text" placeholder="Search Users" id="searchkeyword" onkeyup="searchlogic()"/>
                  <div id="searchresults" style="position: absolute; z-index: 200; background: #ffffff; width: 160px;"></div>
              </div>
               
                                <%  
                                   if(session.getAttribute("username") == null)
                                   {
                                %>
                                     <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#" data-toggle="modal" data-target="#loginModal">login</a></li>
                                     <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#" data-toggle="modal" data-target="#signupModal">register</a></li>
                                <% 
                                   }
                                   else
                                   {
                                     String username = session.getAttribute("username").toString();
                                %>
                                     <li class="nav-item dropdown view list-inline-item">
                                    <a class="nav-link dropdown-toggle text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        Hi <%= username %>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item mylist" href="changepassword.jsp">Change Password</a>
                                        <a class="dropdown-item mylist" href="viewfriends.jsp">Friends</a>
                                        <a class="dropdown-item mylist" href="viewfriendrequests.jsp">View Friend Requests</a>
                                        <a class="dropdown-item mylist" href="viewsentrequests.jsp">View Sent Requests</a>
                                        <a class="dropdown-item mylist" href="usersavedcodes.jsp">View Saved Codes</a>
                                        <a class="dropdown-item mylist" href="viewsharedcodes.jsp">View Wall</a>
                                        <a class="dropdown-item mylist" href="userlogout">Logout</a>
                                        
                                    </div>
                                </li>
                                     
                                     
                                <%
                                    }
                                %>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- navbar -->
            <div class="navigation w-100">
                <div class="container">
                    <nav class="navbar navbar-expand-lg navbar-dark p-0">
                        <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="logo"></a>
                        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation"
                                aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navigation">
                            <ul class="navbar-nav ml-auto text-center">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item @@about">
                                    <a class="nav-link" href="about.jsp">About</a>
                                </li>
                                <li class="nav-item @@courses">
                                    <a class="nav-link" href="courses.jsp">COURSES</a>
                                </li>
                                <li class="nav-item @@events">
                                    <a class="nav-link" href="compiler.jsp">Compiler</a>
                                </li>
                                <li class="nav-item @@blog">
                                    <a class="nav-link" href="vmm.jsp">VMM</a>
                                </li>
                                <li class="nav-item @@blog">
                                    <a class="nav-link" ></a>
                                </li>
                                <li class="nav-item @@contact">
                                    <a class="nav-link" ></a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!-- /header -->
        
         <!-- Modal -->
        <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content rounded-0 border-0 p-4">
                    <div class="modal-header border-0">
                        <h3>Register</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="login">
                            <form action="#" class="row">
                                <div class="col-12">
                                    <input type="text" class="form-control mb-3" id="username"  placeholder="Enter Username">
                                </div>
                                <div class="col-12">
                                    <input type="text" class="form-control mb-3" id="name"  placeholder="Enter Name">
                                </div>
                                <div class="col-12">
                                    <input type="password" class="form-control mb-3" id="password"  placeholder="Enter Password">
                                </div>
                                <div class="col-12">
                                    <input type="password" class="form-control mb-3" id="confirmpassword"  placeholder="Re-Enter Password">
                                </div>
                                <div class="col-12">
                                    <input type="email" class="form-control mb-3" id="email"  placeholder="Enter Email">
                                </div>
                                <div class="col-12">
                                    <input type="text" class="form-control mb-3" id="phoneno"  placeholder="Enter Phone Number">
                                </div>
                                <div class="col-12">
                                    <select id="gender"  class="form-control mb-3">
                                        <option>--Choose Gender--</option>
                                        <option>Female</option>
                                        <option>Male</option>
                                        <option>Non Binary</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <select id="primarylanguage"  class="form-control mb-3">
                                        <option>--Choose Primary Language--</option>
                                        <option>Java</option>
                                        <option>C</option>
                                        <option>C++</option>
                                        <option>Python</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="photo"><strong>Photo</strong></label><br>
                                    <input type="file" class="mb-3" id="photo" >
                                </div>
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary" onclick="usersignuplogic()">SIGN UP</button>
                                </div>
                            </form>
                            <h3 id="message1"></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
        <!-- Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content rounded-0 border-0 p-4">
                    <div class="modal-header border-0">
                        <h3>Login</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" class="row">
                            
                            <div class="col-12">
                                <input type="text" class="form-control mb-3" id="lusername"  placeholder="Enter Username">
                            </div>
                            <div class="col-12">
                                <input type="password" class="form-control mb-3" id="lpassword"  placeholder="Enter Password">
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" style="width: 100px" onclick="userloginlogic()">LOGIN</button>
                            </div>
                        </form>
                        <h3 id="message2"></h3>
                        <div class="col-12 text-center">
                            <a href="forgotpassword.jsp">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>