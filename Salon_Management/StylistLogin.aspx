<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="StylistLogin.aspx.cs" Inherits="Salon_Management.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">

        <div class="container col-7">
            <div class="signup-content">
                <div class="signup-image col-3">
                    <figure>
                        <img src="image/vectorFinal3.png" class="img-fluid">
                    </figure>
                </div>

                <div class="signup-form">
                    <h1 class="form-title">Stylist LogIn</h1>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="StylistId" runat="server" placeholder="Stylist ID"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="StylistPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group form-button">
                        <asp:Button class="form-submit" ID="StylistLogin" runat="server" Text="Log In" OnClick="StylistLogin_Click" />
                    </div>

                    <asp:LinkButton class="small" ID="Back" runat="server" Style="text-align: left; float: left; text-decoration: none !important" OnClick="Back_Click" ><< Back To Home Page</asp:LinkButton>

                </div>

            </div>

        </div>
    </div>
</asp:Content>
