<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="servicemanagement.aspx.cs" Inherits="Salon_Management.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Service Management</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="servicemanagement.aspx">Service Management</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Service Management
                            </div>
                            <div class="card-body">
                               
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Label ID="Label3" runat="server" Text="Service ID"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="ServiceId" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <asp:Label ID="Label4" runat="server" Text="Service Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="ServiceName" runat="server" CssClass="form-control" placeholder="Service Name"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label1" runat="server" Text="Service Description"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="ServiceDesc" runat="server" CssClass="form-control" placeholder="Service Description" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col">
                                        <div class="d-grid gap-2 d-md-block">
                                        <asp:Button class="btn btn-dark btn-lg btn-block" ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
                                        <asp:Button class="btn btn-dark btn-lg btn-block " ID="Update" runat="server" Text="Update" OnClick="Update_Click" Visible="false" />
                                        <asp:Button class="btn btn-dark btn-lg btn-block " ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" Visible="false" />

                                        </div>
                                    </div>
                                </div>
    <br />
                                <div class="form-group">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="text-decoration: none !important"><< Back To Home Page</asp:LinkButton>
                                </div>

                            </div>
                            <br />


                        </div>

                    </div>


                    <div class="col-md-7">

                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Service Management
                            </div>
                            <div class="card-body">
                                
                                <div class="row my-3">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [service_management]"></asp:SqlDataSource>
                                    <div class="col table-responsive">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="service_id" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" ViewStateMode="Enabled" >

                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>NO RECORDS</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%# Eval("service_id") %>' CssClass="btn" />

                                                    </td>
                                                    <td><%# Eval("service_id") %></td>
                                                    <td><%# Eval("service_name") %></td>
                                                    <td><%# Eval("service_desc") %></td>

                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="datatablesSimple" class="table no-margin">
                                                    <thead>
                                                        <tr>
                                                            <th runat="server">View</th>
                                                            <th runat="server">Service ID</th>
                                                            <th runat="server">Service Name</th>
                                                            <th runat="server">Service Desc</th>
                                                        </tr>
                                                    </thead>
                                                    <tr id="itemPlaceholder" runat="server"></tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </div>
                                </div>



                            </div>
                        </div>

                    </div>

                </div>


            </div>

        </main>
</asp:Content>
