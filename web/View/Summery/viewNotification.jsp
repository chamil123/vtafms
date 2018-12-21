<%-- 
    Document   : viewSummery
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BIT.Project.VTAFMS.Controller.SummeryController"%>
<%@page import="BIT.Project.VTAFMS.Model.Summery"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vikum Turf Account | Dashboard</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <style>
            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
        
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
           // List<Summery> listSummery = (List<Summery>) SummeryController.getAllSummerys();
            //int nopage = 5;
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 12) - 12;
                }
            }

            double rowCount = SummeryController.getRowCount();
            int row = (int) rowCount;

            double nopage = rowCount / 12;

            // System.out.print("pagesnumber of : " + rowCount);
            //double d = 2.34568;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            //String[] parts = string.split("-");
//String part1 = parts[0]
            //  String splits[] = formatval.split(".");
            int aa = formatval.indexOf(".");
            int bb = formatval.length();
            String sub = formatval.substring(aa, bb);
            System.out.println("number of pafes : " + formatval);
            System.out.println("alssss : " + formatval.indexOf("."));
            System.out.println("alsssssdd : " + formatval.length());
            System.out.println("alssyuu : " + formatval.substring(aa, bb));

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                } else {
                    System.out.print("subset : ");
                }

            }
            List<Notification> limitNotification = (List<Notification>) NotificationController.limitResult("" + page1);
        %>
   
 

        <div class="wrapper">
            <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle " data-toggle="offcanvas" role="button" >
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
                        Notofication
                        <small>View Notification</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="box box-default">
                       
                        <table class="table table-bordered" width="70%" style="margin-bottom: 0px">

                            <tr style="background-color: #F2F2F3">
                                <th>&nbsp;id&nbsp;</th>
                                <th>Date&nbsp;</th>
                                <th>Summery name&nbsp;</th>
                                <th>Center id&nbsp;</th>
                              
                            </tr>
                            <%   
                                for (Notification model : limitNotification) {
                            %>
                            <tr 
                                <%if (model.getNotification_status().equals("Completed")) { %>
                                Style=" background-color: #d6e9c6;"
                                <% }%>
                                >
                                <td>&nbsp;<%=model.getNotification_id()%></td>
                                <td>&nbsp;<%=model.getNotification_Own()%></td>
                                <td><%=model.getNotificationDescription()%></td>
                                <td><%=model.getNotification_status()%></td>
                                
                             
                            </tr>
                            <%}%>
                        </table>  
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="viewNotification.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="viewNotification.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="viewNotification.jsp?page=<%=i - 1%>" class="page active">last</a>
                            <div style="float: right;font-size: 12px;color: #666666;padding-right: 15px">Showing 1 to 8 of <spam ><%=row%></spam> entries</div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
            <!-- Modal -->
    
        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>
