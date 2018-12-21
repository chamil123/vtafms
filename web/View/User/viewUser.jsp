<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="com.sun.media.sound.SoftAbstractResampler"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="BIT.Project.VTAFMS.Model.User"%>
<%@page import="BIT.Project.VTAFMS.Controller.UserController"%>
<%@page import="BIT.Project.VTAFMS.Model.Role"%>
<%@page import="java.util.List"%>
<%@page import="BIT.Project.VTAFMS.Controller.RoleController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vikum Turf Account | Dashboard</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <style>

            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
        <script>
            function createXMLHttpRequest()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                } else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
            function alertFunction(user_id) {
                var id, fname, lname, email, status, image, phonenumber, gender, dob, nic, address, uname, rolename;

                var request = createXMLHttpRequest();
                var url = "../../GetUserDetais";
                request.open("GET", url + "?dayVal=" + user_id, true);
                request.send();
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            var data = request.responseText;
                            var rowTokens = data.split("!");
                            var x;
                            var outputData;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");
                                var y;
                                for (y = 0; y < columnTokens.length; y++) {
                                }
                                id = columnTokens[0];
                                fname = columnTokens[1];
                                lname = columnTokens[2];
                                email = columnTokens[3];
                                status = columnTokens[4];
                                phonenumber = columnTokens[6];
                                gender = columnTokens[7];
                                dob = columnTokens[8];
                                nic = columnTokens[9];
                                address = columnTokens[10];
                                rolename = columnTokens[11];
                                uname = columnTokens[12];
                                outputData = ' <img style="max-width:223px;" src="' + "../../uploads/" + columnTokens[5].trim() + '">';
                                //CiviliansDetails.item.push({"Id": columnTokens[0], "FirstName": columnTokens[1], "LastName": columnTokens[2], "Nationality": columnTokens[3], "Mobile": columnTokens[4], "Ethnicity": columnTokens[5], "e_mail": columnTokens[6], "city": columnTokens[7], "Profession": columnTokens[9]});
                            }
                            document.getElementById('fname').innerHTML = fname;
                            document.getElementById('fname1').innerHTML = fname;
                            document.getElementById('lname').innerHTML = lname;
                            document.getElementById('firstname').innerHTML = fname;
                            document.getElementById('lastname').innerHTML = lname;
                            document.getElementById('gender').innerHTML = gender;
                            document.getElementById('dateofbirth').innerHTML = dob;
                            document.getElementById('nic').innerHTML = nic;
                            document.getElementById('email').innerHTML = email;
                            document.getElementById('phone').innerHTML = phonenumber;
                            document.getElementById('Address').innerHTML = address;
                            document.getElementById('Address2').innerHTML = address;
                            document.getElementById('uname').innerHTML = uname;
                            document.getElementById('id').innerHTML = id;
                            document.getElementById('image').innerHTML = outputData;
                            document.getElementById('role').innerHTML = rolename;
                        }
                    }

                }
            }
            function getUserIdForDelete(user_id) {

                document.getElementById('iddelete').value = user_id;

            }
        </script>
        <script>

            var User = [
            ];
            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                $.ajax({
                    type: 'POST',
                    url: "../../SearchUser?action=user"
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");

                        User.push({"label": columnTokens[0], "number": columnTokens[1]});
                    }
                });

            }
            $(document).ready(function () {
                $("#searchs").autocomplete({source: User, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);


                    }});
            });
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%
            String name = request.getParameter("name");
            String pagenum = request.getParameter("page1");
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 10) - 10;
                }
            }
            double rowCount = UserController.getRowCount();
            int row = (int) rowCount;
            double nopage = rowCount / 10;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            int before = formatval.indexOf(".");
            int after = formatval.length();
            String sub = formatval.substring(before, after);

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                }
            }
            List<User> listUser = (List<User>) UserController.limitresult("" + page1);

            String usereRes = request.getParameter("userResult");
            int res_user = 0;

            if (usereRes != null) {
                res_user = Integer.parseInt(usereRes.toString());
            }

            if (name != null && pagenum != null) {

                if (request.getParameter("page") != null) {
                    int pages = Integer.parseInt(pagenum);
                    page1 = 0;
                    if (pages == 0 || pages == 1) {
                        page1 = 0;
                    } else {
                        page1 = (pages * 10) - 10;
                    }
                }
                rowCount = UserController.getRowCountSearch(name);
                row = (int) rowCount;
                nopage = rowCount / 10;

                formatval = f.format(nopage).toString();

                before = formatval.indexOf(".");
                after = formatval.length();
                sub = formatval.substring(before, after);
                if (!sub.equals("null")) {
                    double subst = Double.parseDouble(sub);
                    if (subst > 0) {
                        nopage++;
                    }
                }
                listUser = (List<User>) UserController.searchAndlimitResult(name, "" + page1);

            }  if (name == "") {
                  page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 10) - 10;
                }
            }
             rowCount = UserController.getRowCount();
             row = (int) rowCount;
             nopage = rowCount / 10;
             f = new DecimalFormat("##.0");
             formatval = f.format(nopage).toString();

             before = formatval.indexOf(".");
             after = formatval.length();
             sub = formatval.substring(before, after);

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                }
            }
                listUser = (List<User>) UserController.limitresult("" + page1);

            }
        %>
        <script>

            function load() {
                var result =<%=res_user%>
                if (result == 1) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                } else if (result == 2) {
                    $('.failure').fadeIn(1500).delay(1500).fadeOut(400);
                }

            }


        </script>

        <div class="wrapper">
            <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" >
                            <span class="glyphicon glyphicon-menu-hamburger"></span>
                        </a>

                        <%@include file="../../includes/signOut.jspf" %>  
                    </nav>
                </header>
            </div>
            <%@include file="../../includes/navbar.jspf" %>  
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        User registration
                        <small>View user</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">View users</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form  class="form-inline" role="form"  action="../../SearchUser?action=search" method="POST" >

                                <div class="form-group">
                                    <a href="User.jsp" style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px;margin-left: -5px" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; New User</a>


                                </div>
                                <div class="form-group">


                                </div>

                                <div class="form-group" style="float: right">
                                    <input style="height: 25px" type="hidden" class="form-control" name="page" id="page" value="<%=page1 %>" >
                                    <input style="height: 25px" type="text" class="form-control" name="searchs" id="searchs"  placeholder="Enter user name">
                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px" value="search User" name="Add"><i class="glyphicon glyphicon-search" ></i>&nbsp;Search User</button>

                                </div>

                            </form>
                        </div>
                        <table class="table table-striped" width="70%">

                            <tr>
                                <th>&nbsp;id&nbsp;</th>
                                <th>First name&nbsp;</th>
                                <th>Last name&nbsp;</th>
                                <th>Email&nbsp;</th>
                                <th>Phone Number&nbsp;</th>
                                <th>Dateof birth&nbsp;</th>
                                <th>Gender&nbsp;</th>
                                <th>Nic&nbsp;</th>

                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                for (User model : listUser) {
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getUser_id()%></td>
                                <td>&nbsp;<%=model.getUser_firstName()%></td>
                                <td><%=model.getUser_lastName()%></td>
                                <td><%=model.getUser_email()%></td>
                                <td><%=model.getUser_phoneNumber()%></td>
                                <td><%=model.getUser_dob()%></td>
                                <td><%=model.getUser_gender()%></td>
                                <td><%=model.getUser_nic()%></td>
                                <td style="float: right;padding-right: 15px"> 

                                    <button type="submit" class="btn btn-default btn-sm "  >
                                        <a href="" onclick="alertFunction(<%=model.getUser_id()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>

                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateUser.jsp?user_id=<%=model.getUser_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getUser_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>
                                    <%if (model.getUser_status().equals("Activate")) {%>

                                    <a href="../../UserActivation?user_id=<%=model.getUser_id()%>&action=deactivate" style="color: white">

                                        <button style="width: 75px" type="button" class="btn btn-github btn-sm " onclick="return confirmMsg('Active')">
                                            Deactivate
                                        </button> 
                                    </a>
                                    <%  } else {%>
                                    <a href="../../UserActivation?user_id=<%=model.getUser_id()%>&action=activate" style="color: black">

                                        <button style="width: 75px" type="button" class="btn btn-group btn-sm" onclick="return confirmMsg('Active')">
                                            Activate
                                        </button> 
                                    </a>       
                                    <%}%>

                                </td>
                            </tr>


                            <%}%>
                        </table> 
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="viewUser.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="viewUser.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="viewUser.jsp?page=<%=i - 1%>" class="page active">last</a>
                            <div style="float: right;font-size: 12px;color: #666666;padding-right: 15px">Showing 1 to 10 of <spam ><%=row%></spam> entries</div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" >
                <div class=" modal-dialog " style="width:70%;margin-top: 100px;background-color: #f0f0f0;border-radius: 50px">

                    <!-- Modal content-->

                    <div class="modal-content" style="background-color: #ECF0F5">

                        <div class="modal-header" style="padding: 8px 8px 8px 20px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">User informations  <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp; Hello </span><spam style="font-size: 13px;color: #0000cc" id="fname1" ></spam></h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 15px 0px 15px">
                            <div class="col-md-3" style="background-color: #ffffff;height: 395px;float: left;margin-left: -5px" >
                                <div id="image" style="margin-left: -15px"> </div>
                                <table>
                                    <tr><td><h4 id="fname" style="float: left"></h4></td><td><h5 id="lname" ></h5></td></tr>
                                    <tr><td><h5 style="font-weight: bold" id="role"></h5></td></tr>
                                </table>
                                <div id="Address"></div>
                            </div>
                            <!-- /.col (left) -->
                            <div class="col-md-9"style="background-color: #ffffff;height: 395px;;float: right;margin-right: -5px;">

                                <div class="panel panel-default" style="margin-left: -15px;margin-right: -15px">
                                    <div class = "panel-heading" style="background-color: #009688;border-radius: 0px;color: #ffffff;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Generel Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>First name :</span></td>
                                                <td><span id="firstname"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Last name :</span></td>
                                                <td><span id="lastname"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Gender :</span></td>
                                                <td><span id="gender"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Date of birth :</span></td>
                                                <td><span id="dateofbirth"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>NIC number :</span></td>
                                                <td><span id="nic"></span></td>
                                            </tr>
                                        </table> 
                                    </div>
                                    <div class = "panel-heading" style="background-color: #009688;color: #ffffff;border-radius: 0px;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Contact Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>E mail address :</span></td><td><span id="email"></span></td></tr>
                                            <tr><td style="width: 190px"><span>Phone number :</span></td><td><span id="phone"></span></td></tr>
                                            <tr><td style="width: 190px"><span>Address :</span></td><td><span id="Address2"></span></td></tr>

                                        </table> 
                                    </div>
                                    <div class = "panel-heading" style="background-color: #009688;color: #ffffff;border-radius: 0px;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Other Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>User ID numer :</span></td><td><span id="id"></span></td></tr>
                                            <tr><td style="width: 190px"><span>User name :</span></td><td><span id="uname"></span></td></tr>

                                        </table> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div>...</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="deleteModal" role="dialog" >
                <div class="modal-dialog" style="width: 500px">

                    <!-- Modal content-->

                    <div class="modal-content">

                        <div class="modal-header" style="height: 35px;padding: 7px 7px 7px 17px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <i class="glyphicon glyphicon-trash" style="float: left;padding-top: 5px;padding-right: 10px"></i>
                            <h4 class="modal-title">Confirm a user deletion</h4>
                        </div>
                        <form action="../../UserActivation?action=delete" method="POST">


                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" class="form-control" id="iddelete"  name="user_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete User" name="delete" />


                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>

        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>
