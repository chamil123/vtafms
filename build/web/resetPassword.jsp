<%-- 
    Document   : login
    Created on : Jun 25, 2016, 2:41:17 PM
    Author     : Chamil
--%>
<%@page import="java.util.Properties" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/social_button.css">


        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <script src="dist/js/jquery-ui.js" type="text/javascript"></script>
        <script src="dist/js/resetPasswordValidate.js" type="text/javascript"></script>
        <link rel="stylesheet" href="dist/css/VikumTA.min.css">
        <style>
            body{
                background-image: url(uploads/advance_mac_wallpaper___right__1920x1080_hd_by_chalxsion-d5kwxjx.jpg);
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

                    <form id="myForm" method="POST" name="ResetPassword" action="ResetPassword">  

                        <div   class="login-card" style="margin-top: 80px;width: 340px;padding: 20px 20px 20px 20px;background-color: rgba(255, 255, 255, 0.1);">
                            <p >
                                <img style="width:200px" src="uploads/Lock.png">
                            </p>

                            <%
                                String message = request.getParameter("msg");
                                if (message != null) {
                            %>
                            <div id="respons" class="alert alert-danger  response-message"   role="alert" style="padding: 3px 3px 3px 3px;"> <%=message%></div>
                            <%
                                }
                            %>


                            <div  style="margin-left:  -145px;margin-top: -20px;margin-bottom: 20px;color: #666666">
                                <h3 >Reset password</h3>
                            </div>


                            <div id="response" class="alert alert-danger response-content " hidden  role="alert" style="padding: 3px 3px 3px 3px;"> </div>
                            <p style="text-align: left">Select your new password and enter it bellow</p>
                            <div class="form-group has-feedback has-feedback-right" >           
                                <i class="form-control-feedback glyphicon glyphicon-lock" style="color: #cccccc;margin-top: -25px"></i>
                                <input  id="user_id" name="user_id" type="hidden" value="<%=request.getParameter("user_id")%>" class="form-control" >
                                <input  id="uname" name="uname" type="hidden" value="<%=request.getParameter("username")%>" class="form-control" >
                                <input id="pword" name="pword" type="password" class="form-control" placeholder="password" style="border-radius: 0px" >

                            </div>
                            <div class="form-group has-feedback has-feedback-right" >           
                                <i class="form-control-feedback glyphicon glyphicon-lock" style="color: #cccccc;margin-top: -25px"></i>
                                <input id="cpword"  name="cpword" type="password" class="form-control" placeholder="confirm password" style="border-radius: 0px" >

                            </div>

                            <div class="form-group" >
                                <input class="btn btn-chamil btn-block" type="submit" name="send" value="Reset" style="border-radius: 0px">


                            </div>

                            <div  style="float: left;margin-top: 0px;">
                                <a style="color: #ffffff "href="#" >back to login</a>
                            </div>
                        </div>

                    </form>

                </center>  
            </div>

        </div>


    </body>
</html>
