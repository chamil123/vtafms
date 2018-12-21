<%-- 
    Document   : login
    Created on : Jun 25, 2016, 2:41:17 PM
    Author     : Chamil
--%>
<%@page import="BIT.Project.VTAFMS.Model.User"%>
<%@page import="BIT.Project.VTAFMS.Controller.UserController"%>
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
        <script src="dist/js/loginValidate.js" type="text/javascript"></script>
        <script src="dist/js/jquery-ui.js" type="text/javascript"></script>

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
    <body onload="displayResult();">
        <%!
            public static class SMTPAuthenticator extends Authenticator {

                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("vikumturf2016@gmail.com", "vikumturfaccount");
                }
            }
        %>
        <% int result = 0;
            if (request.getParameter("send") != null) {

                User user;
                String emailAddress="";
                int user_id=0;

                String d_uname = "vikumturf2016@gmail.com";
                String d_password = "vikumturfaccount";
                String d_host = "smtp.gmail.com";
                int d_port = 465;

                String m_to = new String();
                String m_from = "vikumturf2016@gmail.com";
                String m_subject = new String();
                String m_text = new String();

                if (request.getParameter("to") != null) {
                    m_to = request.getParameter("to");
                    user = UserController.searchUserByName(m_to);
                    
                    emailAddress=user.getUser_email();
                     user_id=user.getUser_id();

                }
                if (request.getParameter("subject") != null) {
                    m_subject = request.getParameter("subject");
                }
                if (request.getParameter("message") != null) {
                    m_text = "<h2>Forgot your password</h2><br>"
                            + "We've recieved a request to reset the password for this email address<br><br>"
                            + "To reset your password please click on thhis link or cut and paste this URL into your browser (link expiew on 24 hours)<br>";
                    m_text = m_text.concat(request.getParameter("message")+""+request.getParameter("to")+"&user_id="+user_id);
                    m_text = m_text.concat("<br><br><br>This link takes you to a secure page where you can change your password<br><br>"
                            + "if you don't want to reset you password, please ignore this message.your password will not be reset<br><br>"
                            + "<h2>sent from vikum turf account</h2><br>");
                }
                //create property object
                Properties props = new Properties();

                //create an SMTPAuthenticator object
                SMTPAuthenticator auth = new SMTPAuthenticator();

                //create a mail session object
                Session ses = Session.getInstance(props, auth);

                //create a MINE style email message object
                MimeMessage msg = new MimeMessage(ses);
                msg.setContent(m_text, "text/html");
                msg.setSubject(m_subject);
                msg.setFrom(new InternetAddress(m_from));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress));
                try {
                    Transport transport = ses.getTransport("smtps");
                    transport.connect(d_host, d_port, d_uname, d_password);
                    transport.sendMessage(msg, msg.getAllRecipients());
                    transport.close();
                    result = 1;
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>


        <div class="container-fluid">

            <div class="row">
                <center>
                    <div class="login-logo">
                        <!--    <p class="login-logo"><b>VTAFMS  </b>  Login</p>-->
                    </div>

                    <form id="myForm" method="POST" name="myForm" action="lostPassword.jsp">  

                        <div   class="login-card" style="margin-top: 80px;width: 340px;padding: 20px 20px 20px 20px;background-color: rgba(255, 255, 255, 0.1);">
                            <p style="padding-bottom: 30px;padding-top: 20px">
                                <img style="width:150px" src="dist/img/question-256x256.png">
                            </p>

                            <%
                                String message = request.getParameter("msg");
                                if (message != null) {
                            %>
                            <div id="respons" class="alert alert-danger  response-message"   role="alert" style="padding: 3px 3px 3px 3px;"> <%=message%></div>
                            <%
                                }
                            %>


                            <div  style="margin-left:  -85px;margin-top: -20px;margin-bottom: 20px;color: #666666">
                                <h3 >Forgot your password</h3>
                            </div>


                            <div id="response" class="alert alert-danger response-content " hidden  role="alert" style="padding: 3px 3px 3px 3px;"> </div>
                            <p style="text-align: left">Don't worry !. just fill in your user name and we'll help you reset your password </p>
                            <div class="form-group has-feedback has-feedback-right" >           
                                <i class="form-control-feedback glyphicon glyphicon-user" style="color: #cccccc;margin-top: -25px"></i>
                                <input id="to" name="to" type="text" class="form-control"  placeholder="username" style="border-radius: 0px" >
                                <input type="hidden" name="subject" value="reset password" size="50"  >
                                <textarea hidden name="message" rows="4" cols="50">http://localhost:8080/VTAFMS/resetPassword.jsp?username=</textarea> 
                               <!--http://localhost:8080/VTAFMS/resetPassword.jsp?username=-->
                                <input type="hidden" name="hidden" value="<%=result%>" >
                            </div>

                            <div class="form-group" >
                                <input class="btn btn-danger btn-block" type="submit" name="send" value="send email" style="border-radius: 0px">


                            </div>

                            <div  style="float: left;margin-top: 0px;">
                                <a style="color: #ffffff "href="#" >back to login</a>
                            </div>
                        </div>

                    </form>
                    <script language="Javascript">
                        function displayResult() {
                            if (document.myForm.hidden.value === "1") {
                                alert("mail was sent !");
                            }
                        }
                    </script>
                </center>  
            </div>

        </div>


    </body>
</html>
