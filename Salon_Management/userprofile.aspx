<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Salon_Management.WebForm19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        div.scroll {
            max-height: 50vh;
            overflow: auto;
        }
    </style>
    <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)

                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <div class="main">
        <div class="container col-10 py-5 px-5">
            <div class="row">
                <div class="col-5">
                    <div class="d-flex flex-column align-items-center text-center">
                        <asp:Image ID="Image1" CssClass="img-fluid rounded-circle" Width="150px" runat="server" />

                        <div class="mt-3">
                            <asp:Label class="badge rounded-pill bg-info" ID="Label1" runat="server" Text="your status"></asp:Label>
                            <br />
                            <br />
                            <center>
                                <div class="form-group col-3">
                                    <div class="input-group">
                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" onchange="ShowImagePreview(this);" />
                                        <asp:Button class="btn-primary col-1 form-control" ID="SaveImg" runat="server" Text="save" OnClick="SaveImg_Click" />
                                    </div>
                                </div>
                            </center>
                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="d-flex flex-column align-items-center">
                        <h2>Change Password</h2>
                        <br />
                        <div class="form-group">
                            <label for="pass"><i class="fas fa-user"></i></label>
                            <asp:TextBox ID="UserId" runat="server" placeholder="User ID" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="fas fa-lock"></i></label>
                            <asp:TextBox ID="Password" runat="server" placeholder="Password" ReadOnly="true" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="fas fa-lock"></i></label>
                            <asp:TextBox ID="ChnPass" runat="server" placeholder="Change Password"></asp:TextBox>
                        </div>

                        <div class="form-group form-button">
                            <asp:Button class="form-submit " ID="Update" runat="server" Text="Change Password" OnClick="Update_Click" />
                            <asp:Button class="form-submit bg-danger" ID="Delete" runat="server" Text="Delete Account" OnClick="Delete_Click" />
                            <br />
                            <br />
                            <asp:LinkButton ID="Back" runat="server" Style="text-decoration: none !important" OnClick="Back_Click"><< Back To Home Page</asp:LinkButton>

                        </div>
                    </div>
                </div>
                <div class="col-lg-5 mx-3">
                    <h2>Your Profile</h2>
                    <br />
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="Name" runat="server" placeholder="Full Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-envelope"></i></label>
                        <asp:TextBox ID="Email" runat="server" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-birthday-cake"></i></label>
                        <asp:TextBox ID="DOB" runat="server" placeholder="DOB"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-mobile-alt"></i></label>
                        <asp:TextBox ID="Contact" runat="server" placeholder="Contact No."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-map-marker-alt"></i></label>
                        <asp:TextBox ID="City" runat="server" placeholder="City"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-map-marker-alt"></i></label>
                        <asp:TextBox ID="State" runat="server" placeholder="State"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-map-pin"></i></label>
                        <asp:TextBox ID="Pincode" runat="server" placeholder="Pincode"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pass"><i class="fas fa-map-pin"></i></label>
                        <asp:TextBox ID="Address" runat="server" placeholder="Address"></asp:TextBox>
                    </div>

                    <div class="form-group form-button">
                        <asp:Button class="form-submit" ID="Edit" runat="server" Text="Update" OnClick="Edit_Click" />

                    </div>
                </div>

            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12">
                    <article class="col">
                        <div class="card-body">
                            <h5 class="card-title">Your Activities</h5>
                            <br />
                            <div class="accordion" id="accordion_payment">
                                <article class="accordion-item">
                                    <h6 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false">
                                            Your Bookings &nbsp;<i class="fas fa-bookmark py-1"></i>
                                        </button>
                                    </h6>
                                    <div id="collapseOne" data-bs-parent="#accordion_payment" class="accordion-collapse collapse" style="">
                                        <div class="accordion-body scroll">
                                            <asp:ListView ID="ListView1" runat="server">
                                                <EmptyDataTemplate>
                                                    <table runat="server" style="">
                                                        <tr>
                                                            <td>No Bookings.</td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>
                                                <ItemTemplate>
                                                    <div class="row py-2">
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="AppDate" runat="server" Text='<%# Eval("appointment_date","{0:dd/MM/yyyy}") %>' CssClass="badge rounded-pill bg-info"></asp:Label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    An Appointment has been booked by you for <%# Eval("package_name") %>.
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <%# Eval("Status") %>
                                                                </div>
                                                                <div class="col-md-1">

                                                                    <small><%# Eval("appointment_date","{0: h:mm tt}") %></small>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="dropdown-divider"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>

                                    </div>

                                </article>
                                <!-- accardion-item end.// -->
                                <article class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false">
                                            Your Wishlist &nbsp; <i class="fas fa-heart py-1" style="color: red"></i>
                                        </button>

                                    </h2>
                                    <div id="collapseTwo" data-bs-parent="#accordion_payment" class="accordion-collapse collapse" style="">
                                        <div class="accordion-body scroll">

                                            <section class="py-5">
                                                <div class="row">
                                                    <aside class="col">
                                                        <div class="card">
                                                            <article class="card-body">
                                                                <h4 class="card-title">Booking Details</h4>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="serviceid">

                                                                            <EmptyDataTemplate>
                                                                                <table runat="server" style="">
                                                                                    <tr>
                                                                                        <td>Your Wishlist is empty</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EmptyDataTemplate>
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td style="padding: 15px;">
                                                                                        <div class="row px-4 my-3">
                                                                                            <div class="col-md-2">
                                                                                                <asp:Image ID="Image" Height="100" Width="100" CssClass="card-img" runat="server" ImageUrl='<%# Eval("serviceimage") %>' />
                                                                                            </div>
                                                                                            <div class="col-md-10 ">
                                                                                                <%# Eval("servicename") %>
                                                                                                <ul>
                                                                                                    <li><%# Eval("servicecategory") %> </li>
                                                                                                    <li><%# Eval("servicedesc") %> </li>
                                                                                                    <li>
                                                                                                        <span class="price h5">&#x20B9; <%# Eval("serviceprice") %></span>

                                                                                                    </li>
                                                                                                </ul>

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
                                                                <asp:Button ID="info" CssClass="btn btn-primary col-3" runat="server" Text="view" PostBackUrl="~/Wishlist.aspx" />
                                                            </article>
                                                        </div>

                                                    </aside>
                                                </div>
                                            </section>
                                        </div>

                                    </div>

                                </article>
                                
                            </div>
                            
                        </div>
                        
                    </article>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
