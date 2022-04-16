<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AppointmentReport.aspx.cs" Inherits="Salon_Management.WebForm15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Appointments</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / Appointment Report</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Report Date:
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-3">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="From:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="FromDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="To:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="ToDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Category" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                        <asp:ListItem>Accepted</asp:ListItem>
                                        <asp:ListItem>Rejected</asp:ListItem>
                                        <asp:ListItem>pending</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group pt-4">
                                    <asp:Button ID="GetData" runat="server" Text="Get Data" CssClass="btn btn-primary" OnClick="GetData_Click" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Appointment Report
                    </div>
                    <div class="card-body">
                        <asp:ListView ID="ListView1" runat="server" Visible="false">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No Appointments</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Label ID="appointment_idLabel" runat="server" Text='<%# Eval("appointment_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="package_idLabel" runat="server" Text='<%# Eval("package_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="package_nameLabel" runat="server" Text='<%# Eval("package_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="stylist_idLabel" runat="server" Text='<%# Eval("stylist_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="stylist_nameLabel" runat="server" Text='<%# Eval("stylist_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="customer_idLabel" runat="server" Text='<%# Eval("customer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="custome_nameLabel" runat="server" Text='<%# Eval("customer_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="service_costLabel" runat="server" Text='<%# string.Concat("&#x20B9", " ", Eval("service_cost")) %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="choosen_dateLabel" runat="server" Text='<%# Eval("choosen_date","{0:MM/dd/yyyy}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="choosen_timeLabel" runat="server" Text='<%# Eval("choosen_time","{0:HH:mm}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="appointment_dateLabel" runat="server" Text='<%# Eval("appointment_date","{0:MM/dd/yyyy}") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="datatablesSimple" class="table no-margin">
                                    <thead>
                                        <tr runat="server" style="">
                                            <th runat="server">ID</th>
                                            <th runat="server">Package ID</th>
                                            <th runat="server">Package Name</th>
                                            <th runat="server">Stylist ID</th>
                                            <th runat="server">Stylist Name</th>
                                            <th runat="server">Customer ID</th>
                                            <th runat="server">Customer Name</th>
                                            <th runat="server">Cost</th>
                                            <th runat="server">Choosen Date</th>
                                            <th runat="server">Time</th>
                                            <th runat="server">Date</th>
                                        </tr>
                                    </thead>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ListView ID="ListView2" runat="server">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No Appointments</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Label ID="appointment_idLabel" runat="server" Text='<%# Eval("appointment_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="package_idLabel" runat="server" Text='<%# Eval("package_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="package_nameLabel" runat="server" Text='<%# Eval("package_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="stylist_idLabel" runat="server" Text='<%# Eval("stylist_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="stylist_nameLabel" runat="server" Text='<%# Eval("stylist_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="customer_idLabel" runat="server" Text='<%# Eval("customer_id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="custome_nameLabel" runat="server" Text='<%# Eval("customer_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="service_costLabel" runat="server" Text='<%# string.Concat("&#x20B9", " ", Eval("service_cost")) %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="choosen_dateLabel" runat="server" Text='<%# Eval("choosen_date","{0:MM/dd/yyyy}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="choosen_timeLabel" runat="server" Text='<%# Eval("choosen_time","{0:HH:mm}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="appointment_dateLabel" runat="server" Text='<%# Eval("appointment_date","{0:MM/dd/yyyy}") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="datatablesSimple" class="table no-margin">
                                    <thead>
                                        <tr runat="server" style="">
                                            <th runat="server">ID</th>
                                            <th runat="server">Package ID</th>
                                            <th runat="server">Package Name</th>
                                            <th runat="server">Stylist ID</th>
                                            <th runat="server">Stylist Name</th>
                                            <th runat="server">Customer ID</th>
                                            <th runat="server">Customer Name</th>
                                            <th runat="server">Cost</th>
                                            <th runat="server">Choosen Date</th>
                                            <th runat="server">Time</th>
                                            <th runat="server">Date</th>
                                        </tr>
                                    </thead>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

        </main>
</asp:Content>
