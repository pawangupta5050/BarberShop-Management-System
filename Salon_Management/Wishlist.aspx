<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Salon_Management.WebForm8" %>

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
                <aside class="col-lg-8">
                    <div class="card">
                        <article class="card-body">
                            <h4 class="card-title">Your Wishlist</h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="serviceid" OnItemCommand="ListView1_ItemCommand">

                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td>your Wishlist is empty.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="padding: 15px;">
                                                    <div class="container px-4 my-3">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <asp:Image ID="Image" Height="100" Width="100" CssClass="card-img" runat="server" ImageUrl='<%# Eval("serviceimage") %>' />
                                                            </div>
                                                            <div class="col-md-6 ">
                                                                <%# Eval("servicename") %>
                                                                <ul>

                                                                    <li>
                                                                        <p>
                                                                            <%# Eval("servicedesc").ToString().Length > 10 ? Eval("servicedesc").ToString().Substring(0,150)+"......." : Eval("servicedesc") %>
                                                                        </p>

                                                                    </li>
                                                                    <li>Category: 
                                                                        <asp:Label ID="cat" ForeColor="green" CssClass="ps-2" runat="server" Font-Size="Large" Text='<%# Eval("servicecategory") %>'></asp:Label>
                                                                    </li>
                                                                    <li></li>
                                                                </ul>

                                                            </div>
                                                            <div class="col-md-4">
                                                                <span class="price h5">&#x20B9; <%# Eval("serviceprice") %></span>

                                                                <div class="d-grid gap-2 pt-5 d-md-block">
                                                                    <asp:LinkButton runat="server" ID="view" CommandName="viewdata" CommandArgument='<%#Eval("serviceid")%>' class="btn btn-primary btn-sm"><i class="fa fa-info-circle"></i></asp:LinkButton>
                                                                    <asp:LinkButton runat="server" ID="remove" CommandName="removedata" CommandArgument='<%#Eval("serviceid")%>' class="btn btn-primary btn-sm"><i class="fa fa-times"></i></asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </article>
                        <article class="card-body border-top">
                            <a href="ProductList.aspx" class="btn btn-light" ><i class="fa fa-arrow-left me-2"></i>View Product</a>

                            <table style="max-width: 360px" class="table table-sm float-lg-end">
                                <tbody>
                                    <tr>
                                        <td>Subtotal : </td>
                                        <td>&#x20B9 
                                            <asp:Label ID="lblsubtotal" runat="server"></asp:Label>.00</td>

                                    </tr>
                                    <tr>
                                        <td>Total Service(s): </td>
                                        <td><span></span>
                                            <asp:Label ID="lblservicecount" runat="server"></asp:Label></td>

                                    </tr>
                                    <tr>
                                        <td>Total: </td>
                                        <td><strong class="h5 price">&#x20B9
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>.00</strong> </td>

                                    </tr>

                                </tbody>

                            </table>

                        </article>
                    </div>

                </aside>
            </div>
        </div>
    </section>
</asp:Content>
