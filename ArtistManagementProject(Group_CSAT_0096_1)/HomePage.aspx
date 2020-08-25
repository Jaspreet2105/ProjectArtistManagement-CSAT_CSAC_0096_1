<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm2" %>

<%@ Register TagPrefix="uc" TagName="CheckLogin" Src="~/CheckLogin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<uc:CheckLogin runat="server"></uc:CheckLogin>--%>
    <%--<h1>Welcome to Artist Management HOME PAGE</h1>--%>
    <%--<div class="container-fluid">
        <div class="row">
            <div class="col-md-9 col-sm-12" style="font-size:1.5em">
                Welcome to Artist Management HOME PAGE
            </div>
        </div>
    </div>--%>
    <div class="bg-image"></div>

    <div class="bg-text">
        <h1>ARTIST MANAGEMENT</h1>
        <%--<hr style="color:white"/>--%>
        <%--<h2 style="">I am John Doe</h2>--%>
        <p style="font-size: 1.3em;">Artist Management is one of the leading Management companies in CANADA.We help artists at every level to build sustainable careers with trusted creative,collaborating,networking and Education.  </p>
        <br />
        <%--offset-3--%>
        <center>

        <div style="margin-left:30%" class="row">
            <div class="col-md-3">
                <a href="Login.aspx" class="btn btn-success btn-block btn-lg"  id="btnLogin" >Login</a>
            </div>
            <div class="col-md-3">
                <a href="SignUp.aspx" class="btn btn-info btn-block btn-lg"  id="btn_SignUp" >SignUp</a>
            </div>
        </div>
            </center>
    </div>
</asp:Content>
