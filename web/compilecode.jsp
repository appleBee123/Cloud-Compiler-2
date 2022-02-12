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
            function compile_code_step1()
            {
                document.getElementById("runbutton").disabled = true;
                document.getElementById("outputcompile").value = "";
                document.getElementById("savebutton").disabled = true;
                var codetext = document.getElementById("codetext").value;
                var message = document.getElementById("errormessage");
                message.innerHTML = "";
                document.getElementById("savemessage").innerHTML = "";
                if (codetext == "")
                {
                    message.innerHTML = "Please Enter Some Code";
                } else
                {
                    var language = document.getElementById("language").value;
                    if (language == "java")
                    {
                        if (!codetext.includes("class"))
                        {
                            message.innerHTML = "Please Enter Valid Java Code";
                        } else
                        {
                            var xhttp = new XMLHttpRequest();
                            xhttp.onreadystatechange = function ()
                            {
                                if (this.readyState == 4 && this.status == 200)
                                {
                                    var res = this.responseText;
                                    res = res.trim();
                                    if (res == "success")
                                    {
                                        compile_code_step2(language);
                                    } else
                                    {
                                        message.innerHTML = "Some Error Occured. Try Again";
                                    }
                                }
                            };
                            xhttp.open("POST", "./compile_code_step1_response", true);
                            var formdata = new FormData();
                            formdata.append("language", language);
                            formdata.append("codetext", codetext);
                            xhttp.send(formdata);
                        }
                    } else if (language == "c" || language == "cpp")
                    {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function ()
                        {
                            if (this.readyState == 4 && this.status == 200)
                            {
                                var res = this.responseText;
                                res = res.trim();
                                if (res == "success")
                                {
                                    compile_code_step2(language);

                                } else
                                {
                                    message.innerHTML = "Some Error Occured. Try Again";
                                }
                            }
                        };
                        xhttp.open("POST", "./compile_code_step1_response", true);
                        var formdata = new FormData();
                        formdata.append("language", language);
                        formdata.append("codetext", codetext);
                        xhttp.send(formdata);

                    } 
                    else if (language == "python")
                    {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function ()
                        {
                            if (this.readyState == 4 && this.status == 200)
                            {
                                var res = this.responseText;
                                res = res.trim();
                                if (res == "success")
                                {
                                    document.getElementById("runbutton").disabled = false;
                                    document.getElementById("outputcompile").value = "File Saved Successfully";
                                    document.getElementById("savebutton").disabled = false;
                                } else
                                {
                                    message.innerHTML = "Some Error Occured. Try Again";
                                }
                            }
                        };
                        xhttp.open("POST", "./compile_code_step1_response", true);
                        var formdata = new FormData();
                        formdata.append("language", language);
                        formdata.append("codetext", codetext);
                        xhttp.send(formdata);
                    }
                }
            }
            function compile_code_step2(language)
            {
                if (language == "java")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            if (res == "File Saved and Compiled Successfully")
                            {
                                document.getElementById("runbutton").disabled = false;
                                document.getElementById("savebutton").disabled = false;
                            }
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./compile_code_step_2?language=" + language;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                } 
                else if (language == "c")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            if (res == "File Saved and Compiled Successfully")
                            {
                                document.getElementById("runbutton").disabled = false;
                                document.getElementById("savebutton").disabled = false;
                            }
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./c_compile_code_step_2?language=" + language;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                } 
                else if (language == "cpp")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            if (res == "File Saved and Compiled Successfully")
                            {
                                document.getElementById("runbutton").disabled = false;
                                document.getElementById("savebutton").disabled = false;
                            }
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./cpp_compile_code_step_2?language=" + language;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                }
            }
            function runlogic()
            {
                var language = document.getElementById("language").value;
                var userinput = document.getElementById("userinput").value;
                document.getElementById("savemessage").innerHTML = "";
                if (language == "java")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./runjavaresponse?language=" + language + "&userinput=" + userinput;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                } 
                else if (language == "c" || language == "cpp")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {

                            var res = this.responseText;
                            res = res.trim();
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./runcppresponse?language=" + language + "&userinput=" + userinput;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                } 
                else if (language == "python")
                {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {

                            var res = this.responseText;
                            res = res.trim();
                            document.getElementById("outputcompile").value = res;
                        }
                    };
                    var url = "./runpythonresponse?language=" + language + "&userinput=" + userinput;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                }
            }
            function savelogic()
            {
                var title = document.getElementById("title").value;
                document.getElementById("savemessage").innerHTML = "";
                if (title == "")
                {
                    alert("Please Write Some Title for the File");
                } 
                else
                {
                    var language = document.getElementById("language").value;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            if (res == "success")
                            {
                                $('#savemodal').modal('hide');
                                
                                $('body').removeClass('modal-open');
                                $('.modal-backdrop').remove();

                                document.getElementById("savemessage").innerHTML = "Saved Successfully";
                            } 
                            else if (res == "notinsession")
                            {
                                $('#savemodal').modal('hide');
                                
                                $('body').removeClass('modal-open');
                                $('.modal-backdrop').remove();
                                
                                document.getElementById("savemessage").className = "text-danger";
                                document.getElementById("savemessage").innerHTML = "You are Not Logged In";
                            } 
                            else
                            {
                                $('#savemodal').modal('hide');
                                
                                $('body').removeClass('modal-open');
                                $('.modal-backdrop').remove();
                                
                                document.getElementById("savemessage").className = "text-danger";
                                document.getElementById("savemessage").innerHTML = "Some Error Occured";
                            }
                        }
                    };
                    var url = "./savecoderesponse?language=" + language + "&title=" + title;
                    xhttp.open("GET", url, true);
                    xhttp.send();
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>


        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Compile Code</h1>
            <label for="language"  style="margin-top: 30px; font-size: 17px; font-weight: bold">Select Language</label> 
            <select id="language" class="ml-3" style="width: 150px;">
                <option selected value="java" >Java</option>
                <option value="c" >C</option>
                <option value="cpp" >C++</option>
                <option value="python" >Python</option>
            </select> 
            <br>
            <textarea id="codetext" style="margin-top: 20px; width: 900px; height: 300px;" placeholder="Write Code Here..."></textarea>
            <br>
            <h6 id="errormessage" style="color: red"></h6>
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <input type="button" value="Compile" class="btn btn-warning btn-lg" style="margin-top: 30px" onclick="compile_code_step1()" />
                    </div>
                    <div class="col-md-2">
                        <input type="button" value="Run" class="btn btn-success btn-lg" style="margin-top: 30px; margin-left: 45px" id="runbutton" disabled onclick="runlogic()" />
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-info btn-lg" style="margin-top: 30px; margin-left: 45px" id="savebutton" data-toggle="modal" data-target="#savemodal" disabled  >Save</button>
                    </div>
                    <div class="col-md-2">
                        <label id="savemessage" class="text-info" style="font-weight: bolder; margin-top: 30px"></label>
                    </div>
                </div>
            </div>

            <textarea style="margin-top: 50px; width: 900px" id="userinput" placeholder="Enter Command Line Arguments (separated with commas) ..."></textarea>
            <label style="margin-top: 40px; font-weight: bolder">Output:</label>
            <textarea id="outputcompile" class="text-white" style="background: black; width: 900px; height: 300px;"></textarea>
        </div>






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
                                <button type="button" class="btn btn-primary" onclick="userloginlogic()">LOGIN</button>
                            </div>
                        </form>
                        <h3 id="message2"></h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Save Modal -->
        <div class="modal fade" id="savemodal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content rounded-0 border-0 p-4">
                    <div class="modal-header border-0">

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="title" class="form-control" placeholder="Enter Title" />
                    </div>
                    <div class=" modal-footer">
                        <button type="button" class="btn btn-success" style="width: 100px" onclick="savelogic()" >Save</button>
                    </div>
                </div>
            </div>
        </div>


        <div id="savemodal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="title" class="form-control" placeholder="Enter Title" />

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" style="width: 100px" onclick="savelogic()" >Save</button>

                    </div>
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
