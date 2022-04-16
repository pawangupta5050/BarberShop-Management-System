<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StylistProfile.aspx.cs" Inherits="Salon_Management.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5">
        <div id="services" class="services section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                            <h4>Professional <em>Stylists</em> for you</h4>
                            <img src="assets/img/heading-line-dec.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BarberShopConnectionString %>" SelectCommand="SELECT * FROM [stylist_management]"></asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="stylist_id" DataSourceID="SqlDataSource1" RepeatColumns="3">
                        <ItemTemplate>
                            <div class="container my-2">
                                <div class="row">
                                    <div class="col">
                                        <div class="service-item">
                                            <div class="row">
                                                <div class="col text-center">
                                                    <asp:Image ID="Image1" Height="200" Width="200" runat="server" CssClass="img-fluid rounded-circle" ImageUrl='<%# Eval("stylist_img") %>' />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <h4 class="text-center pt-2"><%# Eval("stylist_name") %></h4>
                                                    <ul class="text-center">
                                                        <li>
                                                            <a class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-twitter"></i></a>
                                                            <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-linkedin"></i></a>
                                                            <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                    <p class="pt-2"><%# Eval("stylist_desc") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </ItemTemplate>
                    </asp:DataList>

                    <%--
                    <div class="col-lg-3">
                        <div class="service-item second-service">
                            <div class="icon"></div>
                            <h4>Faster Updates</h4>
                            <p>You’ll get notified whenever a new appointment is booked, confirmed or cancelled by you.</p>
                            <div class="text-button">
                                <asp:LinkButton ID="LinkButton1" runat="server">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="service-item third-service">
                            <div class="icon"></div>
                            <h4>Professional Stylist</h4>
                            <p>Multiple professional and highly skilled stylist with a great experience waiting for you.</p>
                            <div class="text-button">
                                <asp:LinkButton ID="LinkButton2" runat="server">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="service-item fourth-service">
                            <div class="icon"></div>
                            <h4>24/7 Help &amp; Support</h4>
                            <p>Highly trained employees and admin working on the ease of customers and solving problems of customer.</p>
                            <div class="text-button">
                                <asp:LinkButton ID="LinkButton3" runat="server">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
        <%--    <div class="container px-4 px-lg-5 my-5">
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12"> 
            <div class="card card-product-grid px-2 my-5"> 
                <div class="img-wrap"> 
                    <img src="bootstrap5-ecommerce/images/items/3.jpg"> 

                </div> 
                <div class="info-wrap border-top">
                    <div class="price-wrap">
                        <strong class="price">$630.50</strong> 
                        <small class="text-muted"> /per item</small>

                    </div> <!-- price-wrap.// --> 
                    <a href="#" class="title">Xiaomi Redmi 8 Original Global Version 4GB</a> 
                    <p class="text-muted small mt-2"> 
                        <i class="fa fa-map-marker"></i> 
                        United kingdom</p> 

                </div>

            </div> 

        </div>
        </div>
        </div>--%>
    </section>
</asp:Content>
