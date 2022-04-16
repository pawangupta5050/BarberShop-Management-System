<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Salon_Management.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="main">

        <div class="container col-7">
            <div class="signup-content">
                <div class="signup-image col-3">
                    <figure>
                        <img src="image/vectorFinal1.png" class="img-fluid">
                    </figure>
                </div>

                <div class="signup-form">
                    <h1 class="form-title">Admin LogIn</h1>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="AdminId" runat="server" placeholder="Admin ID"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="AdminPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group form-button">
                        <asp:Button class="form-submit" ID="AdminLogin" runat="server" Text="Log In" OnClick="AdminLogin_Click" />
                    </div>

                    <asp:LinkButton class="small" ID="Back" runat="server" Style="text-align: left; float: left; text-decoration: none !important" OnClick="Back_Click"><< Back To Home Page</asp:LinkButton>
                    <br />
                    <a href="StylistLogin.aspx" class="small text-center" Style="text-decoration: none !important">Are You a Stylist?</a>

                </div>

            </div>

        </div>
    </div>


</asp:Content>
