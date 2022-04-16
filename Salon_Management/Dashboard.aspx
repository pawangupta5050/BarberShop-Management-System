<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Salon_Management.WebForm14" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="DashboardIcons/inventory.png" class="img-fluid" />
                                            </div>
                                            <div class="col-8 text-right">
                                                <h1>
                                                    <big>
                                                        <asp:Label ID="services" runat="server" Text="8"></asp:Label>

                                                    </big>
                                                </h1>
                                                <h5>
                                                    <a href="serviceinventory.aspx">Total Services</a></h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="DashboardIcons/barber.png" class="img-fluid" />
                                            </div>
                                            <div class="col-8 text-right">
                                                <h1>
                                                    <big>
                                                        <asp:Label ID="stylist" runat="server" Text="8"></asp:Label>

                                                    </big>
                                                </h1>
                                                <h5>
                                                    <a href="StylistManagement.aspx">Total Stylist</a></h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="DashboardIcons/rating.png" class="img-fluid" />
                                            </div>
                                            <div class="col-8 text-right">
                                                <h1>
                                                    <big>
                                                        <asp:Label ID="user" runat="server" Text="8"></asp:Label>

                                                    </big>
                                                </h1>
                                                <h5>
                                                    <a href="usermanagement.aspx">Total Customers</a></h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="DashboardIcons/image-gallery.png" class="img-fluid" />
                                            </div>
                                            <div class="col-8 text-right">
                                                <h1>
                                                    <big>
                                                        <asp:Label ID="Label4" runat="server" Text="3"></asp:Label>

                                                    </big>
                                                </h1>
                                                <h5>
                                                    <a href="HairGalleryManagement.aspx">Total Gallery</a></h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="col">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-10">

                                                        <h4>RECENT APPOINTMENTS</h4>
                                                    </div>
                                                    <div class="col-2 text-end">
                                                        <a href="AppointmentReport.aspx" class="btn btn-primary">view all</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col px-3">
                                                        <hr />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col px-3">
                                                        <asp:ListView ID="ListView1" runat="server">
                                                            <EmptyDataTemplate>
                                                                <h3>NO APPOINTMENTS</h3>
                                                            </EmptyDataTemplate>
                                                            <ItemTemplate>
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col-md-2">
                                                                            <asp:Label ID="NotDate" runat="server" Text='<%# Eval("choosen_date","{0:dd/MM/yyyy}") %>' CssClass="badge rounded-pill bg-info"></asp:Label>
                                                                        </div>
                                                                        <div class="col-md-8">
                                                                            <small>
                                                                                <asp:Label ID="status" runat="server" Text='<%# Eval("package_name") %>'></asp:Label>
                                                                            </small>
                                                                        </div>
                                                                        <div class="col-md-2">

                                                                            <small><%# Eval("choosen_time","{0: h:mm tt}") %></small>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="dropdown-divider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <div class="col">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-9">

                                                        <h4>RECENT CUSTOMERS</h4>
                                                    </div>
                                                    <div class="col-3 text-end">
                                                        <a href="usermanagement.aspx" class="btn btn-primary">view all</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col px-3">
                                                        <hr />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col px-3">
                                                        <asp:ListView ID="ListView2" runat="server">
                                                            <EmptyDataTemplate>
                                                                <h3>NO CUSTOMERS
                                                                </h3>
                                                            </EmptyDataTemplate>
                                                            <ItemTemplate>
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col">

                                                                            <%# Eval("user_name") %>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="dropdown-divider"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
</asp:Content>
