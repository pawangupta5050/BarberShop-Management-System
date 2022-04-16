<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Salon_Management.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6 align-self-center">
                            <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h2>About Us</h2>
                                        <p>
                                            This is a barbershop, not a hair salon. You come in here not trying to 
                                            impress anyone. It's a place just to talk, to hang out with the fellows,
                                            talk build your personality .
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                <img src="image/vectorfinal3.png" />
                                <%--<img src="image/HomePage1.png" alt="">--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />


    <div class="container-fluid">
        <div class="row">
            <div class=" col-md-12">
                <div>
                    <center>
                        <div class="section-heading services section">
                            <h4><big>BarberShop</big></h4>
                            <img src="assets/img/heading-line-dec.png" alt="">
                        </div>
                        <br />
                        <p>
                            <big>BarberShop is the online salon services platform.
                            Launched in 2021, BarberShop today operates a best services. 
                            <br />
                                The platform helps customers book reliable
                            & high quality services -  beauty treatments, massages, haircuts,
                            shave,<br />
                                hair colouring and more – delivered by trained 
                            professionals conveniently at the Shop. BarberShop's vision is to
                                    <br />
                                empower millions of professionals
                            to deliver services like never experienced before.
                            </big>
                        </p>
                    </center>
                </div>
                <br />
                <br />
                <br />
                <div class="row section-heading  wow fadeInDown">
                    <div class="col-md-2">
                    </div>

                    <div class="col-md-2">
                        <center>
                            <h1>
                                <asp:Label ID="stylist" runat="server" Text="Label"></asp:Label>&#43;</h1>
                            <p>Trained Proffesionals</p>
                        </center>
                    </div>

                    <div class="col-md-2">
                        <center>
                            <h1><asp:Label ID="user" runat="server" Text="Label"></asp:Label>&#43;</h1>
                            <p>Happy Customers</p>
                        </center>

                    </div>

                    <div class="col-md-2">
                        <center>
                            <h1>100&#43;</h1>
                            <p>Latest Equipments</p>
                        </center>
                    </div>

                    <div class="col-md-2">
                        <center>
                            <h1>Decors</h1>
                            <p>Fully Furnished Decors</p>
                        </center>

                    </div>

                    <div class="col-md-2">
                    </div>

                </div>
                <br />
                <br />
                <br />
                <div class="py-5">
                </div>

                <div id="about" class="about-us section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 align-self-center">
                                <div class="section-heading">
                                    <h4>About <em>What We Do</em> &amp; Who We Are</h4>
                                    <img src="assets/img/heading-line-dec.png" alt="">
                                    <p>
                                        BarberShop is the online salon services platform.
                            Launched in 2021, BarberShop today operates a best services. 
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="box-item">
                                            <h4 class="py-2">Online Appointments</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="box-item">
                                            <h4 class="py-2">Faster Updates</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="box-item">
                                            <h4 class="py-2">Professional Stylist</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="box-item">
                                            <h4 class="py-2">24/7 Help &amp; Support</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <p>
                                            The platform helps customers book reliable
                            & high quality services -  beauty treatments, massages, haircuts.
                                        </p>
                                        <div class="gradient-button">
                                            <a href="ProductList.aspx">Let's Take a Journey To Our services</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="right-image">
                                    <img src="image/about-right-dec.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="py-5">
                    <div id="services" class="services section">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8 offset-lg-2">
                                    <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                                        <h4>Our <em>Leadership</em> Team</h4>
                                        <img src="assets/img/heading-line-dec.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="container my-2 px-5">
                                    <div class="row">
                                        <div class="col-md-4 px-3">
                                            <div class="service-item">
                                                <div class="row">
                                                    <div class="col text-center">
                                                        <img src="image/Pawan_Photo.jpg" class="img-fluid rounded-circle col-6" alt="" height="50" width="50" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <h4 class="text-center pt-2">Pawan Gupta</h4>
                                                        <p class="card-text text-center">OWNER & Co-Founder, BarberShop  </p>
                                                        <ul class="text-center">
                                                            <li>
                                                                <a class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-twitter"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-linkedin"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-instagram"></i></a>
                                                            </li>
                                                        </ul>
                                                        <p class="pt-2">
                                                            Pawan is responsible for marketing and product growth at BarberShop. When not busy at BarberShop, Pawan enjoys
                                            immersing himself in interesting experiences be it traveling and exploring new cities and dishes.
                                                        <br />
                                                            <br />
                                                            <br />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 px-3">

                                            <div class="service-item">
                                                <div class="row">
                                                    <div class="col text-center">
                                                        <img src="image/Mayu_Photo.jpg" class="img-fluid rounded-circle col-6" alt="" height="120" width="120" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <h4 class="text-center pt-2">Mayuresh Dawkhar</h4>
                                                        <p class="card-text text-center">CEO & Co-Founder, BarberShop </p>
                                                        <ul class="text-center">
                                                            <li>
                                                                <a class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-twitter"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-linkedin"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-instagram"></i></a>
                                                            </li>
                                                        </ul>
                                                        <p class="pt-2">
                                                            Mayuresh leads technology and product development at BarberShop. In his free time, Raghav loves to venture outdoors and try
                                            his balance while slacklining and bouldering. Raghav is a dance enthusiast who does not miss any opportunity to groove to 
                                            Westcoast Swing and Rock-n-Roll.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 px-3">

                                            <div class="service-item">
                                                <div class="row">
                                                    <div class="col text-center">
                                                        <img src="image/Sunil_Photo.png" class="img-fluid rounded-circle col-6" alt="" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <h4 class="text-center pt-2">Sunil Meena</h4>
                                                        <p class="card-text text-center">COO & Co-Founder, BarberShop </p>
                                                        <ul class="text-center">
                                                            <li>
                                                                <a class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-twitter"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-linkedin"></i></a>
                                                                <a class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab  fa-instagram"></i></a>
                                                            </li>
                                                        </ul>
                                                        <p class="pt-2">
                                                            Sunil is responsible for operations and service provider on-boarding at BarberShop. When not building BarberShop,
                                            Sunil likes to check out new coffee shops, explore Delhi with his Polaroid and go for a run at Lodhi Gardens - his favourite spot in the city.
                                            <br />
                                                            <br />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
                <%--<div class="row p-4 g-4">

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <center>
                                        <img src="image/Pawan_Photo.jpg" class="img-fluid rounded-circle" alt=""  />

                                        <h5 class="card-title">Pawan Gupta</h5>
                                        <p class="card-text">Owner & Co-Founder, BarberShop </p>
                                        <a style="color: silver;" class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-2x fa-twitter"></i></a>
                                        <a style="color: silver;" class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab fa-2x fa-linkedin"></i></a>
                                        <br />
                                        <br />
                                        <big>Pawan is responsible for marketing and product growth at BarberShop. When not busy at BarberShop, Pawan enjoys
                                            immersing himself in interesting experiences be it traveling and exploring new cities and dishes.
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </big>
                                    </center>
                                </div>

                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <center>
                                        <img src="image/Mayu_Photo.jpg" class="rounded-circle" alt="" height="120" width="120" />

                                        <h5 class="card-title">Mayuresh Dawkhar</h5>
                                        <p class="card-text">CEO & Co-Founder, BarberShop </p>
                                        <a style="color: silver;" class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-2x fa-twitter"></i></a>
                                        <a style="color: silver;" class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab fa-2x fa-linkedin"></i></a>
                                        <br />
                                        <br />
                                        <big>Mayuresh leads technology and product development at BarberShop. In his free time, Raghav loves to venture outdoors and try
                                            his balance while slacklining and bouldering. Raghav is a dance enthusiast who does not miss any opportunity to groove to 
                                            Westcoast Swing and Rock-n-Roll.
                                        </big>
                                    </center>

                                </div>

                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <center>
                                        <img src="image/Sunil_Photo.png" class="rounded-circle" alt="" height="120" width="120" />

                                        <h5 class="card-title">Sunil Meena</h5>
                                        <p class="card-text">COO & Co-Founder, BarberShop </p>
                                        <a style="color: silver;" class="p-1" href="https://twitter.com/Pawangupta5050"><i class="fab fa-2x fa-twitter"></i></a>
                                        <a style="color: silver;" class="p-1" href="https://www.linkedin.com/in/pawangupta20/"><i class="fab fa-2x fa-linkedin"></i></a>
                                        <br />
                                        <br />
                                        <big>Sunil is responsible for operations and service provider on-boarding at BarberShop. When not building BarberShop,
                                            Sunil likes to check out new coffee shops, explore Delhi with his Polaroid and go for a run at Lodhi Gardens - his favourite spot in the city.
                                            <br />
                                            <br />
                                            <br />
                                        </big>
                                    </center>
                                </div>

                            </div>

                        </div>

                    </div>--%>
                <br />
                <br />
                <center class="py-5">
                    <div class="section-heading">
                        <h4>Our <em>Core</em> Team</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                    </div>
                </center>
                <br />
                <div class="row">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-1">
                    </div>
                </div>

                <br />
                <br />

                <center class="py-5">
                    <div class="section-heading">
                        <h4>Our <em>Technical</em> Team</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                    </div>
                </center>

                <br />

                <div class="row">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <img src="image/User_logo.jpg" class="img-fluid rounded-circle" alt="" height="100" width="100" />
                            <h5>Sunil Nayak</h5>
                        </center>
                    </div>
                    <div class="col-md-1">
                    </div>
                </div>
                <br />
                <br />
                <br />
                <center class="py-5">
                    <div class="section-heading">
                        <h4 class="px-5">Our <em>Mission</em> is to Empower Millions of Customers to get Services by the Proffesionals in a way that has never been Experienced Before.</h4>
                        <img src="assets/img/heading-line-dec.png" alt="">
                        <p class="aboutp">
                            For general Queries, Contact: <a href="mailto:eduhill@gmail.com" style="text-decoration: none !important">&nbsp; help@barbershop.com</a>
                            |
                            For general Queries, Contact: <a href="mailto:eduhill@gmail.com" style="text-decoration: none !important">&nbsp; press@barbershop.com</a>
                        </p>
                    </div>
                </center>
                <br />

            </div>




        </div>


    </div>


</asp:Content>
