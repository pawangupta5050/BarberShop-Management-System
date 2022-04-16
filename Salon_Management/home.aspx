<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Salon_Management.DummyHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
    <style>
        .client-testimonial-carousel .owl-dots button {
            height: 5px;
            background: #1fc8db !important;
            width: 20px;
            display: inline-block;
            margin: 5px;
            transition: .2s;
            border-radius: 2px;
        }

        .client-testimonial-carousel button.owl-dot.active {
            background: #000 !important;
            width: 30px;
        }

        .client-testimonial-carousel .owl-dots {
            text-align: center;
            margin-top: 25px
        }

        .single-testimonial-item {
            position: relative;
            box-shadow: 0 0 2px #1fc8db;
            margin: 2px;
            padding: 20px;
            font-style: italic;
            padding-left: 85px;
        }

            .single-testimonial-item:before {
                font-family: "Font Awesome 5 Free";
                content: "\f10e";
                font-weight: 900;
                position: absolute;
                left: 20px;
                top: 50%;
                font-size: 20px;
                color: #1fc8db;
                line-height: 30px;
                margin-top: -15px;
            }

            .single-testimonial-item:after {
                background: #1fc8db;
                content: "";
                height: 70%;
                left: 60px;
                position: absolute;
                top: 10%;
                width: 1px;
            }

            .single-testimonial-item h3 {
                font-size: 20px;
                font-style: normal;
                margin-bottom: 0;
            }

                .single-testimonial-item h3 span {
                    display: block;
                    font-size: 12px;
                    font-weight: normal;
                    margin-top: 5px;
                }

        .enq-btn {
            position: fixed;
            z-index: 999;
            right: 0rem;
            top: 11rem;
            width: 2rem;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel({
                items: 3,
                autoplay: true,
                margin: 30,
                loop: true,
                autoplayHoverPause: true,
                dots: true
            });
        });
    </script>
    <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6 align-self-center">
                            <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h2>Where Men get Ready.</h2>
                                        <p>
                                            A decent hair cut boosts a lot of confidence and self esteem, especially when it comes to Men.
            We understand your need to feel good and look sharp
                                        </p>

                                    </div>
                                    <div class="col-lg-12">
                                        <div class="white-button first-button scroll-to-section">
                                            <a href="Gallery.aspx">Gallery<i class="fas fa-images"></i></a>
                                        </div>
                                        <div class="white-button scroll-to-section">
                                            <a href="ProductList.aspx">View Services <i class="fas fa-list"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                <%--<img src="image/vectorfinal3.png" />--%><%--<img src="image/vectorfinal6.png" />--%><img src="image/vectorfinal2.png" />
<%--                                <img src="image/vector51.png" alt="">--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<a data-bs-toggle="modal" data-bs-target="#myModal" runat="server" id="QueryModal" class="enq-btn bg-black px-2">
        Q<br />
        U<br />
        E<br />
        R<br />
        Y<br />
        <i class="fas fa-comments"></i>
    </a>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container mx-auto py-5">
            <div class="card card-primary direct-chat direct-chat-primary">
                <div class="card-header">
                    <h3 class="card-title">Chat With admin</h3>
                    
                </div>
                        <div class="card-body">
                    <!-- Conversations are loaded here -->
                    <div class="direct-chat-messages">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <!-- Message to the right -->
                        <div class="direct-chat-msg right">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-right">You</span>
                                <span class="direct-chat-timestamp float-left"><%# Eval("time","{0:HH:mm}") %></span>
                            </div>
                            <img class="direct-chat-img" src="image/User_logo.jpg" />
                            <div class="direct-chat-text">
                                <asp:Label ID="usermssg" runat="server" Text='<%# Eval("usermssg") %>'></asp:Label>
                            </div>
                            
                        </div>
                        <!-- Message. Default to the left -->
                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left">Admin</span>
                                <span class="direct-chat-timestamp float-right"><%# Eval("time","{0:HH:mm}") %></span>
                            </div>
                            <img class="direct-chat-img" src="image/Admin_logo.jpg" />
                            <div class="direct-chat-text">
                                <asp:Label ID="adminmssg" runat="server" Text='<%# Eval("adminmssg") %>'></asp:Label>
                            </div>
                            <!-- /.direct-chat-text -->
                        </div>
                        <!-- /.direct-chat-msg -->
                        
                    </ItemTemplate>
                </asp:ListView>
                <!-- /.card-header -->
                
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row text-center">
                        <div class="col-md-11">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter your message here..."></asp:TextBox>
                        </div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" OnClick="LinkButton1_Click"><i class="fab fa-telegram-plane"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                </div>
            </div>
        </div>
    </div>--%>




    <div id="services" class="services section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                        <h4>Amazing <em>Services &amp; Features</em> for you</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                        <p><a rel="nofollow" href="aboutus.aspx">BarberShop</a> mainly focuses on customer satisfation and working on better customer experience. Explore <a href="ProductList.aspx">our services</a> for more information and reviews from our customers.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="service-item first-service">
                        <div class="icon"></div>
                        <h4>Online Appointments</h4>
                        <p>Let's you book appointments online and pay the fees at the shop after the service is done.</p>
                        <div class="text-button">
                            <asp:LinkButton ID="viewservices" runat="server" OnClick="viewservices_Click">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="service-item second-service">
                        <div class="icon"></div>
                        <h4>Faster Updates</h4>
                        <p>You’ll get notified whenever a new appointment is booked, confirmed or cancelled by you.</p>
                        <div class="text-button">
                            <asp:LinkButton ID="about" runat="server" OnClick="about_Click">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="service-item third-service">
                        <div class="icon"></div>
                        <h4>Professional Stylist</h4>
                        <p>Multiple professional and highly skilled stylist with a great experience waiting for you.</p>
                        <div class="text-button">
                            <asp:LinkButton ID="stylist" runat="server" OnClick="stylist_Click">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="service-item fourth-service">
                        <div class="icon"></div>
                        <h4>24/7 Help &amp; Support</h4>
                        <p>Highly trained employees and admin working on the ease of customers and solving problems of customer.</p>
                        <div class="text-button">
                            <asp:LinkButton ID="aboutus" runat="server" OnClick="aboutus_Click">Read More <i class="fa fa-arrow-right"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="clients" class="the-clients">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="section-heading">
                        <h4>Check What <em>The Clients Say</em> About Our Services</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                        <p>Here are some of the comments of our beloved clients about what there experience was after the service.</p>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="naccs">
                        <div class="grid">
                            <div class="row">
                                <div class="col-lg-7 align-self-center">
                                    <div class="menu">
                                        <div class="first-thumb active">
                                            <div class="thumb">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <h4>Pawan Gupta</h4>
                                                        <span class="date">30 November 2021</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                        <span class="category">Premium</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span class="rating">4.5</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="thumb">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <h4>Mayuresh Dawkhar</h4>
                                                        <span class="date">29 November 2021</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                        <span class="category">Classic</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span class="rating">4.5</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="thumb">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <h4>Sunil Meena</h4>
                                                        <span class="date">27 November 2021</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                        <span class="category">Gold</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span class="rating">4.7</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="thumb">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <h4>Suchi Gowda</h4>
                                                        <span class="date">24 November 2021</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                        <span class="category">Premium</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span class="rating">3.9</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="last-thumb">
                                            <div class="thumb">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <h4>Aarti Jha</h4>
                                                        <span class="date">21 November 2021</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                        <span class="category">Gold</span>
                                                    </div>
                                                    <div class="col-lg-4 col-sm-4 col-12">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span class="rating">4.3</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <ul class="nacc">
                                        <li class="active">
                                            <div>
                                                <div class="thumb">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="client-content">
                                                                <img src="assets/img/quote.png" alt="">
                                                                <p>
                                                                    “Best barber shop I have ever been to. Great atmosphere,Alex and Nick make
                                                                    u feel like if you were their customers for years, and I've only been there 
                                                                    two times and will continue to keep going. I highly recommend this place.”
                                                                </p>
                                                            </div>
                                                            <div class="down-content">
                                                                <img src="image/Pawan_Photo.jpg" alt="">
                                                                <div class="right-content">
                                                                    <h4>Pawan Gupta</h4>
                                                                    <span>CEO of David Company</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="thumb">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="client-content">
                                                                <img src="assets/img/quote.png" alt="">
                                                                <p>
                                                                    “Great barbers highly experienced. Great atmosphere and very professional. 
                                                                    Both Alex and Nick are some of the best in the area. I would highly
                                                                    recommend top rank.”
                                                                </p>
                                                            </div>
                                                            <div class="down-content">
                                                                <img src="image/Mayu_Photo.jpg" alt="">
                                                                <div class="right-content">
                                                                    <h4>Mayuresh Dawkhar</h4>
                                                                    <span>CTO of Digital Company</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="thumb">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="client-content">
                                                                <img src="assets/img/quote.png" alt="">
                                                                <p>
                                                                    “I’ve Just Moved to The Area, and Recently Got My 
                                                                    First Haircut With Nick. Best Line Ups, Fun and Comfy Atmosphere,
                                                                    Great Sports and Social Talk... I Would Highly Recommend.”
                                                                </p>
                                                            </div>
                                                            <div class="down-content">
                                                                <img src="image/sunil_Photo.png" alt="">
                                                                <div class="right-content">
                                                                    <h4>Sunil Meena.</h4>
                                                                    <span>Founder of Catherina Co.</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="thumb">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="client-content">
                                                                <img src="assets/img/quote.png" alt="">
                                                                <p>
                                                                    “Nick is a magnificent all around barber and a fun, genuine guy.
                                                                    He made everything look easy and knew what to do without thinking.
                                                                    I will never go anywhere else as long as I live in mn. What can I say, 
                                                                    the guy can cut.”
                                                                </p>
                                                            </div>
                                                            <div class="down-content">
                                                                <img src="image/User_logo.jpg" alt="">
                                                                <div class="right-content">
                                                                    <h4>Suchi Gowda</h4>
                                                                    <span>Manager, Digital Company</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="thumb">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="client-content">
                                                                <img src="assets/img/quote.png" alt="">
                                                                <p>
                                                                    “Great barbers highly experienced. Great atmosphere and very professional.
                                                                    Both Alex and Nick are some of the best in the area. I would highly recommend 
                                                                    top rank.”
                                                                </p>
                                                            </div>
                                                            <div class="down-content">
                                                                <img src="image/Admin_logo.jpg" alt="">
                                                                <div class="right-content">
                                                                    <h4>Aarti Jha</h4>
                                                                    <span>CTO, Amber Do Company</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />
    <br />

        <div class="container pt-5 the-clients">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                        <h4>Roadmap of <em>customer</em> Booking Appointment</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                        <p><a rel="nofollow" href="aboutus.aspx">BarberShop</a> mainly focuses on customer satisfation and working on better customer experience. Explore <a href="ProductList.aspx">our services</a> for more information and reviews from our customers.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container pb-5">
            <div class="row">
                <div class="col-10 mx-auto">
                <asp:Image ID="Image1" runat="server" ImageUrl="image/customer-journey-barbershop.svg" />
                </div>
            </div>
        </div>
    <!--------------Testimonials Section------------->
    <section id="Testimonial">
        <div class="section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading text-center">
                            <h4>Our <em>Professional</em> Stylists</h4>
                            <img src="assets/img/heading-line-dec.png" />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna.</p>

                        </div>

                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12" data-aos="zoom-in" data-aos-delay="600" data-aos-duration="1500" data-aos-once="true">
                        <div class="owl-carousel client-testimonial-carousel">
                            <div class="single-testimonial-item">
                                <p>
                                    <img src="image/vectorFinal1.png" />
                                    A professional stylist certified by New York University of Barbery and Cosmetology.  
                                </p>
                                <h3>Aryan Borgude <span>Hair Stylist</span></h3>
                            </div>
                            <div class="single-testimonial-item">
                                <p>
                                    <img src="image/vectorFinal3.png" />
                                    A professional stylist certified by New York University of Barbery and Cosmetology.   
                                </p>
                                <h3>Pawan Gupta <span>Beard Stylist</span></h3>
                            </div>
                            <div class="single-testimonial-item">
                                <p>
                                    <img src="image/vector3.jpg" />
                                    A professional stylist certified by New York University of Barbery and Cosmetology.   
                                </p>
                                <h3>Raj Meena <span>Masseur</span></h3>
                            </div>
                            <div class="single-testimonial-item">
                                <p>
                                    <img src="image/vector3.jpg" />
                                    A professional stylist certified by New York University of Barbery and Cosmetology.   
                                </p>
                                <h3>Vinit Jadhav<span>Masseur</span></h3>
                            </div>
                            <div class="single-testimonial-item">
                                <p>
                                    <img src="image/vector3.jpg" />
                                    A professional stylist certified by New York University of Barbery and Cosmetology.    
                                </p>
                                <h3>Sunil Meena <span>Hair Stylist</span></h3>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

</asp:Content>
