package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/css/social_button.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"dist/js/jquery-1.8.3.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/loginValidate.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/jquery-ui.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"dist/css/VikumTA.min.css\">\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background-image: url(uploads/bacllogin6.jpg);\n");
      out.write("                background-size: cover;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-logo p{\n");
      out.write("                color:#666666;\n");
      out.write("                font-size: 35px;\n");
      out.write("                padding-top: 40px;\n");
      out.write("                padding-bottom: 10px;\n");
      out.write("                font-family: \"Raleway Light\", Georgia, Serif;\n");
      out.write("            }.login-card {\n");
      out.write("                padding: 40px;\n");
      out.write("                width: 374px;\n");
      out.write("                background-color: #ffffff;\n");
      out.write("                /*#F7F7F7;*/\n");
      out.write("                margin: 0 auto 10px;\n");
      out.write("                border-radius: 2px;\n");
      out.write("                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <center>\n");
      out.write("                    <div class=\"login-logo\">\n");
      out.write("                        <!--    <p class=\"login-logo\"><b>VTAFMS  </b>  Login</p>-->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <form id=\"loginshake\" method=\"post\" name=\"login\" action=\"LoginCheck\">  \n");
      out.write("\n");
      out.write("                        <div   class=\"login-card\" style=\"margin-top: 50px;width: 340px;padding: 20px 20px 20px 20px;background-color: rgba(255, 255, 255, 0.6);\">\n");
      out.write("                            <p >\n");
      out.write("                                <img style=\"width:230px\" src=\"dist/img/vikumlogo2.png\">\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                            ");

                                String message = request.getParameter("msg");
                                if (message != null) {
                            
      out.write("\n");
      out.write("                            <div id=\"respons\" class=\"alert alert-danger  response-message\"   role=\"alert\" style=\"padding: 3px 3px 3px 3px;\"> ");
      out.print(message);
      out.write("</div>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                            <div id=\"response\" class=\"alert alert-danger response-content \" hidden  role=\"alert\" style=\"padding: 3px 3px 3px 3px;\"> </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >           \n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-user\" style=\"color: #cccccc;margin-top: -25px\"></i>\n");
      out.write("                                <input id=\"uname\" name=\"uname\" type=\"text\" class=\"form-control\" placeholder=\"username\" style=\"border-radius: 0px\" >\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input id=\"pword\" name=\"pword\" type=\"password\" class=\"form-control\" placeholder=\"password\"  style=\"border-radius: 0px\">\n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-lock\" style=\"color: #cccccc;margin-top: -25px\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-chamil btn-block\" style=\"border-radius: 0px\">submit</button>\n");
      out.write("                            </div>\n");
      out.write("                            <div  class=\" checkbox\" style=\"float: left;margin-top: 0px; color: #cccccc\">\n");
      out.write("                                <label><input  type=\"hidden\" value=\"\"></label>\n");
      out.write("                            </div>\n");
      out.write("                            <div  style=\"float: right;margin-top: 0px;\">\n");
      out.write("                                <a style=\"color: #666666 \"href=\"lostPassword.jsp\" >fogot password</a>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div  style=\"margin-top: 40px;\">\n");
      out.write("                                <a class=\"btn btn-facebook btn-block \" href=\"https://www.facebook.com/\"><i class=\"fa fa-facebook\"></i> | Connect with Facebook</a>\n");
      out.write("\n");
      out.write("                                <a class=\"btn btn-twitter btn-block \" href=\"https://twitter.com/login\"><i class=\"fa fa-facebook\"></i> | Connect with Twiter</a>\n");
      out.write("                                <a style=\"float: left;margin-top: 10px\" href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\">Dont have and Account? Sign Up!</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                </center>  \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Modal -->\n");
      out.write("        <div class=\"modal fade\" id=\"myModal\" role=\"dialog\">\n");
      out.write("            <div class=\" modal-dialog \" style=\"width:350px\">\n");
      out.write("\n");
      out.write("                <!-- Modal content-->\n");
      out.write("                <form method=\"POST\"  class=\"form-horizontal\" role=\"form\" action=\"AddUser\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h4 class=\"modal-title\"><img src=\"images/User-icon.png\">User registration</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\" style=\"margin: 0px 15px 0px 15px\">\n");
      out.write("\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"first name\" style=\"border-radius: 0px\" name=\"fname\" id=\"fname\">\n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-folder-open\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"text\" style=\"border-radius: 0px;\" class=\"form-control\" placeholder=\"last name\" name=\"lname\" id=\"lname\"/>  \n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-folder-close\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"text\" style=\"border-radius: 0px;\" class=\"form-control\" placeholder=\" username\" name=\"userName\" id=\"userName\"/>  \n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-user\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"password\"style=\"border-radius: 0px;\" class=\"form-control\" placeholder=\"password\" name=\"password\" id=\"password\"/>\n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-lock\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"cpassword\" style=\"border-radius: 0px;\" class=\"form-control\" placeholder=\"confirm password\" name=\"cpassword\" id=\"cpassword\"/>\n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-thumbs-up\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group has-feedback has-feedback-right\" >                                           \n");
      out.write("                                <input type=\"email\" style=\"border-radius: 0px\" class=\"form-control\" placeholder=\"email  \" name=\"email\" id=\"email\"/>  \n");
      out.write("                                <i class=\"form-control-feedback glyphicon glyphicon-globe\" style=\"color: #cccccc\"></i>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div id=\"loginErrorMsg\" class=\"alert alert-error hide\">Wrong username or password</div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <input type=\"submit\" style=\"border-radius: 0px\" class=\"btn btn-primary\" value=\"Submit\" name=\"Add\"/>\n");
      out.write("                            <button type=\"button\" style=\"border-radius: 0px\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
