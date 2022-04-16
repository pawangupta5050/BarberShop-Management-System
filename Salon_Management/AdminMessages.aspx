<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminMessages.aspx.cs" Inherits="Salon_Management.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid my-4">
                <h1 class="mt-4">Messages</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">
                        <a href="Dashboard.aspx">Dashboard</a> / <a href="AdminMessages.aspx">Messages</a></li>
                </ol>
                <div class="row">
                    <div class="col-md-5 mx-auto">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
        <div class="container">
            <div class="card card-primary direct-chat direct-chat-primary">
                <div class="card-header">
                    <h3 class="card-title">
                        Message From
                        <asp:Label ID="Username" runat="server"></asp:Label>
                    </h3>
                    
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
                            <asp:LinkButton ID="send" CssClass="btn btn-success" runat="server" OnClick="send_Click" ><i class="fab fa-telegram-plane"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    </div>
                </div>


            </div>
        </main>
</asp:Content>
