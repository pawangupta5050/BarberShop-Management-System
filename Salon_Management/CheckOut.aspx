<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Salon_Management.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5">
        <div class="container">
            <div class="row">
                <aside class="col-lg-8">
                    <!-- ============================ COMPONENT REVIEW CART ================================= -->
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <div class="card">
                        <article class="card-body">
                            <h4 class="card-title">Booking Details</h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="itemside mb-4">
                                                <div class="aside">
                                                    <asp:Image ID="Image1" runat="server" class="border img-fluid rounded" Height="100" Width="100" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <h3>
                                                <asp:Label ID="lblServicename" runat="server"></asp:Label></h3>
                                        </div>
                                    </div>

                                    <div class="col-md-12">

                                        <div class="info">
                                            <h5>Service Description:</h5>
                                            <p>
                                                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                            </p>
                                            <h5 class="pt-3">Actual Price:
                                                <small><span class="text-decoration-line-through">&#x20B9
                                                <asp:Label ID="lblDeclinedCost" runat="server"></asp:Label>.00 </span></small>

                                            </h5>
                                            <br>
                                            <h5>Offer Price: 
                                                <small>
                                                    <strong class="price">&#x20B9
                                                <asp:Label ID="lblCost" runat="server"></asp:Label>.00</strong>
                                                </small>
                                            </h5>

                                            <br />
                                            Selected Stylist :
                                                <strong class="price">
                                                    <asp:Label ID="lblStylist" runat="server"></asp:Label></strong>
                                            <br />
                                            Selected Date :
                                               <strong class="price">
                                                   <asp:Label ID="lblChoosenDate" runat="server"></asp:Label></strong>
                                            <br />
                                            Selected Time :
                                               <strong class="price">
                                                   <asp:Label ID="lblTime" runat="server"></asp:Label></strong>
                                            <br />
                                        </div>

                                    </div>

                                </div>
                                <!-- col.// -->

                            </div>
                            <!-- row.// -->

                        </article>
                        <!-- card-body.// -->
                        <article class="card-body border-top">
                            <asp:LinkButton ID="LinkButton1" class="btn btn-light" runat="server"><i class="fa fa-arrow-left me-2"></i>View Product</asp:LinkButton>

                            <table style="max-width: 360px" class="table table-sm float-lg-end">
                                <tbody>
                                    <tr>
                                        <td>Subtotal : </td>
                                        <td>&#x20B9 
                                            <asp:Label ID="lblsubtotal" runat="server"></asp:Label>.00</td>

                                    </tr>
                                    <tr>
                                        <td>Service charges: </td>
                                        <td><span>&#x20B9 120.00</span></td>

                                    </tr>
                                    <tr>
                                        <td>Total: </td>
                                        <td><strong class="h5 price">&#x20B9
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>.00</strong> </td>

                                    </tr>

                                </tbody>

                            </table>

                        </article>
                        <!-- card-body.// -->

                    </div>
                    <!-- card.// -->
                    <!-- =================== COMPONENT REVIEW CART .// =================== -->

                </aside>
                <!-- col.// -->
                <aside class="col-lg-4">
                    <!-- =================== COMPONENT DROPDOWN =================== -->
                    <div class="card">
                        <div class="card-body">
                            <div class="dropdown">
                                <a href="#" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Book Service </a>
                                <div class="dropdown-menu p-3 dropdown-menu-end" style="min-width: 300px;">
                                    <div class="itemside mb-3">
                                        <div class="aside">
                                            <asp:Image ID="Image2" runat="server" class="border img-fluid rounded" Height="100" Width="100" />
                                        </div>
                                        <div class="info">
                                            <a href="#" class="title">
                                                <asp:Label ID="lblServicename2" runat="server"></asp:Label></a>
                                            <div class="price text-muted">cost: 
                                                &#x20B9
                                                <asp:Label ID="lblCost2" runat="server"></asp:Label>.00
                                            </div>
                                            <div class="price text-muted">Service Charge: 
                                                &#x20B9
                                                <asp:Label ID="ServiceChargeDrp" runat="server">120</asp:Label>.00
                                            </div>
                                            <!-- price .// -->
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="my-3">
                                        Total: <strong class="float-end price">&#x20B9
                                            <asp:Label ID="lblTotal2" runat="server"></asp:Label>.00</strong>

                                    </div>
                                    <asp:Button ID="Appointment" runat="server" class="btn btn-success w-100" Text="Book Appointment" OnClick="Appointment_Click" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                                <!-- drowpdown-menu.// -->

                            </div>
                            <!-- dropdown.// -->

                        </div>
                        <!-- card-body.// -->

                    </div>
                    <!-- card.// -->
                    <!-- =================== COMPONENT DROPDOWN .//END =================== -->

                </aside>
                <!-- col.// -->
            </div>
        </div>
    </section>
</asp:Content>
