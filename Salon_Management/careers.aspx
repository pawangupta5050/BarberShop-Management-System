<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="careers.aspx.cs" Inherits="Salon_Management.WebForm6" %>

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
                            <h4>Best <em>Careers</em> Opportunity</h4>
                            <img src="assets/img/heading-line-dec.png" alt="">
                            <p>
                                BarberShop's vision is to
                                empower millions of professionals
                            to deliver services like never experienced before...... be the part of this mission by joining our team.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-8 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Apply for a professional stylist</h4>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Name"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="name" ValidationExpression="^[A-Z a-z]*$" ErrorMessage="Enter Valid Name"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Please Enter Your Name" ControlToValidate="name"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Email"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ControlToValidate="email" runat="server" ErrorMessage="Enter correct Email" ValidationExpression="\w+([‐+.']\w+)*@\w+([‐.]\w+)*\.\w+([‐.]\w+)*"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Please Enter UserID" ControlToValidate="email"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Contact No."></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox ID="contact" runat="server" CssClass="form-control" placeholder="Enter your Contact No."></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ControlToValidate="contact" runat="server" ErrorMessage="Enter valid number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Please Enter contact no." ControlToValidate="contact"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Proficiency"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="proficiency" runat="server" CssClass="form-control">
                                                <asp:ListItem>Select your Proficient Stream</asp:ListItem>
                                                <asp:ListItem>Hair Stylist</asp:ListItem>
                                                <asp:ListItem>Beard Stylist</asp:ListItem>
                                                <asp:ListItem>Masseur</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ErrorMessage="Please select" ControlToValidate="proficiency"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Address"></asp:Label>
                                        <div class="form-group">

                                            <asp:TextBox ID="address" TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control" placeholder="Enter your Address"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ErrorMessage="Please Enter your address" ControlToValidate="address"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Upload your Resume here"></asp:Label>
                                        <div class="form-group">
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ErrorMessage="upload your resume" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Submit_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
