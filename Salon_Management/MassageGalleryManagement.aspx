<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MassageGalleryManagement.aspx.cs" Inherits="Salon_Management.MassageGalleryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Massage Gallery Management</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="MassageGalleryManagement.aspx">Massage Gallery Management</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Massage Gallery Management
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <center>
                                        <asp:Image ID="Image1" CssClass="img-fluid" Width="250px" runat="server" ImageUrl='<%# Eval("hair_image") %>' />
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
                                        <asp:Label ID="Label3" runat="server" Text="Image ID"></asp:Label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="MassageImgId" runat="server" CssClass="form-control" placeholder="Image ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <asp:Label ID="Label4" runat="server" Text="Image Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="MassageImgName" runat="server" CssClass="form-control" placeholder="Image Name"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col">
                                        <div class="d-grid gap-2 d-md-block">
                                            <asp:Button class="btn btn-dark btn-lg btn-block" ID="Add" runat="server" Text="Add" Visible="true" OnClick="Add_Click" />
                                            <asp:Button class="btn btn-dark btn-lg btn-block " ID="Update" runat="server" Text="Update" Visible="false" OnClick="Update_Click" />
                                            <asp:Button class="btn btn-dark btn-lg btn-block " ID="Delete" runat="server" Text="Delete" Visible="false" OnClick="Delete_Click" />
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <div class="form-group">
                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="text-decoration: none !important"><< Back</asp:LinkButton>
                                </div>

                            </div>
                            <br />


                        </div>

                    </div>


                    <div class="col-md-7">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Massage Gallery Management List
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [massage_gallery]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="massageimg_id" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" ViewStateMode="Enabled">

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
                                                        <asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%# Eval("massageimg_id") %>' CssClass="btn" />
                                                    </td>
                                                    <td>
                                                        <%# Eval("massageimg_id") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("massageimg_name") %>
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="Image2" CssClass="img-fluid" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("massage_image") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="datatablesSimple" class="table no-margin">
                                                    <thead>
                                                        <tr>
                                                            <th runat="server">View</th>
                                                            <th runat="server">Image ID</th>
                                                            <th runat="server">Image Name</th>
                                                            <th runat="server">Image</th>
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
                        </div>

                    </div>

                </div>


            </div>
        </main>
</asp:Content>
