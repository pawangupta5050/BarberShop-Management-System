<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="Salon_Management.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Appointments</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="Appointment.aspx">Appointment</a></li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Appointment List
                    </div>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <div class="card-body">
                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
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
                                        <asp:Label ID="choosen_timeLabel" runat="server" Text='<%# Eval("choosen_time","{0:HH:mm}") %>'  />
                                    </td>
                                    <td>
                                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="appointment_dateLabel" runat="server" Text='<%# Eval("appointment_date","{0:MM/dd/yyyy}") %>' />
                                    </td>
                                    <td>
                                        <div class="row px-3 py-1">
                                            <asp:LinkButton runat="server" Visible="true" ID="btnAccept" Text="Accept" CommandName="accept" CommandArgument='<%# Eval("appointment_id") %>' CssClass="btn btn-sm btn-success" />
                                        </div>
                                        <asp:Label ID="Done" runat="server" Visible="false" Text="Done" Font-Bold="true" ></asp:Label>
                                        <div class="row px-3">
                                            <asp:LinkButton runat="server" Visible="true" ID="btnReject" Text="Reject" CommandName="reject" CommandArgument='<%# Eval("appointment_id") %>' CssClass="btn btn-sm btn-danger" />
                                        </div>
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
                                            <th runat="server">Status</th>
                                            <th runat="server">Date</th>
                                            <th runat="server">Update</th>
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
