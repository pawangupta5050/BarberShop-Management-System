<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Salon_Management.WebForm18" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Notifications</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="Notifications.aspx">Notifications</a></li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Notification list
                    </div>
                    <div class="card-body">
                        <asp:ListView ID="ListView1" runat="server">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No Notifications.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>

                                <div class="container py-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="Appointment.aspx">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <asp:Label ID="NotDate" runat="server" Text='<%# Eval("Date","{0:MM/dd/yyyy}") %>' CssClass="badge rounded-pill bg-info"></asp:Label>
                                                        </div>
                                                        <div class="col-md-8">
                                                            An Appointment has been booked by <%# Eval("CustomerName") %>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <small><asp:Label ID="status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                               </small>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <small><%# Eval("Date","{0: h:mm tt}") %></small>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="dropdown-divider"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

        </main>
</asp:Content>
