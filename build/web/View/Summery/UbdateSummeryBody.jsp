<%-- 
    Document   : UbdateSummeryBody
    Created on : Oct 18, 2016, 2:43:19 PM
    Author     : Chamil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">


        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>


        <script>
            var increment = 0;
            var rowCount;
            function addRow(tableID) {

                var chtnumber = document.getElementById('chtnumber').value;
                var amount = document.getElementById('amount').value;
                var payment = document.getElementById('payment').value;



                var table = document.getElementById(tableID);
                rowCount = table.rows.length;
                document.getElementById("rowcount").value = rowCount;
                var row = table.insertRow(rowCount);
                var cell1 = row.insertCell(0);
                var element1 = document.createElement("input");
                element1.type = "checkbox";
                element1.name = "chkbox[]";
                cell1.appendChild(element1);

                var counts = rowCount - 1;
                var cell2 = row.insertCell(1);
                var chitNo = document.createElement("input");
                chitNo.type = "text";
                if (rowCount % 2 == 1) {
                    chitNo.style = "border-style: hidden;background-color : #EEEEEE;width:80px";
                } else {
                    chitNo.style = "border-style: hidden;width:80px";
                }
                chitNo.name = "houseNum[" + counts + "]";
                chitNo.id = "houseNum[" + counts + "]";
                chitNo.value = chtnumber;
                //document.getElementById("rowcount").value = count-1;
                cell2.appendChild(chitNo);

                var cell3 = row.insertCell(2);
                var chitAmount = document.createElement("input");
                chitAmount.type = "text";
                if (rowCount % 2 == 1) {
                    chitAmount.style = "border-style: hidden;background-color : #EEEEEE;width:100px";
                } else {
                    chitAmount.style = "border-style: hidden;width:100px";
                }
                chitAmount.name = "city[" + counts + "]";
                chitAmount.value = amount;
                cell3.appendChild(chitAmount);

                var cell4 = row.insertCell(3);
                var chitPay = document.createElement("input");
                chitPay.type = "text";
                if (rowCount % 2 == 1) {
                    chitPay.style = "border-style: hidden;background-color : #EEEEEE;width:100px";
                } else {
                    chitPay.style = "border-style: hidden;width:100px";
                }
                chitPay.name = "country[" + counts + "]";
                chitPay.id = "country[" + (counts - 1) + "]";
                chitPay.value = payment;
                cell4.appendChild(chitPay);



                var cell5 = row.insertCell(4);
                var btn = document.createElement("a");
                //btn.type = "button";
                btn.setAttribute("class", "glyphicon glyphicon-trash");
                btn.atribute = "<a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a> "
                btn.onclick = function () {

                    var table = document.getElementById('addressesTable');
                    var rowCount = table.rows.length;

                    if (rowCount % 2 == 1) {

                        chitNo.style = "border-style: hidden;background-color : #ffffff";
                        chitAmount.style = "border-style: hidden;background-color : #ffffff";
                        chitPay.style = "border-style: hidden;background-color : #EEEEEE";
                    } else {
                        chitNo.style = "border-style: hidden";
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

                    var j;
                    var total = 0;
                    var row = rowCount - 2
                    if (row > 0) {
                        for (var i = 2; i < rowCount; i++) {
                            j = document.getElementById("addressesTable").rows[i].cells[3].getElementsByTagName("input")[0].value;
                            var k = parseInt(j);
                            total = total + k;
                            increment = 1;
                        }
                        document.getElementById('paymentTotal').value = total;
                    } else {
                        document.getElementById('paymentTotal').value = 0;
                    }
                    calculations();
                };
                btn.name = "button[" + counts + "]";
                cell5.appendChild(btn);
                rowTot();
                document.getElementById('chtnumber').value = "";
                document.getElementById('amount').value = "";
                document.getElementById('payment').value = "";
            }
            function rowTot() {
                var j;
                var total = 0;
                var row = rowCount - 2
                if (row > 0) {
                    for (var i = 2; i < rowCount + 1; i++) {
                        j = document.getElementById("addressesTable").rows[i].cells[3].getElementsByTagName("input")[0].value;
                        var k = parseInt(j);
                        total = total + k;
                        increment = 1;
                    }
                    document.getElementById('paymentTotal').value = total;
                } else {
                    var payment = document.getElementById('payment').value;
                    document.getElementById('paymentTotal').value = payment;
                }
                calculations();
            }


        </script>
    </head>
    <body>
        <section class="content">

            <div class="row">
                <form  role="form"  action="../../AddSummery" method="POST" >

                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title" >Basic informations</h3>
                            <div  id="date" name="date" style="float: right;font-size: 16px"></div>
                            <input type="hidden" id="dates" name="dates" style="float: right;font-size: 16px"/>
                        </div>
                        <div class="box-body" style="padding-bottom: 40px">

                            <div class="col-md-6" style="padding-left: 0px; padding-right: 0px">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Center name:</label><p style="float: right" id="txtHint"></p>

                                        <input type="text" class="form-control my-colorpicker1" id="cname" name="cname" placeholder="Enter center name">

                                    </div>
                                </div>
                                <div class="form-group">

                                </div>
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Less com amount:</label>

                                        <input type="text" class="form-control my-colorpicker1" id="lamount" name="lamount" placeholder="Enter center name">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6" style=" padding-right: 0px">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Center Number</label>
                                        <input type="hidden" class="form-control my-colorpicker1" id="com" name="com" disabled>
                                        <input type="text" class="form-control my-colorpicker1" id="cnumber" name="cnumber" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Not run amount:</label>

                                        <input type="text" class="form-control my-colorpicker1" id="namount" name="namount" placeholder="Enter center name">
                                    </div>
                                </div>
                            </div>

                            <!-- /////////////////////////-->
                            <div class="col-md-12" style="padding:15px 15px 15px 15px;background-color: #f0f0f0">
                                <div class="col-md-3" style="padding-left: 0px;width: 145px">
                                    <div class="form-group">
                                        <label style="color: #0066cc">Chit number</label>
                                        <input type="text" name="chtnumber" style="color: black" id="chtnumber" class="form-control" placeholder="Select timebag">
                                    </div>
                                </div>
                                <div class="col-md-3"style="width:145px;padding-left: 0px;padding-right: 0px;margin-left: -15px">
                                    <div class="form-group">
                                        <label style="color: #0066cc">Amount</label>
                                        <input type="text" id="amount" name="amount" class="form-control" style="font-size: 20px;">
                                    </div>
                                </div>

                                <div class="col-md-3"style="width:140px;padding-left: 0px;padding-right: 0px">
                                    <div class="form-group">
                                        <label style="color: #0066cc">Payment</label>
                                        <input type="text" id="payment" name="payment"style="font-size: 16px;" class="form-control" >
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

                                <!-- /////////////////////////-->
                                <table id="addressesTable"  class="table-style-three"   width='100%' style="padding: 10px 10px 10px 10px" >
                                    <tr>
                                        <th>select</th>
                                        <th>chit number</th>
                                        <th>amount</th>
                                        <th>payment</th>
                                        <th>action</th>
                                    </tr>

                                    <tr hidden>
                                    <input type="hidden"  id="rowcount" name="rowcount" />
                                    <td ><input type="checkbox" name="chk"/></td>

                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="houseNum[0]" /></td>
                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="city[0]" /></td>
                                    <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="country[0]"   /></td>
                                    <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                    </tr>
                                </table>

                            </div>


                            <div class="col-md-12 " style="padding-left: 0px;padding-right: 0px;padding-top: 10px;">

                            </div>
                            <div id="myDiv"></div>
                            <div class="col-md-12 " style="height: 200px">

                                <table>
                                    <tr style="border-top: 1px solid">
                                        <td style="width: 500px;"><label>Full collection :</label></td>
                                        <td > <input type="text" style="font-size:  20px;border:none;width: 130px" readonly  id="fc" name="fc" value="0.00"/></td>
                                        <td style="width: 100px"><label >Payment Total</label></td>
                                        <td ><input type="text" style="font-size:  27px;border:none;width: 120px;font-weight: bold;color: #0000ff;text-align: right" readonly  id="paymentTotal" name="paymentTotal" value="0.00"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px"><label>LC & NC amount :</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 130px" readonly  id="lcnc" name="lcnc" value="0.00" value="0.00"/></td> 
                                        <td style="width: 170px"><label >commision value</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="paycoms" name="paycoms" value="0.00"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px"><label>Paper cash :</label></td >
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 130px" readonly  id="papercash" name="papercash" value="0.00"/></td> 
                                        <td style="width: 150px"><label>Expenses :</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exp" name="exp" value="0.00"/></td>
                                    </tr><tr>
                                        <td style="width: 200px"><label>Loan:</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 130px" readonly  id="loan" name="loan" placeholder="0.00"/></td> 
                                        <td style="width: 150px"><label>Excess :</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exc" name="exc" value="0.00"/></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 200px"><label>Passed due:</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 130px" readonly  id="pd" name="pd" placeholder="0.00"/></td> 
                                        <td style="width: 150px"><label>Cash :</label></td>
                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="cash" name="cash" value="0.00"/></td>
                                    </tr>

                                    <tr style="border-top: 1px solid">
                                        <td style="width: 200px"><label>due sub total:</label></td>
                                        <td ><input type="text" style="font-size:  20px;font-weight: bold;border:none;width: 130px" readonly  id="duesub" name="duesub" placeholder="0.00"/></td> 
                                        <td style="width: 150px"><label>pay sub total :</label></td>
                                        <td ><input type="text" style="width: 120px;font-size:  20px;font-weight: bold;border: none;text-align: right;" readonly  id="paysub" name="paysub" value="0.00"/></td>
                                    </tr>
                                    <tr  style="border-top: 1px solid;">
                                        <td colspan="2" ></td>
                                        <td  style="width: 150px;font-size:  25px;border-bottom: 2px solid"><label>Balance :</label></td>
                                        <td style="border-bottom: 2px solid;"><input type="text" style="width: 120px;font-size:  35px;font-weight: bold;border: none;text-align: right;" readonly  id="balance" name="balance" value="0.00"/></td>
                                    </tr >
                                </table>

                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-info" onclick="doajax();" value="Add summery" name="Add"/>

                        <!-- <button type="submit" name="submit" class="btn btn-info">
                             <i class="glyphicon glyphicon-save"></i>
                             Submit</button>
                         <button type="reset" name="reset" class="btn btn-primary">
                             <i class="glyphicon glyphicon-trash"></i>
                             Clear</button>-->
                    </div>

                    <!-- /.col (left) -->

                </form>
            </div>

        </section>
    </body>
</html>
