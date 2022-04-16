<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="Salon_Management.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ul {
            list-style-type: disc;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<script>
        function geek() {

            var x =
                document.getElementById("btn").value;
            document.getElementById("g").innerHTML =
                x;
        }
    </script>--%>
    <div class="container py-5">
        <div class="row">
        </div>
    </div>
    <section class="py-5">
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <asp:HiddenField ID="UserStatus" runat="server" />
        <asp:HiddenField ID="UserImage" runat="server" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <asp:Image class="card-img-top mb-5 mb-md-0" ID="ProductImg" runat="server" />
                </div>
                <div class="col-md-6">
                    <div class="small mb-1">
                        <asp:Label ID="ServiceID" runat="server" Text="ServiceID"></asp:Label>

                    </div>
                    <h1 class="display-7 fw-bolder">
                        <asp:Label ID="ProductName" runat="server" Text="ProductName"></asp:Label></h1>
                    <div class="fs-5 mb-2">
                        <br />
                        <asp:Label ID="Tag" runat="server" Text="Tag" ForeColor="Green"></asp:Label>
                        <br />
                        <span>&#x20B9;<asp:Label ID="Cost" runat="server" Text="Label"></asp:Label></span> &nbsp;
                        <span class="text-decoration-line-through">&#x20B9;<asp:Label ID="DeclinedCost" runat="server" Text="Label"></asp:Label></span>
                    </div>
                    <p>
                        <asp:Label ID="Description" runat="server" Text="Description" Font-Size="Large"></asp:Label>

                    </p>
                    <br />
                    Quality Type: &nbsp;<asp:Label ID="Quality" runat="server" Text="Label"></asp:Label><br />
                    Service Category: &nbsp;<asp:Label ID="ServiceCat" runat="server" Text="Label"></asp:Label><br />
                    Service Name: &nbsp;<asp:Label ID="ServiceName" runat="server" Text="Label"></asp:Label><br />
                    <br />
                    <div class="d-flex gap-2 col-10">
                        <asp:DropDownList CssClass="form-control" ID="Stylist" runat="server"></asp:DropDownList>
                        <asp:TextBox ID="Date" runat="server" CssClass="form-control" placeholder="Select Date" TextMode="Date"></asp:TextBox>
                        <asp:DropDownList CssClass="form-control" ID="Time" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div class="d-flex">
                        <asp:Button class="btn btn-outline-dark col-5 flex-shrink-0 px-5" ID="Book" runat="server" Text="CheckOut" OnClick="Book_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />
    <section class="padding-y py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- =================== COMPONENT REVIEW ====================== -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Reviews </h5>
                            <hr>
                            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>No Reviews to this Product</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-md-1">
                                                        <asp:Image ID="CustomerImage" runat="server" class="img-fluid rounded-circle" ImageUrl='<%# Eval("CustomerImage") %>' Height="40px" Width="" />

                                                    </div>
                                                    <div class="col-md-8">

                                                        <asp:Label ID="CustomerName" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label><br />
                                                        <p>

                                                            <asp:Label ID="CustomerStatus" runat="server" Text='<%# Eval("CustomerStatus") %>'></asp:Label>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <p>

                                                            <asp:Label ID="Date" runat="server" Text='<%# Eval("Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="fa fa-ellipsis-v"></i>

                                                            </a>
                                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                                                <li>
                                                                    <asp:LinkButton class="dropdown-item" ID="Report" CommandName="Report" CommandArgument='<%# Eval("ReviewID") %>' runat="server">Report</asp:LinkButton>

                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-1">
                                                    </div>
                                                    <div class="col-md-11">
                                                        <p>
                                                            <asp:Label ID="Review" runat="server" Text='<%# Eval("Review") %>'></asp:Label></small>
                                                        </p>
                                                    </div>

                                                    <hr class="dropdown-divider" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                    </div>
                    <!-- =================== COMPONENT REVIEW .// ================== -->
                    <!-- =================== COMPONENT REVIEW ====================== -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Write a Review </h5>
                            <asp:TextBox ID="ProductReview" CssClass="form-control" TextMode="MultiLine" Rows="2" runat="server" placeholder="Leave Your Review here....."></asp:TextBox>
                            <p id="g"
                                style="font-size: 25px; color: green;">
                            </p>
                            <div class="mb-3">
                            </div>
                            <asp:Button class="btn btn-primary" ID="ProductCmt" runat="server" Text="Submit" OnClick="ProductCmt_Click" />
                        </div>

                    </div>
                    <!-- =================== COMPONENT REVIEW .// ================== -->

                </div>
                <!-- col.// -->
                <div class="col-lg-4">
                    <!-- =================== COMPONENT SELLER ====================== -->
                    <article class="card">
                        <div class="card-body">
                            <asp:Button ID="BtnReview" runat="server" class="btn w-100 btn-primary-light" Text="Write review" OnClick="BtnReview_Click" />
                            <%--<asp:Button  ID="BtnReview" runat="server" Text="" OnClientClick="myFunction()" />--%>

                            <!-- rating-wrap.// -->
                            <p class="mt-1 text-muted">
                                <asp:Label ID="ReviewCount" runat="server" Text="ReviewCount"></asp:Label>
                                review(s)
                            </p>
                            <table class="table table-borderless table-sm">
                                <tbody>
                                    <tr valign="middle">
                                        <td width="50">5+ R
                                        </td>
                                        <td>
                                            <div class="progress" style="height: 10px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 95%;" aria-valuenow="25" aria-valuemax="100">
                                                </div>

                                            </div>
                                            <!-- progress .// -->

                                        </td>
                                        <td width="50">95 % </td>

                                    </tr>
                                    <tr valign="middle">
                                        <td>4 R </td>
                                        <td>
                                            <div class="progress" style="height: 10px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemax="100">
                                                </div>

                                            </div>
                                            <!-- progress .// -->

                                        </td>
                                        <td>80 % </td>

                                    </tr>
                                    <tr valign="middle">
                                        <td>3 R </td>
                                        <td>
                                            <div class="progress" style="height: 10px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 35%;" aria-valuenow="35" aria-valuemax="100">
                                                </div>

                                            </div>
                                            <!-- progress .// -->

                                        </td>
                                        <td>35 % </td>

                                    </tr>
                                    <tr valign="middle">
                                        <td>2 R </td>
                                        <td>
                                            <div class="progress" style="height: 10px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 13%;" aria-valuenow="13" aria-valuemax="100">
                                                </div>

                                            </div>
                                            <!-- progress .// -->

                                        </td>
                                        <td>13 % </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td>1 R </td>
                                        <td>
                                            <div class="progress" style="height: 10px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 15%;" aria-valuenow="5" aria-valuemax="100">
                                                </div>

                                            </div>
                                            <!-- progress .// -->

                                        </td>
                                        <td>15 % </td>

                                    </tr>

                                </tbody>

                            </table>

                        </div>

                    </article>
                    <!-- =================== COMPONENT SELLER .// ================== -->

                </div>
                <!-- col.// -->

            </div>
            <!-- row .// -->

        </div>
        <!-- container .// -->

    </section>
</asp:Content>
