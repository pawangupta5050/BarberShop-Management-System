<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Salon_Management.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main">

        <div class="container col-8">
            <div class="signup-content">
                <div class="signup-form">
                    <h1 class="form-title">Sign up</h1>
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="Name" runat="server" placeholder="Full Name"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Please Enter Full Name" ControlToValidate="Name"></asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="Name" ValidationExpression="^[A-Z a-z]*$" ErrorMessage="Enter Valid Name"></asp:RegularExpressionValidator>
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i></label>
                        <asp:TextBox ID="Email" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="Email"></asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ControlToValidate="Email" runat="server" ErrorMessage="Enter correct Email" ValidationExpression="\w+([‐+.']\w+)*@\w+([‐.]\w+)*\.\w+([‐.]\w+)*"></asp:RegularExpressionValidator><div class="form-group">
                        <label for="name"><i class="fas fa-id-badge"></i></label>
                        <asp:TextBox ID="UserId" runat="server" placeholder="User ID"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Please Enter UserID" ControlToValidate="UserId"></asp:RequiredFieldValidator>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="UserPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="UserPass"></asp:RequiredFieldValidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator3" display="Dynamic" errormessage="Password must contain:<br> Minimum 8 characters atleast 1 UpperCase Alphabet,<br> 1 LowerCase Alphabet,<br> 1 Number and 1 Special Character" validationexpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" controltovalidate="UserPass" runat="server"></asp:regularexpressionvalidator>
                    <%--<asp:RegularExpressionValidator ID="RegExp" Display="Dynamic" ErrorMessage="Password must be 8-10 characters long</br> with at least one numeric character." ValidationExpression="(?!^[0-9]$)(?!^[a-zA-Z]$)^([a-zA-Z0-9]{8,10})$" ControlToValidate="UserPass" runat="server"></asp:RegularExpressionValidator>
                    --%><div class="form-group">
                        <label for="re-pass"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="ConFirmPass" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ErrorMessage="Please Confirm the Password" ControlToValidate="ConfirmPass"></asp:RequiredFieldValidator>
                    
                    </div>

                    <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" ControlToValidate="ConFirmPass" ControlToCompare="UserPass" runat="server" ErrorMessage="Password Mismatched"></asp:CompareValidator>

                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="I agree all statements in"></asp:Label>
                        &nbsp;
                    <a href="terms.aspx" style="text-decoration: none !important">Terms of Services</a>

                    </div>
                    <div class="form-group form-button">
                        <asp:Button class="form-submit" ID="signup" runat="server" Text="Sign Up" OnClick="signup_Click" />
                    </div>


                </div>
                <div class="signup-image align-items-center text-center">
                    <figure>
                        <img src="image/vector6.jpg" alt="sing up image">
                    </figure>
                    <a href="login.aspx" style="text-decoration: none !important">Have an Account? Login</a>
                    <br />
                    <br />
                    <br />
                    <a href="home.aspx" style="text-decoration: none !important"><< Back To Home Page</a>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
