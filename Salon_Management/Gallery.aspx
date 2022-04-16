<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Salon_Management.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .zoom {
            transition: transform .2s; /* Animation */
            margin: 0 auto;
        }

            .zoom:hover {
                transform: scale(1.1); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            }

        .auto-style1 {
            width: 100%;
        }
    </style>
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col py-2">
                    <div class="section-heading text-center">
                        <h4><em>Hair</em></h4>
                        <img src="assets/img/heading-line-dec.png">
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [hair_gallery]"></asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="hairimg_id" DataSourceID="SqlDataSource1" RepeatColumns="3">
                        <ItemTemplate>
                            <div class="container py-2">
                                <div class="row">
                                    <div class="col">
                                        <asp:Image ID="Image1" runat="server" class="card-img-top img-fluid zoom" ImageUrl='<%# Eval("hair_image") %>' />

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col py-3 text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("hairimg_name") %>' ForeColor="#666666"></asp:Label></p>
                                   
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="col py-2">

                    <div class="section-heading text-center">
                        <h4><em>Shave</em></h4>
                        <img src="assets/img/heading-line-dec.png">
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [shave_gallery]"></asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="shaveimg_id" DataSourceID="SqlDataSource2" RepeatColumns="3">
                        <ItemTemplate>
                            <div class="container py-2">
                                <div class="row">
                                    <div class="col">
                                        <asp:Image ID="Image1" runat="server" class="card-img-top img-fluid zoom" ImageUrl='<%# Eval("shave_image") %>' />

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col py-3 text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("shaveimg_name") %>' ForeColor="#666666"></asp:Label></p>
                                   
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="col py-2">

                    <div class="section-heading text-center">
                        <h4><em>Massage</em></h4>
                        <img src="assets/img/heading-line-dec.png">
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [massage_gallery]"></asp:SqlDataSource>
                    <asp:DataList ID="DataList3" runat="server" DataKeyField="massageimg_id" DataSourceID="SqlDataSource3" RepeatColumns="3">
                        <ItemTemplate>
                            <div class="container py-2">
                                <div class="row">
                                    <div class="col">
                                        <asp:Image ID="Image1" runat="server" class="card-img-top img-fluid zoom" ImageUrl='<%# Eval("massage_image") %>' />

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col py-3 text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("massageimg_name") %>' ForeColor="#666666"></asp:Label></p>
                                   
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
