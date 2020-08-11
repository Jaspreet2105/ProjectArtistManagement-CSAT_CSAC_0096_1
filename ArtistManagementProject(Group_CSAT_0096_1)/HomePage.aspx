<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm2" %>

<%@ Register TagPrefix="uc" TagName="CheckLogin" Src="~/CheckLogin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:CheckLogin runat="server"></uc:CheckLogin>
    <%--<h1>Welcome to Artist Management HOME PAGE</h1>--%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 col-sm-12" style="font-size:1.5em">
                Welcome to Artist Management HOME PAGE
            </div>
        </div>
    </div>

</asp:Content>
