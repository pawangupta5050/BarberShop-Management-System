<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="StylistManagement.aspx.cs" Inherits="Salon_Management.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Stylist Management</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="StylistManagement.aspx">Stylist Management</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Stylist Management
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <center>
                                        <asp:Image ID="Image1" CssClass="img-fluid rounded-circle" Width="150px" runat="server" ImageUrl='<%# Eval("stylist_img") %>' />

                                    </center>
                                </div>
                                
                                <div class="row">
                                    <div class="col">
                                        <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Label ID="Label3" runat="server" Text="Stylist ID"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="StylistId" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <asp:Label ID="Label4" runat="server" Text="Stylist Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="StylistName" runat="server" CssClass="form-control" placeholder="Stylist Name"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label5" runat="server" Text="Enter Email"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label2" runat="server" Text="Create Password"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Create Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label1" runat="server" Text="Stylist Description"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="StylistDesc" runat="server" CssClass="form-control" placeholder="Stylist Description" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col">
                                        <div class="d-grid gap-2 d-md-block">
                                        <asp:Button class="btn btn-dark btn-lg btn-block" ID="Add" runat="server" Text="Add" OnClick="Add_Click" Visible="true" />
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
                                Stylist List
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [stylist_management]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="stylist_id" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" ViewStateMode="Enabled" >

                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>No data was returned.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>

                                            <ItemTemplate>
                                                <tr style="">
                                                    <td>
                                                        <asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%# Eval("stylist_id") %>' CssClass="btn" />
                                                    </td>
                                                    <td>
                                                        <%# Eval("stylist_id") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("stylist_name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("stylist_desc") %>
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="Image1" CssClass="img-fluid" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("stylist_img") %>' />
                                                        
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="datatablesSimple" class="table no-margin">
                                                    <thead>
                                                        <tr>
                                                            <th runat="server">View</th>
                                                            <th runat="server">stylist_id</th>
                                                            <th runat="server">stylist_name</th>
                                                            <th runat="server">stylist_desc</th>
                                                            <th runat="server">stylist_img</th>
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
