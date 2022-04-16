<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="serviceinventory.aspx.cs" Inherits="Salon_Management.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Service Inventory</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="serviceinventory.aspx">Service Invetory</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-12 py-5 px-5">
                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Service Inventory
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <center>
                                        <asp:Image ID="Image1" CssClass="img-fluid rounded-circle" Width="150px" runat="server" ImageUrl='<%# Eval("service_img") %>' />

                                    </center>
                                </div>
                                
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
                                        <asp:Label ID="Label4" runat="server" Text="Package Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="PackageName" runat="server" CssClass="form-control" placeholder="Service Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                <br />

                                <div class="row">
                                    <div class="col-4">
                                        <asp:Label ID="Label8" runat="server" Text="Quality Type"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList CssClass="form-control" ID="Quality" runat="server">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem>Premium</asp:ListItem>
                                                <asp:ListItem>Classic</asp:ListItem>
                                                <asp:ListItem>Basic</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Service Image"></asp:Label>
                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="Label6" runat="server" Text="Service Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList CssClass="form-control" ID="SerName" runat="server">
                                            </asp:DropDownList>
                                        </div>

                                        <br />

                                        <asp:Label ID="Label9" runat="server" Text="Cost"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="Cost" runat="server" CssClass="form-control" placeholder="Cost " TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:Label ID="Label7" runat="server" Text="Service Category"></asp:Label>
                                        <div class="form-group">
                                            <asp:ListBox CssClass="form-control py-4" ID="ServiceCat" runat="server" SelectionMode="Multiple">
                                                <asp:ListItem Selected="False">Hair</asp:ListItem>
                                                <asp:ListItem>Beard Shave</asp:ListItem>
                                                <asp:ListItem>Massage</asp:ListItem>
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="Label11" runat="server" Text="Service Description"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="ServiceDesc" placeholder="Description" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col">
                                        <div class="d-grid gap-2 d-md-block">
                                            <asp:Button class="btn btn-dark btn-block btn-lg" ID="Add" runat="server" Text="Add" OnClick="Add_Click" Width="110px" Visible="true" />
                                            <asp:Button class="btn btn-dark btn-block btn-lg" ID="Update" runat="server" Text="Update" OnClick="Update_Click" Width="110px" Visible="false" />
                                            <asp:Button class="btn btn-dark btn-block btn-lg" ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" Width="110px" Visible="false" />
                                        </div>
                                    </div>

                                </div>



                                <br />

                                <div class="form-group">
                                    <asp:LinkButton ID="Home" runat="server" Style="text-decoration: none !important" OnClick="Home_Click"><< Back To Home Page</asp:LinkButton>
                                </div>

                            </div>
                            <br />


                        </div>

                    </div>

                    <br />

                    <div class="col-md-12 py-5 px-5">

                        <div class="card mx-auto  bg-white rounded">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Service List
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [service_inventory]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="service_id" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" ViewStateMode="Enabled">
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
                                                        <asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%# Eval("service_id") %>' CssClass="btn" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="service_idLabel" runat="server" Text='<%# Eval("service_id") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="package_nameLabel" runat="server" Text='<%# Eval("package_name") %>' />
                                                    </td>                                                    
                                                    <td>
                                                        <asp:Label ID="service_categoryLabel" runat="server" Text='<%# Eval("service_category") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="quality_typeLabel" runat="server" Text='<%# Eval("quality_type") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="service_costLabel" runat="server" Text='<%#string.Concat("&#x20B9", " ", Eval("service_cost")) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="service_descLabel" runat="server" Text='<%# Eval("service_desc") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="Image1" CssClass="img-fluid" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("service_img") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table id="datatablesSimple" class="table no-margin">
                                                    <thead>
                                                        <tr runat="server" style="">
                                                            <th runat="server">View</th>
                                                            <th runat="server">service_id</th>
                                                            <th runat="server">package_name</th>
                                                            <th runat="server">service_category</th>
                                                            <th runat="server">quality_type</th>
                                                            <th runat="server">service_cost</th>
                                                            <th runat="server">service_desc</th>
                                                            <th runat="server">service_img</th>
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
