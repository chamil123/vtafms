<%-- 
    Document   : login
    Created on : Jun 25, 2016, 2:41:17 PM
    Author     : Chamil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/social_button.css">


        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <script src="dist/js/loginValidate.js" type="text/javascript"></script>
        <script src="dist/js/jquery-ui.js" type="text/javascript"></script>

        <link rel="stylesheet" href="dist/css/VikumTA.min.css">
        <style>
            body{
                background-image: url(uploads/bacllogin6.jpg);
                background-size: cover;
                overflow: hidden;
            }

            .login-logo p{
                color:#666666;
                font-size: 35px;
                padding-top: 40px;
                padding-bottom: 10px;
                font-family: "Raleway Light", Georgia, Serif;
            }.login-card {
                padding: 40px;
                width: 374px;
                background-color: #ffffff;
                /*#F7F7F7;*/
                margin: 0 auto 10px;
                border-radius: 2px;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                overflow: hidden;
            }



        </style>

    </head>
    <body>



        <div class="container-fluid">

            <div class="row">
                <center>
                    <div class="login-logo">
                        <!--    <p class="login-logo"><b>VTAFMS  </b>  Login</p>-->
                    </div>

                    <form id="loginshake" method="post" name="login" action="LoginCheck">  

                        <div   class="login-card" style="margin-top: 50px;width: 340px;padding: 20px 20px 20px 20px;background-color: rgba(255, 255, 255, 0.6);">
                            <p >
                                <img style="width:230px" src="dist/img/vikumlogo2.png">
                            </p>

                            <%
                                String message = request.getParameter("msg");
                                if (message != null) {
                            %>
                            <div id="respons" class="alert alert-danger  response-message"   role="alert" style="padding: 3px 3px 3px 3px;"> <%=message%></div>
                            <%
                                }
                            %>
                            <div id="response" class="alert alert-danger response-content " hidden  role="alert" style="padding: 3px 3px 3px 3px;"> </div>
                            <div class="form-group has-feedback has-feedback-right" >           
                                <i class="form-control-feedback glyphicon glyphicon-user" style="color: #cccccc;margin-top: -25px"></i>
                                <input id="uname" name="uname" type="text" class="form-control" placeholder="username" style="border-radius: 0px" >

                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input id="pword" name="pword" type="password" class="form-control" placeholder="password"  style="border-radius: 0px">
                                <i class="form-control-feedback glyphicon glyphicon-lock" style="color: #cccccc;margin-top: -25px"></i>
                            </div>
                            <div class="form-group" >


                                <button type="submit" class="btn btn-chamil btn-block" style="border-radius: 0px">submit</button>
                            </div>
                            <div  class=" checkbox" style="float: left;margin-top: 0px; color: #cccccc">
                                <label><input  type="hidden" value=""></label>
                            </div>
                            <div  style="float: right;margin-top: 0px;">
                                <a style="color: #666666 "href="lostPassword.jsp" >fogot password</a>
                            </div>

                            <div  style="margin-top: 40px;">
                                <a class="btn btn-facebook btn-block " href="https://www.facebook.com/"><i class="fa fa-facebook"></i> | Connect with Facebook</a>

                                <a class="btn btn-twitter btn-block " href="https://twitter.com/login"><i class="fa fa-facebook"></i> | Connect with Twiter</a>
                                <a style="float: left;margin-top: 10px" href="#" data-toggle="modal" data-target="#myModal">Dont have and Account? Sign Up!</a>
                            </div>
                        </div>

                    </form>
                </center>  
            </div>

        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class=" modal-dialog " style="width:350px">

                <!-- Modal content-->
                <form method="POST"  class="form-horizontal" role="form" action="AddUser">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><img src="images/User-icon.png">User registration</h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 15px 0px 15px">

                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="text" class="form-control" placeholder="first name" style="border-radius: 0px" name="fname" id="fname">
                                <i class="form-control-feedback glyphicon glyphicon-folder-open" style="color: #cccccc"></i>
                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="text" style="border-radius: 0px;" class="form-control" placeholder="last name" name="lname" id="lname"/>  
                                <i class="form-control-feedback glyphicon glyphicon-folder-close" style="color: #cccccc"></i>
                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="text" style="border-radius: 0px;" class="form-control" placeholder=" username" name="userName" id="userName"/>  
                                <i class="form-control-feedback glyphicon glyphicon-user" style="color: #cccccc"></i>
                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="password"style="border-radius: 0px;" class="form-control" placeholder="password" name="password" id="password"/>
                                <i class="form-control-feedback glyphicon glyphicon-lock" style="color: #cccccc"></i>
                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="cpassword" style="border-radius: 0px;" class="form-control" placeholder="confirm password" name="cpassword" id="cpassword"/>
                                <i class="form-control-feedback glyphicon glyphicon-thumbs-up" style="color: #cccccc"></i>
                            </div>
                            <div class="form-group has-feedback has-feedback-right" >                                           
                                <input type="email" style="border-radius: 0px" class="form-control" placeholder="email  " name="email" id="email"/>  
                                <i class="form-control-feedback glyphicon glyphicon-globe" style="color: #cccccc"></i>
                            </div>

                            <div id="loginErrorMsg" class="alert alert-error hide">Wrong username or password</div>

                        </div>
                        <div class="modal-footer">


                            <input type="submit" style="border-radius: 0px" class="btn btn-primary" value="Submit" name="Add"/>
                            <button type="button" style="border-radius: 0px" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
