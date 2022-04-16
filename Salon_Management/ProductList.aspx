<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Salon_Management.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col py-2">

                    <div class="section-heading text-center">
                        <h4>OUR <em>SERVICES</em></h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                    </div>
                    <center>
                        <asp:ListView ID="ListView1" runat="server" class="col-12" DataKeyNames="service_id" OnItemCommand="ListView1_ItemCommand">

                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="padding: 15px;">
                                        <div class="container-fluid px-4 my-3">
                                            <div class="row g-0 ">
                                                <aside class="col-xl-3 col-lg-4 col-md-12 col-12">
                                                    <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("service_img") %>' />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                </aside>
                                                <!-- col.// -->
                                                <div class="col-xl-6 col-lg-5 col-md-7 col-sm-7">
                                                    <div class="card-body">
                                                        <asp:Label ID="name" CssClass="h4 title" runat="server" Text='<%# Eval("package_name") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <ul class="list-check mb-2">
                                                            <li class="px-2">
                                                                <asp:Label ID="desc" runat="server" Text='<%# Eval("service_desc") %>'></asp:Label>
                                                            </li>
                                                            <br />
                                                            <li>
                                                                <h5>Category:</h5>
                                                                <p>
                                                                    <asp:Label ID="cat" ForeColor="green" CssClass="ps-5" runat="server" Font-Size="Large" Text='<%# Eval("service_category") %>'></asp:Label>
                                                                </p>
                                                            </li>

                                                        </ul>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                    </div>
                                                    <!-- info-div.// -->

                                                </div>
                                                <!-- col.// -->
                                                <aside class="col-xl-3 col-lg-3 col-md-5 col-sm-5">
                                                    <div class="info-aside">
                                                        <div class="price-wrap">
                                                            <span class="price h5">&#x20B9;
                                                                <asp:Label ID="price" runat="server" Text='<%# Eval("service_cost") %>'></asp:Label></span>
                                                            <del class="price-old">&#x20B9; <%#(Convert.ToInt32( Eval("service_cost"))+50) %></del>

                                                        </div>
                                                        <!-- info-price-detail // -->
                                                        <br>
                                                        <div class="pt-lg-5">
                                                            <asp:LinkButton runat="server" ID="LinkButton1" Text="View" CommandName="viewdata" CommandArgument='<%#Eval("service_id")%>' class="btn btn-primary w-100 mb-2" />
                                                            <asp:LinkButton runat="server" ID="LinkButton2" Text="Wishlist" CommandName="wishlist" CommandArgument='<%#Eval("service_id")%>' class="btn btn-primary w-100 mb-2" />

                                                        </div>

                                                    </div>
                                                    <!-- info-aside.// -->

                                                </aside>
                                                <!-- col.// -->

                                            </div>
                                            <!-- row.// -->
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr runat="server" style="">
                                                        <th>Our Services</th>
                                                    </tr>
                                                </thead>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style=""></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </center>
                    <%--<asp:ListView ID="ListView1" runat="server" GroupItemCount="4" OnItemCommand="ListView1_ItemCommand">
                        <EmptyDataTemplate>
                            <table runat="server">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>

                            <td>
                                <section class="py-5 ">
                                    <div class="container ">
                                        <div class="row  justify-content-center">
                                            <div class="col-md-12 col-sm-6 ">
                                                <div class="card col-12 shadow-lg">
                                                    <!-- Product image-->
                                                    <asp:Image ID="Image1" runat="server" class="card-img-top" ImageUrl='<%# Eval("service_img") %>' />
                                                    <!-- Product details-->
                                                    <div class="card-body col-12">
                                                            <p>
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("service_category")%>' ForeColor="#666666"></asp:Label></p>
                                                            <!-- Product name-->
                                                            <%# Eval("package_name") %>
                                                            <p><%# Eval("service_desc") %></p>
                                                    </div>
                                                    <div class="card-footer  bg-transparent">
                                                        <div class="text-center">
                                                            <!-- Product price-->
                                                            <asp:Label ID="Label3" runat="server" Text="&#x20B9;" class="py-2" Style="text-align: left; float: left;"></asp:Label>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_cost") %>' class="py-2" Style="text-align: left; float: left;"></asp:Label>
                                                            <!-- Product actions-->
                                                            <asp:LinkButton runat="server" ID="LinkButton1" Text="View" CommandName="viewdata" CommandArgument='<%#Eval("service_id")%>' class="btn btn-outline-dark flex-shrink-0" Style="text-align: right; float: right;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" id="datatablesSimple">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>--%>
                    <%--<asp:ListView ID="ListView1" runat="server" GroupItemCount="4" OnItemCommand="ListView1_ItemCommand">

                        <EmptyDataTemplate>
                            <table runat="server">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>

                        <ItemTemplate>

                            <td>
                                <section class="py-5 ">
                                    <div class="container ">
                                        <div class="row  justify-content-center">
                                            <div class="col-md-12 col-sm-6 ">
                                                <div class="card shadow-lg">
                                                    <!-- Product image-->
                                                    <asp:Image ID="Image1" runat="server" class="card-img-top" ImageUrl='<%# Eval("service_img") %>' />
                                                    <!-- Product details-->
                                                    <div class="card-body">
                                                        <div class="">
                                                            <p>
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("service_category")%>' ForeColor="#666666"></asp:Label></p>
                                                            <!-- Product name-->
                                                            <%# Eval("package_name") %>
                                                            <%# Eval("service_desc") %>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer  bg-transparent">
                                                        <div class="text-center">
                                                            <!-- Product price-->
                                                            <asp:Label ID="Label3" runat="server" Text="&#x20B9;" class="py-2" Style="text-align: left; float: left;"></asp:Label>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("service_cost") %>' class="py-2" Style="text-align: left; float: left;"></asp:Label>
                                                            <!-- Product actions-->
                                                            <asp:LinkButton runat="server" ID="LinkButton1" Text="View" CommandName="viewdata" CommandArgument='<%#Eval("service_id")%>' class="btn btn-outline-dark flex-shrink-0" Style="text-align: right; float: right;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" id="datatablesSimple">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>


                        <%--<LayoutTemplate>
                            <table id="datatablesSimple" class="table no-margin">
                                <thead>
                                    <tr>
                                        <th>View</th>
                                        <th>Service ID</th>
                                        <th>Package Name</th>
                                        <th>Quality</th>
                                        <th>Cost</th>
                                        <th>Description</th>
                                        <th>Service Cat</th>
                                        <th>Service Name</th>
                                        <th>Service Image</th>

                                    </tr>
                                </thead>
                                <tr id="itemPlaceholder" runat="server"></tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text="View" CommandName="viewdata" CommandArgument='<%#Eval("service_id")%>' CssClass="btn" /></td>
                                <td><%#Eval("service_id")%></td>
                                <td><%#Eval("package_name")%></td>
                                <td><%#Eval("quality_type")%></td>
                                <td><%#Eval("service_cost")%></td>
                                <td><%#Eval("service_desc")%></td>
                                <td></td>
                                <td><%#Eval("service_name")%></td>
                                <td><%#Eval("service_img")%></td>

                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <h2>No Records!</h2>
                        </EmptyDataTemplate>
                    </asp:ListView>--%>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
