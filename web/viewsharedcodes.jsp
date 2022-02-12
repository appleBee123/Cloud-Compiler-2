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
            function likelogic(shid)
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText;
                        res = res.trim();
                        
                        location.href = "viewsharedcodes.jsp";
                    }
                };
                var url = "./likeresponse?sharedcodeid=" + shid;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function fetchcode()
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                  if(this.readyState == 4 && this.status == 200)
                  {
                      
                  }
                };
                var url = "./fetchcoderesponse?";
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function opendialog(shid)
            {
                document.getElementById("labelmodal").innerHTML = shid;
                //document.getElementById("labelmodal").style.display = "block";
            }
            function addcomment()
            {
                var shid = document.getElementById("labelmodal").innerHTML;
                var comment = document.getElementById("comment").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                  if(this.readyState == 4 && this.status == 200)
                  {
                     var res = this.responseText;
                     res = res.trim();
                     if(res == "success")
                     {
                         $('#commentmodal').modal('hide');
                         alert("Comment Added Successfully");
                         location.href = "viewsharedcodes.jsp";
                     }
                     else
                     {
                         alert("An Error Occurred");
                     }
                  }
                };
                var url = "./addcommentresponse?sharedcodeid=" + shid + "&comment=" + comment;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function viewcommentlogic(shid)
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
                          alert("Some Error Occured");
                      }
                      else
                      {
                          var mainobj = JSON.parse(res);
                      var arr = mainobj["ans"];
                      $('#viewcommentmodal').modal('show');
                      var ans = "";
                      for(var i=0; i<arr.length; i++)
                      {
                          ans += "<div style=\"border: 5px dotted #ffcccc; margin: 40px; padding: 15px\" >";
                          ans += "<div>" + arr[i]["comment"] + "</div><br>";
                          ans += "<div class=\"text-right\" ><em>Commented By:</em> " + arr[i]["commentedby"] + "</div>";
                          ans += "</div>";
                      }
                      document.getElementById("modalbody").innerHTML = ans;
                      }
                  }
                };
                var url = "./getcomments?sharedcodeid=" + shid;
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            
            var total=0;
            var index=1;
            function fetchnumberofsharedcodes()
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText;
                        res = res.trim();
                        if(res == 0)
                        {
                            
                        }
                        else
                        {
                            total=parseInt(res);
                            displaysharedcode();
                        }
                    }
                };
                var url = "./numberofsharedcodesresponse2";
                xhttp.open("GET",url,true);
                xhttp.send();
            }
            function displaysharedcode()
            {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function()
                    {
                        if(this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText;
                            res = res.trim();
                            document.getElementById("code"+index).innerHTML = res;
                            index++;
                            if(index<=total)
                            {
                                displaysharedcode();
                            }
                            else
                            {
                                fetchnumberoflikes();
                            }
                        }
                    };
                    var path = document.getElementById("path"+index).innerHTML;
                    xhttp.open("GET",path,true);
                    xhttp.send();
            }
            
            var likesindex = 1;
            function fetchnumberoflikes()
            {
               var xhttp = new XMLHttpRequest();
               xhttp.onreadystatechange = function()
               {
                 if(this.readyState == 4 && this.status == 200)
                 {
                     var res = this.responseText;
                     res = res.trim();
                     var numberoflikes = "";
                     res = parseInt(res);
                     if(res == 1)
                     {
                         numberoflikes = res + " like";
                     }
                     else
                     {
                         numberoflikes = res + " likes";
                     }
                     document.getElementById("likes"+likesindex).innerHTML = numberoflikes;
                     likesindex++;
                     if(likesindex<=total)
                     {
                         fetchnumberoflikes();
                     }
                 }
               };
               var scid = document.getElementById("scid"+likesindex).innerHTML;
               var url = "./numberoflikesresponse?scid=" + scid;
               xhttp.open("GET",url,true);
               xhttp.send();
            }
        </script>
    </head>
    <body onload="fetchnumberofsharedcodes()">
        
        <%@include file="header.jsp" %>
        
        <div class="container" style="margin-top: 200px">
            <h1 class="text-center">Codes that are Shared With You</h1>
        <%  
           String susername = session.getAttribute("username").toString();
           int i = 0;
           int pathcount = 0;
           ResultSet rs = DBLoader.executeSQl("select * from sharedcodes where sharedwith='" + susername + "'");
           while(rs.next())
           {
               pathcount++;
               int scid = rs.getInt("scid");
               int shid = rs.getInt("shid");
               String ownedby = rs.getString("ownedby");
               String datetime = rs.getString("datetime");
               ResultSet rs1 = DBLoader.executeSQl("select * from savedcodes where scid=" + scid);
               if(rs1.next())
               {
                   String title = rs1.getString("title");
                   String path = rs1.getString("filepath");
        %>
        
            <div style="border: 5px dotted #ffcccc; margin-left: 40px; margin-right: 40px; margin-top: 40px; padding: 15px">
                <div id="path<%= pathcount %>" style="display: none"><%= path %></div> 
                <label id="scid<%= pathcount %>" style="display: none"><%= scid %></label>
                <label><em>Title: </em><%= title %></label>
                <br>
                <hr>
                    <div id="code<%= pathcount %>">
                        
                    </div>
                <br><br><br><br><br><br>
                <div class="row">
                    
                    <div class="text-right col-md">
                        <label><em>Shared By:</em> <%= ownedby %></label> <br>
                        <label><em>DateTime:</em> <%= datetime %></label>
                     </div>
                </div>
                
            </div>
                        
                        <div style="margin-left: 45px; margin-top: 7px;">
                            <div class="row">
                                <div class="col-md-1">
                        <% 
                            ResultSet rs2 = DBLoader.executeSQl("select * from liketable where likedby='" + susername + "' and sharedcodeid=" + shid);
                            if(rs2.next())
                            {
                                i++;
                        %>
                               <input type="button" value="Liked" class="btn btn-primary btn-sm" id="buttonlike<%= i %>" onclick="likelogic(<%= shid %>)" />
                        <%
                            }
                            else
                            {
                                i++;
                        %>
                               <input type="button" value="Like" class="btn btn-info btn-sm" id="buttonlike<%= i %>" onclick="likelogic(<%= shid %>)" />
                        <%
                            }
                        %>
                    </div>
                        <label class="col-md-3" id="likes<%= pathcount %>" ></label>
                    <div class="offset-md-3 col-md-2">
                        <button type="button" class="btn btn-info btn-sm"  onclick="opendialog(<%= shid %>)" data-toggle="modal" data-target="#commentmodal" >Add Comment</button>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-info btn-sm" onclick="viewcommentlogic(<%=  shid %>)"  >View Comments</button>
                    </div>
                            </div>
                        </div>      
        
        <%
               }
               
           }
        %>
        
        </div>
        
        <!-- Comment Modal -->
        <div class="modal" id="commentmodal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <label style="display: none" id="labelmodal"></label>
                       
                        <h4 class="modal-title">Add Comment</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea id="comment" class="form-control" placeholder="Enter Comment..."></textarea>
                    </div>

                    <div class="text-center">
                        <input type="button" value="Add" class="btn btn-success" style="width: 100px" onclick="addcomment()" />
                    </div>
                    <br>       
                </div>
            </div>
        </div>
        
        <!-- View Comment Modal -->
        <div class="modal" id="viewcommentmodal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Comments</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="modalbody">
                        
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
