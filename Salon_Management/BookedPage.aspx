<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookedPage.aspx.cs" Inherits="Salon_Management.BookedPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .steps-wrap .step {
            width: 100%;
            text-align: center;
            position: relative;
            flex-grow: 1;
            font-size: 14px;
            line-height: 24px;
        }
        li {
            display: list-item;
        }

        .steps-wrap {
            list-style: none;
            margin: 0;
            padding: 0;
            margin-top: 30px;
            position: relative;
            display: flex;
            border-radius: 30px;
        }

        ul {
            list-style-type: disc;
        }

    </style>
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5 px-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <!-- ============== COMPONENT FINAL =============== -->
                    <article class="card py-5">
                        <div class="card-body">
                            <div class="mt-4 mx-auto text-center" style="max-width: 600px">
                                <svg width="96px" height="96px" viewBox="0 0 96 96" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g id="round-check">
                                            <circle id="Oval" fill="#D3FFD9" cx="48" cy="48" r="48">
                                            </circle>
                                            <circle id="Oval-Copy" fill="#87FF96" cx="48" cy="48" r="36">
                                            </circle>
                                            <polyline id="Line" stroke="#04B800" stroke-width="4" stroke-linecap="round" points="34.188562 49.6867496 44 59.3734993 63.1968462 40.3594229">
                                            </polyline>

                                        </g>

                                    </g>

                                </svg>
                                <div class="my-3">
                                    <h4>Thank you for Booking Appointment</h4>
                                    <br />
                                    <p>
                                      We are delighted to tell you that you have
                                            now been our customer. We would just like to
                                            say thank you for being a part of BS BarberShop  family.
                                    </p>

                                </div>

                            </div>
                            
                        </div>

                    </article>

                    <!-- ============== COMPONENT FINAL .// =============== -->

                </div>
                <!-- col.// -->
                <aside class="col-lg-4">
                    <!-- ============== COMPONENT RECEIPE =============== -->
                    <article class="card">
                        <div class="card-body">
                            <h5 class="card-title">Receipt </h5>
                            <div class="itemside mb-3">
                                
                                <div class="info lh-sm">
                                    <strong>Appointment ID: <asp:Label ID="lblAppointmentId" runat="server" Text="ID"></asp:Label></strong>
                                    <br>
                                    <span class="text-muted">
                                        <asp:Label ID="lblCurrentDate" runat="server" Text="Date"></asp:Label></span>

                                </div>

                            </div>
                            <dl class="dlist-align">
                                <dt>Service:</dt>
                                <dd><asp:Label ID="lblServiceName" runat="server" Text="Service Name"></asp:Label></dd>

                            </dl>
                            <dl class="dlist-align">
                                <dt>Billed to:</dt>
                                <dd><asp:Label ID="lblCustomerName" runat="server" Text="Name"></asp:Label></dd>

                            </dl>
                            <dl class="dlist-align">
                                <dt>Amount to be paid:</dt>
                                <dd><asp:Label ID="lblCost" runat="server" Text="Cost"></asp:Label></dd>

                            </dl>
                            <hr>
                            <asp:Button ID="Invoice" runat="server" Text="Download Slip" class="btn btn-light" OnClick="Invoice_Click" />

                        </div>

                    </article>
                    <!-- ============== COMPONENT RECEIPE .// =============== -->

                </aside>
                <!-- col.// -->

            </div>
        </div>
    </section>
</asp:Content>
