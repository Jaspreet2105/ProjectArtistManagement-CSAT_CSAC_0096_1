﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br/>
                <br/>
                <br/>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img class="avtar-user" width="150px" src="images/userimg.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>LogIn</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%--<form id="formSignup" >--%>
                            <div class="row">
                                <div class="col">
                                    <label>User Name*</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_UserName" runat="server" placeholder="User Name"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txt_UserName" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <label>Password*</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <asp:requiredfieldvalidator id="requiredfieldvalidator2" runat="server" errormessage="Required" controltovalidate="txt_password" forecolor="red"></asp:requiredfieldvalidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btn_LogIn" runat="server" Text="LogIn" OnClick="btn_LogIn_Click" />
                                    </div>
                                    <%--<div class="form-group">
                                        <asp:Button class="btn btn-info btn-block btn-lg" ID="btn_SignUp" runat="server" Text="SignUp" OnClick="btn_SignUp_Click" PostBackUrl="~/SignUp.aspx" />
                                    </div>--%>
                                </div>
                            </div>
                        <%--</form>--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <%--<asp:Button class="btn btn-info btn-block btn-lg" ID="btn_SignUp" runat="server" Text="SignUp"  PostBackUrl="~/SignUp.aspx" />--%>
                                    <a href="SignUp.aspx" class="btn btn-info btn-block btn-lg"  id="btn_SignUp" >SignUp</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<a href="HomePage.aspx"><< Back to Home</a><br>--%>
                <asp:PlaceHolder ID="UserAdded" runat="server" />
                <br>
            </div>
        </div>
    </div>

</asp:Content>

