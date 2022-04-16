<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Salon_Management.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="main">

        <div class="container col-7">
            <div class="signup-content">
                <div class="signup-image col-3">
                    <figure>
                        <img src="image/vector3.jpg" class="img-fluid">
                    </figure>

                    <asp:LinkButton class="small" ID="SignUp" runat="server" Style="text-decoration: none !important" OnClick="SignUp_Click">Need an account? Sign up!</asp:LinkButton>


                </div>

                <div class="signup-form">
                    <h1 class="form-title">Log In</h1>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="UserId" runat="server" placeholder="User ID"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="UserPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group form-button">
                        <asp:Button class="form-submit" ID="Login" runat="server" Text="Log In" OnClick="Login_Click" />
                    </div>

                    <asp:LinkButton class="small" ID="Back" runat="server" Style="text-align: left; float: left; text-decoration: none !important" OnClick="Back_Click"><< Back To Home Page</asp:LinkButton>

                </div>

            </div>

        </div>
    </div>


</asp:Content>
