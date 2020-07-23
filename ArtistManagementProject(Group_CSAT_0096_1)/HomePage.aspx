<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtistManagementProject_Group_CSAT_0096_1_.WebForm2" %>
<%@ Register TagPrefix="uc" TagName="CheckLogin" Src="~/CheckLogin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:CheckLogin runat="server" ></uc:CheckLogin>
    <h1>Welcome to Artist Management HOME PAGE</h1>

</asp:Content>
