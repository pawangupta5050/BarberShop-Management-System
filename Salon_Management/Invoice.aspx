<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Salon_Management.Invoice" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstarp/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <style>
        body {
            background-color: #F6F6F6;
        }

        .brandSection {
            border: 1px solid #417482;
        }

        .headerLeft h1 {
            color: #fff;
            margin: 0px;
            font-size: 28px;
        }

        .header {
            border-bottom: 2px solid #417482;
            padding: 10px;
        }

        .headerRight p {
            margin: 0px;
            font-size: 10px;
            color: #88CFE3;
            text-align: right;
        }

        .contentSection {
            background-color: #fff;
            padding: 0px;
        }

        .content {
            background-color: #fff;
            padding: 20px;
        }

            .content h1 {
                font-size: 22px;
                margin: 0px;
            }

            .content p {
                margin: 0px;
                font-size: 11px;
            }

            .content span {
                font-size: 11px;
                color: #F2635F;
            }

        .panelPart {
            background-color: #fff;
        }

        .panel-body {
            background-color: #3BA4C2;
            color: #fff;
            padding: 5px;
        }

        .panel-footer {
            background-color: #fff;
        }

            .panel-footer h1 {
                font-size: 20px;
                padding: 15px;
                border: 1px dotted #DDDDDD;
            }

            .panel-footer p {
                font-size: 13px;
                background-color: #F6F6F6;
                padding: 5px;
            }

        .tableSection {
            background-color: #fff;
        }

            .tableSection h1 {
                font-size: 18px;
                margin: 0px;
            }

        th {
            text-decoration-color: black;
        }

        .table {
            padding-bottom: 10px;
            margin: 0px;
            border: 1px solid #DDDDDD;
        }

        td:nth-child(2) {
            text-align: left;
        }

        td {
            height: 100%;
        }

        .bg {
            background-color: #f00;
            width: 100%;
            height: 100%;
            display: block;
        }

        .lastSectionleft {
            background-color: #fff;
            padding-top: 20px;
        }

        .Sectionleft p {
            border: 1px solid #DDDDDD;
            height: 140px;
            padding: 5px;
        }

        .Sectionleft span {
            color: #42A5C5;
        }

        .lastPanel {
            text-align: center;
        }

        .panelLastLeft p, .panelLastRight p {
            font-size: 11px;
            padding: 5px 2px 5px 10px;
        }
    </style>
    <script type="text/javascript">
        function PrintPanel() {
            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
      </script>
</head>
<body onload="window.print()">
    <script src="bootstarp/JS/bootstrap.bundle.min.js"></script>
    <form id="form1" runat="server">
        <div id="invoice">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 brandSection mx-auto">
                        <div class="row">
                            <div class="col header">
                                <div class="row">
                                    <div class="col">
                                        <h1 style="text-align: left; float: left;"><big><b>BS</b> BarberShop</big></h1>
                                        <p style="text-align: right; float: right;">
                                            www.bsbarbershop.com<br />
                                            customercare@barbershop.com<br />
                                            (+91) 797 725 5555
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 content">
                                <h1>Appointment ID
                                    <asp:Label ID="AppId" runat="server" Text="AppointmentID" CssClass="fs-3" ForeColor="Black" Font-Size="XX-Small"></asp:Label></h1>
                                <p>
                                    <asp:Label ID="Date" runat="server" Text="DateTime" CssClass="fs-5" ForeColor="Black"></asp:Label>
                                </p>
                                <span>Your Appointment Date is
                                    <asp:Label ID="AppDate" runat="server" Text="AppointmentDate"></asp:Label>
                                    and the time is
                                    <asp:Label ID="AppTime" runat="server" Text="AppointmentTime"></asp:Label>
                                </span>
                                <br />
                                <span>Pay The Amount to the Cashier at the reception
                                </span>
                            </div>
                            <div class="col-md-12 col-sm-12 panelPart">
                                <div class="row">
                                    <div class="col">
                                        <p style="text-align: left; float: left;">
                                            <asp:Label ID="lblFrom" runat="server" Text="From" Font-Bold="true"></asp:Label><br />
                                            BS BarberShop<br />
                                            Sai complex,<br />
                                            Mulund East,<br />
                                            Mumbai 400081.
                                        </p>

                                        <p style="text-align: right; float: right;">
                                            <asp:Label ID="lblTo" runat="server" Text="To" style="text-align: left; float: left;" CssClass="pe-5" Font-Bold="true"></asp:Label><br />
                                            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label> <br />
                                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label><br />
                                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
                                            <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
                                        </p>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 tableSection">
                                <h1>Service Details</h1>
                                <br />
                                <table class="table table-bordered ">
                                    <thead>
                                        <tr class="tableHead">
                                            <th style="width: 30px;">No.</th>
                                            <th>Description</th>
                                            <th style="width: 100px;">Cost</th>
                                            <th style="width: 100px;">TOTAL</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <asp:Label ID="lblService" runat="server" Text="Service Name"></asp:Label></td>
                                            <td>&#x20B9
                                                <asp:Label ID="lblCost" runat="server" Text="Cost"></asp:Label></td>
                                            <td>&#x20B9
                                                <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="width: 100px; text-align: right; border-bottom: hidden; border-left: hidden"></td>
                                            <td>SUBTOTAL
                                            </td>
                                            <td>&#x20B9
                                                <asp:Label ID="lblSubTotal" runat="server" Text="Subtotal"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="width: 100px; text-align: right; border-bottom: hidden; border-left: hidden"></td>
                                            <td>SERVICE CHARGE
                                            </td>
                                            <td>&#x20B9
                                                <asp:Label ID="lblServiceCharge" runat="server" Text="ServiceCharge"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="width: 100px; text-align: right; border-bottom: hidden; border-left: hidden"></td>
                                            <td>TOTAL
                                            </td>
                                            <td>
                                                <strong>&#x20B9
                                                    <asp:Label ID="lblFinalTotal" runat="server" Text="Total"></asp:Label></strong>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12 col-sm-12 lastSectionleft ">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 Sectionleft">
                                        <p>
                                            <i>Dear
                                                <asp:Label ID="lblCustomerName" runat="server" Text="CustomerName"></asp:Label>,<br />
                                                We are delighted to tell you that you have
                                            now been our customer. We would just like to
                                            say thank you for being a part of BS BarberShop  family.
                                            We are very grateful for your continued patronage because we wouldn’t
                                            be here without loyal customers like you.<br />
                                                ~ Your friends at BS BarberShop

                                            </i>
                                        </p>
                                        <span><i>Thank You! for booking appointment at BS BarberShop</i> </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
