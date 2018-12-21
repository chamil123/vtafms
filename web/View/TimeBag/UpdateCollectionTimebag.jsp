<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.TimeBagController"%>
<%@page import="BIT.Project.VTAFMS.Model.TimeBag"%>
<%@page import="BIT.Project.VTAFMS.Controller.CollectTimeBagLineController"%>
<%@page import="BIT.Project.VTAFMS.Model.CollectTimeBagLine"%>
<%@page import="BIT.Project.VTAFMS.Model.Runner"%>
<%@page import="BIT.Project.VTAFMS.Controller.RunnerController"%>
<%@page import="BIT.Project.VTAFMS.Model.CollectTimeBag"%>
<%@page import="BIT.Project.VTAFMS.Controller.CollectTimeBagController"%>
<%@page import="BIT.Project.VTAFMS.Controller.AgentController"%>
<%@page import="BIT.Project.VTAFMS.Model.Agent"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExpensesCategoryController"%>
<%@page import="BIT.Project.VTAFMS.Model.ExpensesCategory"%>
<%@page import="java.util.List"%>
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


        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>

        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            sitePersonel = {item: []};
            var array = [];
            function addtoTable() {


                var tcode = document.getElementById("tcode").value;
                var clock = document.getElementById("clock").value;
                var clockvalue = document.getElementById("clockvalue").value;
                var clocktime = document.getElementById("clocktime").value;
                var pkt = document.getElementById("pkt").value;
                var pktavailable = document.getElementById("pktavailable").value;
                sitePersonel.item.push({"Tcode": tcode, "Clock": clock, "Clockvalue": clockvalue, "Clocktime": clocktime, "Pkt": pkt, "Pktavailable": pktavailable});
                // array.push(chitNum + ":" + Amount + ":" + Payment);

                // alert("chamil mekavath hariyanna"+sitePersonel+""+chitNum);
                jsonCall();

                var outputData;
                function jsonCall() {
                    //  alert("chamil m");
                    var value = JSON.stringify(sitePersonel);
                    obj = JSON.parse(value);
                    var list = obj.item;
                    // alert("chamil mekavath hariyanna"+value);
                    outputData = "<table id='myTableData' class='table-style-three'   width='100%'>";
                    outputData += "<th >" + "id" + "</th>";
                    outputData += "<th >" + "Chit number" + "</th>";
                    outputData += "<th  >" + "Amount" + "</th>";
                    outputData += "<th align='center' >" + "Payment" + "</th>";
                    outputData += "<th align='center' >" + "Payment" + "</th>";
                    outputData += "<th align='center' >" + "Payment" + "</th>";
                    outputData += "<th align='center' >" + "Payment" + "</th>";
                    outputData += "<th align='center' style=' padding-right : 20px'>" + "Action" + "</th>";

                    var id = 1;
                    var total = 0;
                    //var l = 0;
                    for (index in list)
                    {
                        outputData += "<tr>";
                        var objs = list[index];
                        var Tcode = objs["Tcode"];
                        var Clock = objs["Clock"];
                        var Clockvalue = objs["Clockvalue"];
                        var Clocktime = objs["Clocktime"];
                        var Pkt = objs["Pkt"];
                        var Pktavailable = objs["Pktavailable"];
                        //  l = parseFloat(payment);

                        outputData += "<td>" + id + "</td>";
                        outputData += "<td>" + Tcode + "</td>";
                        outputData += "<td>" + Clock + "</td>";
                        outputData += "<td>" + Clockvalue + "</td>";
                        outputData += "<td>" + Clocktime + "</td>";
                        outputData += "<td>" + Pkt + "</td>";
                        outputData += "<td align='right' style='font-weight : bold;font-size:16px;padding-right : 20px'>" + Pktavailable + "</td>";
                        outputData += "<td align='right' style='font-weight : bold;font-size:16px;padding-right : 10px;width:30px'><a href='#' style='color:gray' style='float : right' ' >  <i class='glyphicon glyphicon-file'></i></a>  <a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a></td>";

                        //   total = total + l;
                        //alert("chamil mekavath hariyanna" + name);
                        id++;


                    }


                    outputData += "</table>";
                    document.getElementById('myDiv').innerHTML = outputData;

                }

            }
            function deleteRow(obj) {

                array.pop();
                sitePersonel.item.pop();
                var index = obj.parentNode.parentNode.rowIndex;
                var table = document.getElementById("myTableData");
                table.deleteRow(index);


            }


        </script>
        <script>
            function selectedItem() {

                var date = new Date();

                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();

                if (month < 10)
                    month = "0" + month;
                if (day < 10)
                    day = "0" + day;
                var today = year + "-" + month + "-" + day;
                // document.getElementById('dt').value = today;


                startTime();
                gettablerowcount();
            }
            /* for set clock*/

            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('clock').value = h + ":" + m + ":" + s;
                var t = setTimeout(startTime, 500);
            }
            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                // add zero in front of numbers < 10
                return i;
            }

            /* end set clock*/

        </script>
        <script type="text/javascript">

            var Runner = [
            ];
            var TimeBag = [
            ];

            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                $.ajax({
                    type: 'POST',
                    url: "../../GetAllRunnersinAjax"
                }).done(function (data) {
                    // alert(data);
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var y;
                        for (y = 0; y < columnTokens.length; y++) {
                        }

                        Runner.push({"label": columnTokens[1], "number": columnTokens[0]});

                    }
                });

                $.ajax({
                    type: 'POST',
                    url: "../../GetAllTimeBagsinAjax"
                }).done(function (data) {
                    // alert(data);
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var y;
                        for (y = 0; y < columnTokens.length; y++) {
                        }
                        //  alert(data);

                        TimeBag.push({"label": columnTokens[0], "timebagecode": columnTokens[2]});
                    }
                });
            }

            $(document).ready(function () {
                $("#rname").autocomplete({source: Runner, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#rnum").val(ui.item.number);
                    }});
            });

            $(document).ready(function () {
                $("#tcode").autocomplete({source: TimeBag, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#pktavailable").val(ui.item.timebagecode);
                    }});
            });
        </script>   
        <script>
            var increment = 0;
            function addRow(tableID) {

                var tcode = document.getElementById('tcode').value;
                var clock = document.getElementById('clock').value;
                var clockvalue = document.getElementById('clockvalue').value;
                var closingtime = document.getElementById('clocktime').value;
                var pkt = document.getElementById('pkt').value;
                var avilblepkt = document.getElementById('pktavailable').value;



                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                document.getElementById("rowcount").value = rowCount;
                var row = table.insertRow(rowCount);
                var cell1 = row.insertCell(0);
                var element1 = document.createElement("input");
                element1.type = "checkbox";
                element1.name = "chkbox[]";
                cell1.appendChild(element1);

                var counts = rowCount - 1;
                var cell2 = row.insertCell(1);
                var timeBagCode = document.createElement("input");
                timeBagCode.type = "text";
                if (rowCount % 2 == 1) {
                    timeBagCode.style = "border-style: hidden;background-color : #EEEEEE;width:117px";
                } else {
                    timeBagCode.style = "border-style: hidden;width:117px";
                }
                timeBagCode.name = "timeBagCode[" + counts + "]";
                timeBagCode.id = "timeBagCode[" + counts + "]";
                timeBagCode.value = tcode;
                //document.getElementById("rowcount").value = count-1;
                cell2.appendChild(timeBagCode);

                var cell3 = row.insertCell(2);
                var openTime = document.createElement("input");
                openTime.type = "text";
                if (rowCount % 2 == 1) {
                    openTime.style = "border-style: hidden;background-color : #EEEEEE;width:152px";
                } else {
                    openTime.style = "border-style: hidden;width:152px";
                }
                openTime.name = "openTime[" + counts + "]";
                openTime.value = clock;
                cell3.appendChild(openTime);

                var cell4 = row.insertCell(3);
                var clockVal = document.createElement("input");
                clockVal.type = "text";
                if (rowCount % 2 == 1) {
                    clockVal.style = "border-style: hidden;background-color : #EEEEEE;width:148px";
                } else {
                    clockVal.style = "border-style: hidden;width:148px";
                }
                clockVal.name = "clockVal[" + counts + "]";
                clockVal.id = "clockVal[" + (counts - 1) + "]";
                clockVal.value = clockvalue;
                cell4.appendChild(clockVal);

                var cell5 = row.insertCell(4);
                var closing = document.createElement("input");
                closing.type = "text";
                if (rowCount % 2 == 1) {
                    closing.style = "border-style: hidden;background-color : #EEEEEE;width:148px";
                } else {
                    closing.style = "border-style: hidden;width:148px";
                }
                closing.name = "closing[" + counts + "]";
                closing.id = "closing[" + (counts - 1) + "]";
                closing.value = closingtime;
                cell5.appendChild(closing);

                var cell6 = row.insertCell(5);
                var packets = document.createElement("input");
                packets.type = "text";
                if (rowCount % 2 == 1) {
                    packets.style = "border-style: hidden;background-color : #EEEEEE;width:85px";
                } else {
                    packets.style = "border-style: hidden;width:85px";
                }
                packets.name = "packets[" + counts + "]";
                packets.id = "packets[" + (counts - 1) + "]";
                packets.value = pkt;
                cell6.appendChild(packets);

                var cell7 = row.insertCell(6);
                var availablepkt = document.createElement("input");
                availablepkt.type = "text";
                if (rowCount % 2 == 1) {
                    availablepkt.style = "border-style: hidden;background-color : #EEEEEE;width:100px";
                } else {
                    availablepkt.style = "border-style: hidden;width:100px";
                }
                availablepkt.name = "availablepkt[" + counts + "]";
                availablepkt.id = "availablepkt[" + (counts - 1) + "]";
                availablepkt.value = avilblepkt;
                cell7.appendChild(availablepkt);

                var cell8 = row.insertCell(7);
                var btn = document.createElement("a");
                //btn.type = "button";
                btn.setAttribute("class", "glyphicon glyphicon-trash");
                btn.atribute = "<a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a> "
                btn.onclick = function () {
                    var table = document.getElementById('addressesTable');
                    var rowCount = table.rows.length;
                    if (rowCount % 2 == 1) {
                        houseNum.style = "border-style: hidden;background-color : #EEEEEE";
                    } else {
                        houseNum.style = "border-style: hidden";
                    }
                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
                    }

                };
                btn.name = "button[" + counts + "]";
                cell8.appendChild(btn);

                document.getElementById('tcode').value = "";
                document.getElementById('clock').value = "";
                document.getElementById('clockvalue').value = "";
                document.getElementById('clocktime').value = "";
                document.getElementById('pkt').value = "";
                document.getElementById('pktavailable').value = "";


            }


            function deleteRow(addressesTable) {
                try {
                    var table = document.getElementById(addressesTable);
                    var rowCount = table.rows.length;

                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
                    }
                } catch (e) {
                    alert(e);
                }
            }
            function  gettablerowcount() {
                var count = document.getElementById("addressesTable").rows.length;
                document.getElementById("rowcount").value = count - 1;
            }
        </script>
        <script>
            function getTimeDefferance() {
                var Time1 = document.getElementById('clock').value;
                var res = Time1.split(":");
                var result;
                var results;

                var integer;
                var fractional;

                var Time2 = document.getElementById('clockvalue').value;
                var res1 = Time2.split(".");
                if (!res1[1] == "") {
                    integer = res[0] - res1[0];
                    if (res[1] > res1[1]) {
                        fractional = res[1] - res1[1];
                        result = integer + ":" + fractional;
                        //alert("as : "+result);
                    } else if (res[1] < res1[1]) {

                        results = res[1] - res1[1];
                        fractional = results + 60;
                        result = integer - 1 + ":" + fractional;
                    }
                    document.getElementById('clocktime').value = result;

                }

            }
        </script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="selectedItem();">
        <%
            String timebag_id = request.getParameter("timebag_id");

            CollectTimeBag collecttimeBag = CollectTimeBagController.searchCollectTimeBagById(Integer.parseInt(timebag_id));
            Runner runner = RunnerController.searchRunnerById(collecttimeBag.getRunner_id());

            List<CollectTimeBagLine> ctlist = (List<CollectTimeBagLine>) CollectTimeBagLineController.getAllCollectTimeBagLinesById(collecttimeBag.getCollection_timeBag_id());
            List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();

            //List<ExpensesCategory> listexpensesCategory = (List<ExpensesCategory>) ExpensesCategoryController.getAllExpensesCategory();
%>
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
                <section class="content-header">
                    <h1>
                        Timebag
                        <small>Update registration</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewCollectTimeBags.jsp"><i class="fa fa-dashboard"></i> View Collection timebag</a></li>
                        <li class="active">Update timebag</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="box box-default">
                        <div class="box-header no-border">
                        </div>


                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <form method="POST" action="../../CollectTimeBags?action=update">
                                    <div class="col-md-6">
                                        <div class="form-group" style="width: 400px">
                                            <label>Runner name</label>

                                            <input type="hidden" name="tnum"  id="tnum" class="form-control" value="<%=timebag_id%>">
                                            <input type="hidden" name="rnum"  id="rnum" value="<%=runner.getRunner_id()%>"   class="form-control" >
                                            <input type="text" name="rname" style="color: black" id="rname" value="<%=runner.getRunner_firstName()%>" class="form-control" placeholder="Select Runner">
                                        </div>
                                        <div class="form-group" style="width: 400px">
                                            <label>date</label>
                                            <input type="date" id="dt" name="dt" value="<%=collecttimeBag.getCollection_timeBag_date()%>" class="form-control">
                                        </div>
                                        <div class="form-group" style="width: 400px">

                                            <label>Agent name</label>
                                            <select class="form-control select2" onchange="selectedItem(this)" style="width: 100%;" id="agent" name="agent">
                                                <option selected value="default"> --------Please select State---------   </option>
                                                <%
                                                    for (Agent model : listAgent) {
                                                        if (model.getAgent_id() == collecttimeBag.getAgent_id()) {
                                                %>
                                                <option selected="selected" value="<%=model.getAgent_id()%>"  ><%=model.getAgent_name()%></option>
                                                <%}
                                                    }
                                                %>
                                            </select>



                                        </div>
                                    </div>
                                    <div class="col-md-6" style="margin-left: -50px">

                                        <%@include file="../../pieDonut3D.html" %>  

                                    </div>




                                    <div class="col-md-12" style="padding-left: 0px;padding-right: 0px">

                                        <div class="col-md-2" style="padding-right: 0px;;width: 230px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Time bag code</label>
                                                <input type="text" name="tcode" style="color: black" id="tcode" class="form-control" placeholder="Select timebag">
                                            </div>
                                        </div>
                                        <div class="col-md-2"style="padding-left: 0px;padding-right: 0px;">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Current open time</label>
                                                <input type="text" id="clock" name="clock" class="form-control" disabled style="font-size: 20px;">
                                            </div>
                                        </div>
                                        <div class="col-md-2"style="padding-left: 0px;padding-right: 0px">

                                            <div class="form-group">
                                                <label style="color: #0066cc"> Timebag clock value</label>
                                                <input type="text" id="clockvalue" name="clockvalue" class="form-control"style="font-size: 18px;" oninput="getTimeDefferance();" placeholder="00.00">
                                            </div>
                                        </div>
                                        <div class="col-md-2"style="padding-left: 0px;padding-right: 0px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Clossing time</label>
                                                <input type="text" id="clocktime" name="clocktime"style="font-size: 16px;" class="form-control" readonly >
                                            </div>
                                        </div>
                                        <div class="col-md-1"style="padding-left: 0px;padding-right: 0px;width: 115px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">packets</label>
                                                <input type="text" id="pkt" name="pkt" class="form-control" placeholder="Enter Reson">
                                            </div>
                                        </div>
                                        <div class="col-md-2"style="padding-left: 0px;padding-right: 0px;width: 125px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Available packets</label>
                                                <input type="text" id="pktavailable" name="pktavailable" class="form-control" disabled placeholder="Enter Reson">
                                            </div>
                                        </div>
                                        <div class="col-md-1" style="margin-left: -15px">
                                            <div class="form-group">
                                                <label >.</label>
                                                <button type="button" name="button[0]"   id="add" value="Add" onclick="addRow('addressesTable')" style="border-radius: 0px"  class="btn btn-primary">
                                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                                    Add</button>
                                            </div>
                                        </div>


                                        <div class="col-md-12 " >

                                            <input type="hidden"  id="rowcount" name="rowcount" />

                                            <table id="addressesTable"  class="table-style-three"   width='100%'  >
                                                <tr>
                                                    <th>select</th>
                                                    <th>Timebag code</th>
                                                    <th>Open time</th>
                                                    <th>Timebag value</th>
                                                    <th>Closing time</th>
                                                    <th>Packets</th>
                                                    <th>Available pkts</th>
                                                    <th>action</th>
                                                </tr>

                                                <%
                                                    int i = 1;
                                                    TimeBag timebag;
                                                    for (CollectTimeBagLine model : ctlist) {
                                                        timebag = TimeBagController.searchTimeBagById(model.getTime_bag_Code());

                                                %>

                                                <tr >
                                                    <td><input type="checkbox" name="chk"/></td>

                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=model.getTime_bag_Code()%>" name="timeBagCode[<%=i%>]" /></td>
                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=model.getCollection_timeBag_line_OpenTime()%>" name="openTime[<%=i%>]" /></td>
                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=model.getCollection_timeBag_line_timeValue()%>" name="clockVal[<%=i%>]"   /></td>
                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=model.getCollection_timeBag_line_closeTime()%>" name="closing[<%=i%>]"   /></td>
                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=model.getCollection_timeBag_line_timeValue()%>" name="packets[<%=i%>]"   /></td>
                                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" value="<%=timebag.getTime_bag_availableCenters()%>" name="availablepkt[<%=i%>]"   /></td>
                                                    <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                                </tr>
                                                <%
                                                        i++;
                                                    }%>

                                                <tr hidden>
                                                    <td><input type="checkbox" name="chk"/></td>
                                                <input type="hidden"  id="rowcount" name="rowcount" />
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="houseNum[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="city[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="country[0]"   /></td>
                                                <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                                </tr>
                                            </table>
                                            <!--<INPUT type="button" name="button[0]" value="Add row" onclick="addRow('addressesTable')" />
                                            <input type="submit" value="SUBMIT"/>-->


                                        </div>



                                    </div>
                                    <div class="col-md-6" style="padding-top: 15px">
                                        <div class="form-group">

                                            <button type="submit" class="btn btn-primary"  value="Update timeBag"name="Update">
                                                <i class="glyphicon glyphicon-save"></i>
                                                Update timebag
                                            </button>
                                            <button type="reset" name="reset" class="btn btn-danger">
                                                <i class="glyphicon glyphicon-trash"></i>
                                                Clear</button>

                                        </div>

                                    </div>
                                </form>
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
        </div>


        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>


    </body>

</html>
