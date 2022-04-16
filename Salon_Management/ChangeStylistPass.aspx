<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ChangeStylistPass.aspx.cs" Inherits="Salon_Management.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Change Password</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="ChangeStylistPass.aspx">Change Password</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Change Password
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-5">
                                        <asp:Label ID="Label3" runat="server" Text="Userame"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-id-badge"></i></span>
                                                <asp:TextBox ID="AdminUsername" runat="server" CssClass="form-control" placeholder="Username" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <asp:Label ID="Label4" runat="server" Text="Stylist Name"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user-cog"></i></span>
                                                <asp:TextBox ID="StylistName" runat="server" CssClass="form-control" placeholder="Admin Name" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Name" runat="server" Text="Password"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                <asp:TextBox ID="StylistPass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label1" runat="server" Text=" Change Password"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                <asp:TextBox ID="StChngPass" runat="server" CssClass="form-control" placeholder="Change Password" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <div class="d-grid gap-2 d-md-block">
                                            <asp:Button class="btn btn-dark btn-lg btn-block " ID="Change" runat="server" Text="Change" OnClick="Update_Click" />
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <div class="form-group">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="text-decoration: none !important"><< Back</asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </main>
</asp:Content>
