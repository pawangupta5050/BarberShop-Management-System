<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminchat.aspx.cs" Inherits="Salon_Management.Adminchat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstarp/CSS/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstarp/JS/bootstrap.bundle.min.js"></script>
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container"> 

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                <i class="fas fa-comment"></i>
            </button>
        </div>

        <!-- The Modal -->
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

                        <div class="container">
                            <div class="card card-danger direct-chat direct-chat-danger">
                                <div class="card-header">
                                    <h3 class="card-title">Direct Chat</h3>

                                </div>
                                <div class="card-body">
                                    <!-- Conversations are loaded here -->
                                    <div class="direct-chat-messages">
                                        <asp:ListView ID="ListView1" runat="server">
                                            <ItemTemplate>
                                                <!-- Message. Default to the left -->
                                                <div class="direct-chat-msg">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-left">User</span>
                                                        <span class="direct-chat-timestamp float-right"><%# Eval("time","{0:HH:mm}") %></span>
                                                    </div>
                                                    <img class="direct-chat-img" src="image/User_logo.jpg" />
                                                    <div class="direct-chat-text">
                                                        <asp:Label ID="usermssg" runat="server" Text='<%# Eval("usermssg") %>'></asp:Label>
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->
                                                <!-- Message to the right -->
                                                <div class="direct-chat-msg right">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-right">You</span>
                                                        <span class="direct-chat-timestamp float-left"><%# Eval("time","{0:HH:mm}") %></span>
                                                    </div>
                                                    <img class="direct-chat-img" src="image/Admin_logo.jpg" />
                                                    <div class="direct-chat-text">
                                                        <asp:Label ID="adminmssg" runat="server" Text='<%# Eval("adminmssg") %>'></asp:Label>
                                                    </div>


                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <!-- /.card-header -->

                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row px-2">
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
        </div>

        <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

    </form>
</body>
</html>
