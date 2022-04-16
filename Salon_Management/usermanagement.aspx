<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="usermanagement.aspx.cs" Inherits="Salon_Management.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>

            <div class="container-fluid my-4">
                <h1 class="mt-4">User Management</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="usermanagement.aspx">User Management</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                User Management
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <center>
                                        <asp:Image ID="Image1" CssClass="img-fluid rounded-circle" Width="150px" runat="server" ImageUrl='<%# Eval("user_img") %>' />
                                    </center>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="Label3" runat="server" Text="User ID"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="UserId" runat="server" CssClass="form-control" placeholder="ID" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <asp:Label ID="Label2" runat="server" Text="Account Status"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="Status" runat="server" CssClass="form-control" placeholder="Status" ReadOnly="True"></asp:TextBox>

                                                <asp:LinkButton class="input-group-text btn-success" ID="premium" runat="server" Visible="false" OnClick="premium_Click"><i class="fas fa-chess-king"></i></asp:LinkButton>
                                                <asp:LinkButton class="input-group-text btn-warning" ID="gold" runat="server" Visible="false" OnClick="gold_Click"><i class="fas fa-crown"></i></asp:LinkButton>
                                                <asp:LinkButton class="input-group-text btn-danger" ID="classic" runat="server" Visible="false" OnClick="classic_Click"><i class="fab fa-black-tie"></i></asp:LinkButton>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-3">
                                        <asp:Label ID="Label5" runat="server" Text="Date Of Birth"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="DOB" runat="server" CssClass="form-control" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-4">
                                        <asp:Label ID="Label6" runat="server" Text="Contact No."></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="CNumber" runat="server" CssClass="form-control" placeholder="Contact No." ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <asp:Label ID="Label7" runat="server" Text="Email ID"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="ID" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <asp:Label ID="Label8" runat="server" Text="State"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="State" runat="server" CssClass="form-control" placeholder="State" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-4">
                                        <asp:Label ID="Label9" runat="server" Text="City"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="City" runat="server" CssClass="form-control" placeholder="City" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <asp:Label ID="Label10" runat="server" Text="Pincode"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Pincode" runat="server" CssClass="form-control" placeholder="Pincode" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label1" runat="server" Text="Full Postal Address"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Address" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col d-grid">
                                        <asp:Button class="btn btn-dark btn-lg btn-block" ID="delete" runat="server" Text="Delete User Permanently" OnClick="delete_Click" Visible="false" />
                                    </div>

                                </div>

                                <br />
                                <div class="form-group">
                                    <asp:LinkButton ID="Back" runat="server" Style="text-decoration: none !important"><< Back To Home Page</asp:LinkButton>
                                </div>

                            </div>
                        </div>

                    </div>


                    <div class="col-md-7">

                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                User List
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [user_details]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="user_id" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" ViewStateMode="Enabled">

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
                                                        <asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%# Eval("user_id") %>' CssClass="btn" />

                                                    </td>
                                                    <td>
                                                        <%# Eval("user_id") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_dob") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_contact") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_email") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_state") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_city") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_pincode") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_add") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("acc_status") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="datatablesSimple" class="table no-margin">
                                                    <thead>
                                                        <tr>
                                                            <th runat="server">View</th>
                                                            <th runat="server">ID</th>
                                                            <th runat="server">Name</th>
                                                            <th runat="server">DOB</th>
                                                            <th runat="server">Contact No</th>
                                                            <th runat="server">Email</th>
                                                            <th runat="server">State</th>
                                                            <th runat="server">City</th>
                                                            <th runat="server">Pincode</th>
                                                            <th runat="server">Address</th>
                                                            <th runat="server">User Status</th>
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
